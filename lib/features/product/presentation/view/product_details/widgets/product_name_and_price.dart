import 'package:bazarly_app/core/utils/colors/app_colors.dart';
import 'package:bazarly_app/core/utils/styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Displays the product brand/name on the left
/// and the price on the right in a single row.
class ProductNameAndPrice extends StatelessWidget {
  const ProductNameAndPrice({
    super.key,
    required this.name,
    required this.price,
  });

  /// Product brand or name (e.g. 'Nike Air Jordon')
  final String name;

  /// Formatted price string (e.g. 'EGP 3,500')
  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Product brand / name
        Text(
          name,
          style: AppStyles.titleMediumSb.copyWith(
            color: AppColors.primaryDark,
            fontSize: 16.sp,
          ),
        ),

        // Product price
        Text(
          price,
          style: AppStyles.bodySmallSb.copyWith(
            color: AppColors.primaryDark,
            fontSize: 14.sp,
          ),
        ),
      ],
    );
  }
}
