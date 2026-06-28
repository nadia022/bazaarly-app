// ─────────────────────────────────────────────────────────────
//  Single Brand card
// ─────────────────────────────────────────────────────────────

import 'package:bazarly_app/core/utils/colors/app_colors.dart';
import 'package:bazarly_app/core/utils/styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandCard extends StatelessWidget {
  const BrandCard();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: navigate to product details screen
      },
      child: Container(
        width: 150.w,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColors.borderLight),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Product image ────────────────────────────
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.r),
                    topRight: Radius.circular(12.r),
                  ),
                  child: Container(
                    height: 110.h,
                    width: double.infinity,
                    color: AppColors.backgroundLight,
                    // TODO: replace with Image.network(product.imageUrl)
                    child: Icon(
                      Icons.image_outlined,
                      color: AppColors.border,
                      size: 40.sp,
                    ),
                  ),
                ),

                // Wishlist heart icon
                Positioned(
                  top: 8.h,
                  right: 8.w,
                  child: GestureDetector(
                    onTap: () {
                      // TODO: toggle wishlist
                    },
                    child: Container(
                      padding: EdgeInsets.all(4.r),
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.favorite_border_rounded,
                        color: AppColors.textSecondary,
                        size: 16.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // ── Product info ─────────────────────────────
            Padding(
              padding: EdgeInsets.all(8.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product name — TODO: replace with product.name
                  Text(
                    'Product Name',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.bodyXSmallRg.copyWith(
                      color: AppColors.textPrimary,
                      fontSize: 11.sp,
                    ),
                  ),

                  SizedBox(height: 4.h),

                  // // Product price — TODO: replace with product.price
                  // Text(
                  //   'EGP 0.00',
                  //   style: AppStyles.bodySmallSb.copyWith(
                  //     color: AppColors.primary,
                  //     fontSize: 12.sp,
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
