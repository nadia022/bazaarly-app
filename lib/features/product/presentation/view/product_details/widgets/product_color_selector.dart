import 'package:bazarly_app/core/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A horizontal row of color circles.
/// The selected color shows a white checkmark in the center.
class ProductColorSelector extends StatefulWidget {
  const ProductColorSelector({super.key});

  @override
  State<ProductColorSelector> createState() => _ProductColorSelectorState();
}

class _ProductColorSelectorState extends State<ProductColorSelector> {
  // TODO: replace with product.colors from the model
  static const List<Color> _colors = [
    Colors.black,
    Colors.blue,
    AppColors.primary,
    Colors.redAccent,
  ];

  // Index of the currently selected color
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(_colors.length, (index) {
        final isSelected = index == _selectedIndex;
        return GestureDetector(
          onTap: () => setState(() => _selectedIndex = index),
          child: Container(
            margin: EdgeInsets.only(right: 10.w),
            width: 32.w,
            height: 32.h,
            decoration: BoxDecoration(
              color: _colors[index],
              shape: BoxShape.circle,
              // White border on selected to create a ring effect
              border: Border.all(
                color: isSelected ? AppColors.primary : Colors.transparent,
                width: 2.5,
              ),
            ),
            // Show a white checkmark on the selected color
            child: isSelected
                ? const Icon(Icons.check_rounded, color: Colors.white, size: 16)
                : null,
          ),
        );
      }),
    );
  }
}
