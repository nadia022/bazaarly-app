import 'package:bazarly_app/core/utils/colors/app_colors.dart';
import 'package:bazarly_app/core/utils/styles/app_styles.dart';
import 'package:bazarly_app/features/home/data/models/category_item.dart';
import 'package:bazarly_app/features/home/presentation/view/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


/// Horizontal scrollable categories section with a "view all" link.
class HomeCategoriesSection extends StatelessWidget {
  const HomeCategoriesSection({super.key});

  // Static list — replace imagePath values with your actual asset paths
  static const List<CategoryItem> _categories = [
    CategoryItem(name: "Women's\nfashion",  imagePath: 'assets/images/cat_women.png'),
    CategoryItem(name: "Men's\nfashion",    imagePath: 'assets/images/cat_men.png'),
    CategoryItem(name: "Laptops &\nElectronics", imagePath: 'assets/images/cat_laptops.png'),
    CategoryItem(name: "Baby\nToys",        imagePath: 'assets/images/cat_baby.png'),
    CategoryItem(name: "Beauty",            imagePath: 'assets/images/cat_beauty.png'),
    CategoryItem(name: "Headphones",        imagePath: 'assets/images/cat_headphones.png'),
    CategoryItem(name: "Skincare",          imagePath: 'assets/images/cat_skincare.png'),
    CategoryItem(name: "Cameras",           imagePath: 'assets/images/cat_cameras.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ── Section header ────────────────────────────────
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Categories',
                style: AppStyles.titleMediumSb.copyWith(
                  color: AppColors.textPrimary,
                  fontSize: 16.sp,
                ),
              ),
              GestureDetector(
                onTap: () {
                  // TODO: navigate to all categories screen
                },
                child: Text(
                  'view all',
                  style: AppStyles.bodySmallMd.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 16.h),

        // ── Scrollable category circles (2 rows) ──────────
        SizedBox(
          height: 220.h,
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12.w,
              crossAxisSpacing: 12.h,
              childAspectRatio: 0.85,
            ),
            itemCount: _categories.length,
            itemBuilder: (context, index) {
              return CategoryCard(item: _categories[index]);
            },
          ),
        ),
      ],
    );
  }
}

