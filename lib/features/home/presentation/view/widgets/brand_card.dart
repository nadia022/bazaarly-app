// ─────────────────────────────────────────────────────────────
//  Single Brand card
// ─────────────────────────────────────────────────────────────
import 'package:bazarly_app/core/utils/colors/app_colors.dart';
import 'package:bazarly_app/core/utils/styles/app_styles.dart';
import 'package:bazarly_app/features/home/data/models/home_scetion_response/item_reponse.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Single brand card: image on top + brand name below.
///
/// Used inside both the real list and the Skeletonizer placeholder list,
/// so its layout must stay identical in both cases.
class BrandCard extends StatelessWidget {
  const BrandCard({super.key, required this.item});

  final ItemResponse item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: navigate to brand products screen
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
            // ── Brand image ──────────────────────────────
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.r),
                topRight: Radius.circular(12.r),
              ),
              child: CachedNetworkImage(
                imageUrl: item.image ?? '',
                fit: BoxFit.cover,
                width: double.infinity,
                height: 110.h,
                // Empty container — Skeletonizer will paint shimmer over it
                // while loading, so no spinner is needed here
                placeholder: (context, url) => Container(
                  width: double.infinity,
                  height: 110.h,
                  color: AppColors.backgroundLight,
                ),
                // Fallback icon shown when the image URL is invalid or unreachable
                errorWidget: (context, url, error) => Container(
                  width: double.infinity,
                  height: 110.h,
                  color: AppColors.backgroundLight,
                  child: Icon(
                    Icons.image_not_supported_outlined,
                    color: AppColors.border,
                  ),
                ),
              ),
            ),

            // ── Brand name ───────────────────────────────
            Padding(
              padding: EdgeInsets.all(8.r),
              child: Text(
                item.name ?? 'No Title',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppStyles.bodyXSmallRg.copyWith(
                  color: AppColors.textPrimary,
                  fontSize: 11.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
