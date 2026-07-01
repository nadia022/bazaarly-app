import 'package:bazarly_app/core/utils/colors/app_colors.dart';
import 'package:bazarly_app/core/utils/styles/app_styles.dart';
import 'package:bazarly_app/features/cart/presentation/view/widgets/cart_item_badge.dart';
import 'package:bazarly_app/features/cart/presentation/view/widgets/cart_quantiti_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.color,
    required this.size,
    required this.price,
    required this.quantity,
    required this.onDelete,
    required this.onIncrement,
    required this.onDecrement,
  });

  final String imageUrl;
  final String name;
  final String color;
  final String size;
  final String price;
  final int quantity;
  final VoidCallback onDelete;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.primary),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Product image ──────────────────────────────────
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.network(
              imageUrl,
              width: 80.w,
              height: 80.h,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                width: 80.w,
                height: 80.h,
                color: const Color(0xFFF5F5F5),
              ),
            ),
          ),

          SizedBox(width: 12.w),

          // ── Info ───────────────────────────────────────────
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── Name + delete icon ─────────────────────
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        style: AppStyles.bodySmallSb.copyWith(
                          fontSize: 14.sp,
                          color: AppColors.primaryDark,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: onDelete,
                      child: Icon(
                        Icons.delete_outline_rounded,
                        color: AppColors.primary,
                        size: 22.sp,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 4.h),

                // ── Color + size badges ────────────────────
                Row(
                  children: [
                    CartItemBadge(label: color, dotColor: Colors.orange),
                    SizedBox(width: 6.w),
                    CartItemBadge(label: 'Size: $size'),
                  ],
                ),

                SizedBox(height: 8.h),

                // ── Price + quantity stepper ───────────────
                Row(
                  children: [
                    Text(
                      'EGP $price',
                      style: AppStyles.bodySmallSb.copyWith(
                        fontSize: 14.sp,
                        color: AppColors.primary,
                      ),
                    ),
                    const Spacer(),
                    CartQuantityStepper(
                      quantity: quantity,
                      onIncrement: onIncrement,
                      onDecrement: onDecrement,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
