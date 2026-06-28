import 'package:bazarly_app/core/utils/colors/app_colors.dart';
import 'package:bazarly_app/core/utils/styles/app_styles.dart';
import 'package:bazarly_app/features/home/presentation/view/widgets/brand_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A reusable horizontal product cards section.
///
/// Used for "Home Appliance" and any other section on the home screen.
/// Pass [sectionTitle] to set the header text.
/// Products will come from Bloc/API — the list is passed via [products]
/// or left empty for now with a TODO.
class HomeBrandSection extends StatelessWidget {
  const HomeBrandSection({super.key, required this.sectionTitle});

  /// Title shown in the section header (e.g. "Home Appliance")
  final String sectionTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Section header ────────────────────────────────
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                sectionTitle,
                style: AppStyles.titleMediumSb.copyWith(
                  color: AppColors.textPrimary,
                  fontSize: 16.sp,
                ),
              ),
              GestureDetector(
                onTap: () {
                  // TODO: navigate to all products in this section
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

        SizedBox(height: 12.h),

        // ── Horizontal product cards ──────────────────────
        SizedBox(
          height: 170.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            // TODO: replace itemCount with products.length from Bloc
            itemCount: 4,
            separatorBuilder: (_, __) => SizedBox(width: 12.w),
            itemBuilder: (context, index) {
              // TODO: pass actual product model here
              return const BrandCard();
            },
          ),
        ),
      ],
    );
  }
}
