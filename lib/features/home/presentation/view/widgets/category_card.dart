// ─────────────────────────────────────────────────────────────
//  Single category card: circle image + label below
// ─────────────────────────────────────────────────────────────
import 'package:bazarly_app/core/utils/colors/app_colors.dart';
import 'package:bazarly_app/features/home/data/models/home_scetion_response/item_reponse.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Single category card: circular image + label below.
///
/// Used inside both the real grid and the Skeletonizer placeholder grid,
/// so its layout must stay identical in both cases.
class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.item});

  final ItemResponse item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: navigate to category products screen
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Circular image loaded from network with cache support
          CachedNetworkImage(
            imageUrl: item.image ?? '',
            imageBuilder: (context, imageProvider) => CircleAvatar(
              radius: 40.r,
              backgroundColor: AppColors.backgroundLight,
              backgroundImage: imageProvider,
            ),
            // Skeletonizer will paint shimmer over this placeholder automatically
            placeholder: (context, url) => CircleAvatar(
              radius: 40.r,
              backgroundColor: AppColors.backgroundLight,
            ),
            // Fallback icon shown when the image URL is invalid or unreachable
            errorWidget: (context, url, error) => CircleAvatar(
              radius: 40.r,
              backgroundColor: AppColors.backgroundLight,
              child: Icon(Icons.error, color: AppColors.error),
            ),
          ),

          SizedBox(height: 6.h),

          // Category name — truncated to 2 lines if too long
          Text(
            item.name ?? 'No title',
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            maxLines: 2,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
