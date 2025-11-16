import 'package:flutter/material.dart';
import 'package:grabby_app/core/constant/app_colors.dart';
import 'package:grabby_app/core/constant/app_string.dart';
import 'package:grabby_app/core/constant/app_routes.dart';

// ADD THESE IMPORTS
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

import '../../services/email_services.dart';
import '../../services/otp_services.dart';
import '../onboaring/widgets/custom_buttom.dart';
import '../onboaring/widgets/otp_input.dart';

class VerificationScreen extends StatefulWidget {
  final String? email;

  const VerificationScreen({super.key, this.email});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final GlobalKey<FormState> _otpInputKey = GlobalKey<FormState>();
  String _otp = '';
  bool _isLoading = false;
  bool _canResend = false;
  int _resendCountdown = 60;
  Timer? _countdownTimer;

  @override
  void initState() {
    super.initState();
    _startResendCountdown();
  }

  @override
  void dispose() {
    _countdownTimer?.cancel();
    super.dispose();
  }

  void _startResendCountdown() {
    setState(() {
      _canResend = false;
      _resendCountdown = 60;
    });

    _countdownTimer?.cancel();
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_resendCountdown > 0) {
          _resendCountdown--;
        } else {
          _canResend = true;
          timer.cancel();
        }
      });
    });
  }

  Future<void> _handleVerification(String otp) async {
    if (otp.length != 6) {
      _showError('Please enter complete verification code');
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      // Get current user ID
      final user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        _showError('User not found. Please login again.');
        setState(() {
          _isLoading = false;
        });
        return;
      }

      // Verify OTP with Firebase
      final result = await OTPService.instance.verifyOTP(
        userId: user.uid,
        enteredOTP: otp,
      );

      setState(() {
        _isLoading = false;
      });

      if (result['success']) {
        // Show success message
        _showSuccess(result['message']);

        // Send welcome email (optional)
        await EmailService.instance.sendWelcomeEmail(
          email: widget.email ?? user.email ?? '',
          userName: user.displayName ?? 'User',
        );

        // Wait a moment for user to see success message
        await Future.delayed(const Duration(seconds: 1));

        // Navigate to main screen
        if (mounted) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRoutes.main_screen,
            (route) => false,
          );
        }
      } else {
        // Show error message from Firebase
        _showError(result['message']);
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      _showError('Verification failed. Please try again.');
      print('Verification error: $e');
    }
  }

  Future<void> _handleResendCode() async {
    if (!_canResend || _isLoading) return;

    setState(() {
      _isLoading = true;
    });

    try {
      // Get current user
      final user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        _showError('User not found. Please login again.');
        setState(() {
          _isLoading = false;
        });
        return;
      }

      // Generate and send new OTP
      final otp = await OTPService.instance.resendOTP(userId: user.uid);

      // Send OTP email
      await EmailService.instance.sendOTPEmail(
        email: widget.email ?? user.email ?? '',
        otp: otp,
        userName: user.displayName ?? 'User',
      );

      setState(() {
        _isLoading = false;
      });

      // Show success message
      _showSuccess('New verification code sent to your email!');

      // // Clear OTP input
      // _otpInputKey.currentState?.clear();
      // setState(() {
      //   _otp = otp;
      // });

      // Restart countdown
      _startResendCountdown();
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      _showError('Failed to resend code. Please try again.');
      print('Resend error: $e');
    }
  }

  void _showError(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _showSuccess(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),

              // Title
              Text(
                AppStrings.activateAccount,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 12),

              // Subtitle
              Text(
                AppStrings.verificationCodeSent,
                style: TextStyle(
                  fontSize: 17,
                  color: const Color.fromARGB(255, 28, 23, 23),
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),

              if (widget.email != null) ...[
                const SizedBox(height: 8),
                Text(
                  widget.email!,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],

              const SizedBox(height: 40),

              // Illustration
              Image.asset(
                'assets/icons/verification.png',
                height: 200,
                errorBuilder: (context, error, stackTrace) {
                  // Fallback if image not found
                  return Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(
                      Icons.mark_email_read,
                      size: 100,
                      color: AppColors.primary.withOpacity(0.5),
                    ),
                  );
                },
              ),

              const SizedBox(height: 40),

              // OTP Input
              OtpInput(
                key: _otpInputKey,
                length: 6,
                onCompleted: _handleVerification,
                onChanged: (value) {
                  setState(() {
                    _otp = value;
                  });
                },
              ),

              const SizedBox(height: 32),

              // Resend Code Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didn't receive code? ",
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  GestureDetector(
                    onTap: _canResend && !_isLoading ? _handleResendCode : null,
                    child: Text(
                      _canResend
                          ? AppStrings.resendCode
                          : 'Resend in ${_resendCountdown}s',
                      style: TextStyle(
                        fontSize: 14,
                        color: _canResend
                            ? AppColors.primary
                            : AppColors.textHint,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 32),

              // Verify Button
              CustomButton(
                text: AppStrings.verify,
                onPressed: _otp.length == 6 && !_isLoading
                    ? () => _handleVerification(_otp)
                    : null,
                isLoading: _isLoading,
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
