import 'package:bazarly_app/core/utils/colors/app_colors.dart';
import 'package:bazarly_app/core/utils/styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductNameAndBrand extends StatelessWidget {
  const ProductNameAndBrand({
    super.key,
    required this.brand,
    required this.name,
  });

  final String brand;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Brand name
        Text(
          brand,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: AppStyles.bodySmallSb.copyWith(
            color: AppColors.textPrimary,
            fontSize: 11.sp,
          ),
        ),

        SizedBox(height: 2.h),

        // Product name — truncated to 1 line
        Text(
          name,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: AppStyles.bodyXSmallRg.copyWith(
            color: AppColors.textSecondary,
            fontSize: 10.sp,
          ),
        ),
      ],
    );
  }
}
