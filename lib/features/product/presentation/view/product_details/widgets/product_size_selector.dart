import 'package:bazarly_app/core/utils/colors/app_colors.dart';
import 'package:bazarly_app/core/utils/styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A horizontal row of size chips.
/// The selected size is highlighted in primary green.
class ProductSizeSelector extends StatefulWidget {
  const ProductSizeSelector({super.key});

  @override
  State<ProductSizeSelector> createState() => _ProductSizeSelectorState();
}

class _ProductSizeSelectorState extends State<ProductSizeSelector> {
  // TODO: replace with product.sizes from the model
  static const List<String> _sizes = ['38', '39', '40', '41', '42'];

  // Index of the currently selected size
  int _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(_sizes.length, (index) {
        final isSelected = index == _selectedIndex;
        return GestureDetector(
          onTap: () => setState(() => _selectedIndex = index),
          child: Container(
            margin: EdgeInsets.only(right: 8.w),
            width: 38.w,
            height: 38.h,
            decoration: BoxDecoration(
              // Filled green when selected, transparent otherwise
              color: isSelected ? AppColors.primary : Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? AppColors.primary : AppColors.border,
              ),
            ),
            child: Center(
              child: Text(
                _sizes[index],
                style: AppStyles.bodyXSmallRg.copyWith(
                  color: isSelected ? Colors.white : AppColors.textPrimary,
                  fontSize: 11.sp,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}