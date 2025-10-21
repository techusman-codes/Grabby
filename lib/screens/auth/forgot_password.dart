import 'package:flutter/material.dart';
import 'package:grabby_app/core/constant/app_colors.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Forgot Password')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.lock_reset, size: 100, color: AppColors.primary),
            const SizedBox(height: 24),
            Text(
              'Forgot Password Screen',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            const Text('Coming soon...'),
          ],
        ),
      ),
    );
  }
}
