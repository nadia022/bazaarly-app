import 'package:bazarly_app/core/utils/assets/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A stateless widget that displays the app logo
/// at the top of the sign-up screen.
class SignUpIntro extends StatelessWidget {
  const SignUpIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.imagesBazaarlyLogoPNG,
      height: 45.h,
      fit: BoxFit.contain,
    );
  }
}
