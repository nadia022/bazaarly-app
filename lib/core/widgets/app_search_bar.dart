import 'package:bazarly_app/core/utils/colors/app_colors.dart';
import 'package:bazarly_app/core/utils/styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Search bar at the top of the home screen with a cart icon.
class AppSearchBar extends StatelessWidget {
  const AppSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        children: [
          // ── Search input ──────────────────────────────────
          Expanded(
            child: Container(
              height: 48.h,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(24.r),
                border: Border.all(color: AppColors.primary, width: 1.5),
              ),
              child: Row(
                children: [
                  SizedBox(width: 12.w),
                  Icon(
                    Icons.search_rounded,
                    color: AppColors.primary,
                    size: 22.sp,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    'what do you search for?',
                    style: AppStyles.bodyMediumRg.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(width: 12.w),

          // ── Cart icon ─────────────────────────────────────
          GestureDetector(
            onTap: () {
              // TODO: navigate to cart screen
            },
            child: Icon(
              Icons.shopping_cart_outlined,
              color: AppColors.primary,
              size: 28.sp,
            ),
          ),
        ],
      ),
    );
  }
}