// ─────────────────────────────────────────────────────────────
//  Current price + old crossed-out price
// ─────────────────────────────────────────────────────────────

import 'package:bazarly_app/core/utils/colors/app_colors.dart';
import 'package:bazarly_app/core/utils/styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PriceRow extends StatelessWidget {
  const PriceRow({required this.currentPrice, required this.oldPrice});

  final String currentPrice;
  final String oldPrice;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Current price in primary green
        Text(
          currentPrice,
          style: AppStyles.bodySmallSb.copyWith(
            color: AppColors.primary,
            fontSize: 11.sp,
          ),
        ),

        SizedBox(width: 6.w),

        // Old price with a strikethrough
        Text(
          oldPrice,
          style: AppStyles.bodyXSmallRg.copyWith(
            color: AppColors.textSecondary,
            fontSize: 9.sp,
            decoration: TextDecoration.lineThrough,
            decorationColor: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
