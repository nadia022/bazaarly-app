import 'package:bazarly_app/core/utils/colors/app_colors.dart';
import 'package:bazarly_app/core/utils/styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SoldCountBadgeAndRating extends StatelessWidget {
  const SoldCountBadgeAndRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        //sold count badge
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.border),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Text(
            '3,230 Sold', // TODO: product.soldCount
            style: AppStyles.bodyXSmallRg.copyWith(
              color: AppColors.textSecondary,
              fontSize: 10.sp,
            ),
          ),
        ),
        SizedBox(width: 16.w),

        // Star rating
        Row(
          children: [
            Icon(Icons.star_rounded, color: Colors.amber, size: 16.sp),
            SizedBox(width: 2.w),
            Text(
              '4.8 (7,500)', // TODO: product.rating
              style: AppStyles.bodyXSmallRg.copyWith(
                color: AppColors.textSecondary,
                fontSize: 10.sp,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
