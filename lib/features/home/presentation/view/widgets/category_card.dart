// ─────────────────────────────────────────────────────────────
//  Single category card: circle image + label below
// ─────────────────────────────────────────────────────────────

import 'package:bazarly_app/core/utils/colors/app_colors.dart';
import 'package:bazarly_app/features/home/data/models/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({required this.item});

  final CategoryItem item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: navigate to category products screen
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Circular image
          Container(
            width: 72.w,
            height: 72.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.borderLight, width: 1.5),
              color: AppColors.backgroundLight,
            ),
            child: ClipOval(
              child: Image.asset(
                item.imagePath,
                fit: BoxFit.cover,
                // Shows a fallback icon if the asset is missing
                errorBuilder: (_, __, ___) => Icon(
                  Icons.category_outlined,
                  color: AppColors.primary,
                  size: 28.sp,
                ),
              ),
            ),
          ),
          // Category name
          Text(
            item.name,
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
