

import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';

class OTPService {
  static final OTPService _instance = OTPService._internal();
  factory OTPService() => _instance;
  OTPService._internal();
  static OTPService get instance => _instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // ============================================================================
  // GENERATE 6-DIGIT OTP
  // ============================================================================
  String generateOTP() {
    // Generate random 6-digit number
    final random = Random();
    final otp = (100000 + random.nextInt(900000)).toString();
    return otp;
  }

  // ============================================================================
  // SAVE OTP TO FIRESTORE
  // ============================================================================
  Future<String> saveOTP({required String userId}) async {
    try {
      // Generate new OTP
      final otp = generateOTP();
      
      // Calculate expiry time (10 minutes from now)
      final now = DateTime.now();
      final expiryTime = now.add(const Duration(minutes: 5));

      // Save to Firestore
      await _firestore.collection('users').doc(userId).update({
        'otp': otp,
        'otpCreatedAt': FieldValue.serverTimestamp(),
        'otpExpiresAt': Timestamp.fromDate(expiryTime),
        'emailVerified': false,
      });

      print('✅ OTP generated: $otp (Valid for 10 minutes)');
      return otp;
    } catch (e) {
      print('❌ Error saving OTP: $e');
      throw Exception('Failed to generate OTP');
    }
  }

  // ============================================================================
  // VERIFY OTP
  // ============================================================================
  Future<Map<String, dynamic>> verifyOTP({
    required String userId,
    required String enteredOTP,
  }) async {
    try {
      // Get user document
      final userDoc = await _firestore.collection('users').doc(userId).get();
      
      if (!userDoc.exists) {
        return {
          'success': false,
          'message': 'User not found',
        };
      }

      final userData = userDoc.data()!;
      final storedOTP = userData['otp'] as String?;
      final otpExpiresAt = userData['otpExpiresAt'] as Timestamp?;

      // Check if OTP exists
      if (storedOTP == null) {
        return {
          'success': false,
          'message': 'No OTP found. Please request a new one.',
        };
      }

      // Check if OTP has expired
      if (otpExpiresAt != null) {
        final expiryDate = otpExpiresAt.toDate();
        if (DateTime.now().isAfter(expiryDate)) {
          return {
            'success': false,
            'message': 'OTP has expired. Please request a new one.',
          };
        }
      }

      // Verify OTP matches
      if (storedOTP != enteredOTP) {
        return {
          'success': false,
          'message': 'Invalid OTP. Please try again.',
        };
      }

      // OTP is correct! Mark user as verified
      await _firestore.collection('users').doc(userId).update({
        'emailVerified': true,
        'otp': null, // Clear OTP after verification
        'otpCreatedAt': null,
        'otpExpiresAt': null,
        'verifiedAt': FieldValue.serverTimestamp(),
      });

      return {
        'success': true,
        'message': 'Email verified successfully!',
      };
    } catch (e) {
      print('❌ Error verifying OTP: $e');
      return {
        'success': false,
        'message': 'Verification failed. Please try again.',
      };
    }
  }

  // ============================================================================
  // RESEND OTP (Generate new OTP)
  // ============================================================================
  Future<String> resendOTP({required String userId}) async {
    return await saveOTP(userId: userId);
  }
}

