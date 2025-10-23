import 'package:flutter/material.dart';
import 'package:grabby_app/core/constant/app_colors.dart';
import 'package:grabby_app/core/constant/app_routes.dart';
import 'package:grabby_app/core/constant/app_string.dart';
import 'package:grabby_app/screens/onboaring/widgets/custom_buttom.dart';
import 'package:grabby_app/screens/onboaring/widgets/otp_input.dart';
import 'dart:async';

/// Email verification screen
///
/// Allows users to enter OTP code sent to their email
class VerificationScreen extends StatefulWidget {
  /// Email address where code was sent
  final String? email;

  const VerificationScreen({super.key, this.email});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  /// Current OTP value
  String _otp = '';

  /// Loading state
  bool _isLoading = false;

  /// Resend countdown timer
  int _resendCountdown = 60;
  Timer? _timer;
  bool _canResend = false;

  /// OTP input key (to clear input)
  final GlobalKey _otpInputKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _startResendTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  /// Start countdown timer for resend button
  void _startResendTimer() {
    setState(() {
      _resendCountdown = 60;
      _canResend = false;
    });

    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_resendCountdown > 0) {
        setState(() {
          _resendCountdown--;
        });
      } else {
        setState(() {
          _canResend = true;
        });
        timer.cancel();
      }
    });
  }

  /// Handle OTP completion
  Future<void> _handleVerification(String otp) async {
    setState(() {
      _otp = otp;
      _isLoading = true;
    });

    try {
      // Simulate API call
      await Future.delayed(Duration(seconds: 2));

      debugPrint('Verifying OTP: $otp');

      // TODO: Implement actual verification with backend
      // For demo, accept any 6-digit code
      if (otp.length == 6) {
        if (mounted) {
          _showSnackBar(AppStrings.verificationSuccess, isError: false);

          // Navigate to home or login
          await Future.delayed(Duration(seconds: 1));
          Navigator.of(context).pushReplacementNamed(AppRoutes.login);
        }
      } else {
        throw Exception('Invalid code');
      }
    } catch (e) {
      if (mounted) {
        _showSnackBar(AppStrings.invalidCode, isError: true);

        // Clear OTP input
        // Note: We'll need to add a clear method to OtpInput
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  /// Handle resend code
  Future<void> _handleResendCode() async {
    if (!_canResend) return;

    setState(() {
      _isLoading = true;
    });

    try {
      // Simulate API call
      await Future.delayed(Duration(seconds: 2));

      debugPrint('Resending code to: ${widget.email}');

      if (mounted) {
        _showSnackBar(AppStrings.codeResent, isError: false);
        _startResendTimer();
      }
    } catch (e) {
      if (mounted) {
        _showSnackBar('Failed to resend code', isError: true);
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  /// Show snackbar message
  void _showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? AppColors.error : AppColors.success,
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
