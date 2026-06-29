import 'package:bazarly_app/core/utils/assets/app_images.dart';
import 'package:bazarly_app/core/utils/styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A stateless widget that displays the app logo, welcome title,
/// and subtitle at the top of the login screen.
class LoginIntro extends StatelessWidget {
  const LoginIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // App logo loaded from assets
        Image.asset(
          AppImages.imagesBazaarlyLogoPNG,
          height: 45.h,
          fit: BoxFit.contain,
        ),

        SizedBox(height: 50.h),

        // Main welcome title
        Text(
          'Welcome Back to Bazaarly',
          style: AppStyles.titleMediumSb.copyWith(color: Colors.white),
        ),

        SizedBox(height: 4.h),

        // Subtitle instructing user to sign in with email
        Text(
          'Please sign in with your mail',
          style: AppStyles.bodyMediumRg.copyWith(
            // ignore: deprecated_member_use
            color: Colors.white.withOpacity(0.8),
          ),
        ),
      ],
    );
  }
}
