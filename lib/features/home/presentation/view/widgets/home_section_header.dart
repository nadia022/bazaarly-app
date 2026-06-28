import 'package:bazarly_app/core/utils/colors/app_colors.dart';
import 'package:bazarly_app/core/utils/styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeSectionHeader extends StatelessWidget {
   HomeSectionHeader({super.key,required this.sectionTitle, this.onViewAllPressed});
  VoidCallback? onViewAllPressed;
  String sectionTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                sectionTitle,
                style: AppStyles.titleMediumSb.copyWith(
                  color: AppColors.textPrimary,
                  fontSize: 16.sp,
                ),
              ),
              GestureDetector(
                onTap: onViewAllPressed,
                child: Text(
                  'view all',
                  style: AppStyles.bodySmallMd.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
        );
  }
}