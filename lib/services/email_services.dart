

class EmailService {
  static final EmailService _instance = EmailService._internal();
  factory EmailService() => _instance;
  EmailService._internal();
  static EmailService get instance => _instance;

  // ============================================================================
  // SEND OTP EMAIL (Fake - just prints to console)
  // ============================================================================
  Future<bool> sendOTPEmail({
    required String email,
    required String otp,
    required String userName,
  }) async {
    try {

      
      print('\n' + '='*50);
      print('📧 EMAIL SENT TO: $email');
      print('='*50);
      print('Subject: Verify Your Grabby Account');
      print('\nHi $userName,\n');
      print('Your verification code is:\n');
      print('   ╔═══════════╗');
      print('   ║  $otp  ║');
      print('   ╚═══════════╝');
      print('\nThis code will expire in 10 minutes.');
      print('='*50 + '\n');

      // Simulate email sending delay
      await Future.delayed(const Duration(seconds: 1));
      
      return true;
    } catch (e) {
      print('❌ Error sending email: $e');
      return false;
    }
  }

  // ============================================================================
  // SEND WELCOME EMAIL
  // ============================================================================
  Future<bool> sendWelcomeEmail({
    required String email,
    required String userName,
  }) async {
    try {
      print('\n' + '='*50);
      print('📧 WELCOME EMAIL SENT TO: $email');
      print('='*50);
      print('Subject: Welcome to Grabby!\n');
      print('Hi $userName,\n');
      print('Welcome to Grabby! Your account has been verified.');
      print('You can now start shopping!\n');
      print('='*50 + '\n');

      return true;
    } catch (e) {
      print('❌ Error sending welcome email: $e');
      return false;
    }
  }
}

