// ─────────────────────────────────────────────────────────────
//  Single category card: circle image + label below
// ─────────────────────────────────────────────────────────────
import 'package:bazarly_app/core/utils/colors/app_colors.dart';
import 'package:bazarly_app/features/home/data/models/home_scetion_response/item_reponse.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          CachedNetworkImage(
            imageUrl: item.image ?? '',
            imageBuilder: (context, imageProvider) => CircleAvatar(
              radius: 40.r,
              backgroundColor: AppColors.backgroundLight,
              backgroundImage: imageProvider,
            ),
            placeholder: (context, url) => CircleAvatar(
              radius: 40.r,
              backgroundColor: AppColors.backgroundLight,
              child: SizedBox(
                width: 22.r,
                height: 22.r,
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                  strokeWidth: 2.w,
                ),
              ),
            ),
            errorWidget: (context, url, error) => CircleAvatar(
              radius: 40.r,
              backgroundColor: AppColors.backgroundLight,
              child: Icon(Icons.error, color: AppColors.error),
            ),
          ),
          // Category name
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
