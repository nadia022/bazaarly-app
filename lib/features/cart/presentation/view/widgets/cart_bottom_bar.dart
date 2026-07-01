import 'package:bazarly_app/core/utils/colors/app_colors.dart';
import 'package:bazarly_app/core/utils/styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartBottomBar extends StatelessWidget {
  const CartBottomBar({super.key, required this.total});
  final double total;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 24.h),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Row(
        children: [
          // ── Total price ─────────────────────────────────────
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Total price',
                style: TextStyle(fontSize: 12.sp, color: AppColors.primary),
              ),
              SizedBox(height: 2.h),
              Text(
                'EGP ${total.toStringAsFixed(0)}',
                style: AppStyles.bodySmallSb.copyWith(
                  fontSize: 16.sp,
                  color: AppColors.primaryDark,
                ),
              ),
            ],
          ),

          SizedBox(width: 16.w),

          // ── Checkout button ─────────────────────────────────
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {
                // TODO: navigate to checkout screen
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 14.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.r),
                ),
                elevation: 0,
              ),
              label: Text(
                'Check Out',
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
              ),
              icon: const Icon(Icons.arrow_forward_rounded),
              iconAlignment: IconAlignment.end,
            ),
          ),
        ],
      ),
    );
  }
}
