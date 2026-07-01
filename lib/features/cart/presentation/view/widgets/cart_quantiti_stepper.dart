import 'package:bazarly_app/core/utils/colors/app_colors.dart';
import 'package:bazarly_app/features/cart/presentation/view/widgets/cart_stepper_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartQuantityStepper extends StatelessWidget {
  const CartQuantityStepper({
    super.key,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CartStepperBtn(icon: Icons.remove, onTap: onDecrement),
        SizedBox(width: 10.w),
        Text(
          '$quantity',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(width: 10.w),
        CartStepperBtn(icon: Icons.add, onTap: onIncrement),
      ],
    );
  }
}