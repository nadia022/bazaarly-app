// ─────────────────────────────────────────────────────────────
//  Pinned bottom bar
// ─────────────────────────────────────────────────────────────

import 'package:bazarly_app/core/utils/colors/app_colors.dart';
import 'package:bazarly_app/core/utils/styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Row(
        children: [
          // Total price label + value
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Total price',
                style: AppStyles.bodyXSmallRg.copyWith(
                  color: AppColors.textSecondary,
                  fontSize: 10.sp,
                ),
              ),
              Text(
                'EGP 3,500', // TODO: calculated total price
                style: AppStyles.bodySmallSb.copyWith(
                  color: AppColors.primary,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),

          SizedBox(width: 16.w),

          // Add to cart button
          Expanded(
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 14.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.r),
                ),
              ),
              onPressed: () {
                // TODO: dispatch AddToCart event
              },
              icon: const Icon(Icons.shopping_cart_outlined, size: 20),
              label: Text('Add to cart', style: AppStyles.buttonLarge),
            ),
          ),
        ],
      ),
    );
  }
}
