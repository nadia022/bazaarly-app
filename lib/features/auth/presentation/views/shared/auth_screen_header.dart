import 'package:bazarly_app/core/utils/colors/app_colors.dart';
import 'package:bazarly_app/core/utils/styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

/// Shared green header used across all forgot-password screens.
/// Shows a back button, a Lottie animation, and the screen [title].
class AuthScreenHeader extends StatelessWidget {
  const AuthScreenHeader({
    super.key,
    required this.title,
    required this.lottiePath,
  });

  /// Screen title shown below the Lottie animation
  final String title;

  /// Path to the Lottie JSON asset file
  final String lottiePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 12.h, bottom: 16.h),
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      child: Column(
        children: [
          // Back button — pops the current route
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: GestureDetector(
                onTap: () => context.pop(),
                child: Container(
                  width: 36.w,
                  height: 36.h,
                  decoration: BoxDecoration(
                    // ignore: deprecated_member_use
                    color: Colors.white.withOpacity(0.25),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 8.h),

          // Lottie illustration specific to each screen
          Lottie.asset(
            lottiePath,
            height: 200.h,
            width: 200.w,
            fit: BoxFit.contain,
            repeat: true,
          ),

          SizedBox(height: 12.h),

          // Screen title
          Text(
            title,
            style: AppStyles.titleMediumSb.copyWith(
              color: Colors.white,
              fontSize: 22.sp,
            ),
          ),
        ],
      ),
    );
  }
}
