import 'package:bazarly_app/core/utils/colors/app_colors.dart';
import 'package:bazarly_app/core/utils/styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A quantity counter with minus and plus buttons.
/// The count cannot go below 1.
class ProductQuantitySelector extends StatefulWidget {
  const ProductQuantitySelector({super.key});

  @override
  State<ProductQuantitySelector> createState() =>
      _ProductQuantitySelectorState();
}

class _ProductQuantitySelectorState extends State<ProductQuantitySelector> {
  // Current quantity — starts at 1
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: AppColors.backgroundLight,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Minus button — disabled when quantity is 1
          GestureDetector(
            onTap: _quantity > 1 ? () => setState(() => _quantity--) : null,
            child: Icon(
              Icons.remove_circle_outline_rounded,
              color: _quantity > 1 ? AppColors.primary : AppColors.border,
              size: 22.sp,
            ),
          ),

          SizedBox(width: 10.w),

          // Current quantity
          Text(
            '$_quantity',
            style: AppStyles.bodySmallSb.copyWith(
              color: AppColors.textPrimary,
              fontSize: 14.sp,
            ),
          ),

          SizedBox(width: 10.w),

          // Plus button
          GestureDetector(
            onTap: () => setState(() => _quantity++),
            child: Icon(
              Icons.add_circle_outline_rounded,
              color: AppColors.primary,
              size: 22.sp,
            ),
          ),
        ],
      ),
    );
  }
}
