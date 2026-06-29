// ─────────────────────────────────────────────────────────────
//  Star rating + review count + add-to-cart button
// ─────────────────────────────────────────────────────────────

import 'package:bazarly_app/core/utils/colors/app_colors.dart';
import 'package:bazarly_app/core/utils/styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewAndCartRow extends StatelessWidget {
  const ReviewAndCartRow({
    required this.rating,
    required this.onAddToCart,
  });

  final double rating;
  final VoidCallback onAddToCart;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Review score with a star icon
        Row(
          children: [
            Text(
              'Review ($rating)',
              style: AppStyles.bodyXSmallRg.copyWith(
                color: AppColors.textSecondary,
                fontSize: 9.sp,
              ),
            ),
            SizedBox(width: 2.w),
            Icon(Icons.star_rounded, color: Colors.amber, size: 13.sp),
          ],
        ),

        // Green circular add-to-cart button
        GestureDetector(
          onTap: onAddToCart,
          child: Container(
            width: 26.w,
            height: 26.h,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.add_rounded, color: Colors.white, size: 18.sp),
          ),
        ),
      ],
    );
  }
}