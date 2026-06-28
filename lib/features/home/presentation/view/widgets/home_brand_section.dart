import 'package:bazarly_app/features/home/data/models/home_scetion_response/item_reponse.dart';
import 'package:bazarly_app/features/home/presentation/view/widgets/brand_card.dart';
import 'package:bazarly_app/features/home/presentation/view_models/home_fetch_cubit/home_fetch_cubit.dart';
import 'package:bazarly_app/features/home/presentation/view_models/home_fetch_cubit/home_fetch_state.dart';
import 'package:bazarly_app/core/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

/// Horizontal scrollable brands section.
/// Shows a skeleton list while loading and the real cards on success.
class HomeBrandSection extends StatefulWidget {
  const HomeBrandSection({super.key});

  @override
  State<HomeBrandSection> createState() => _HomeBrandSectionState();
}

class _HomeBrandSectionState extends State<HomeBrandSection> {
  @override
  void initState() {
    super.initState();
    // Trigger the brands API call as soon as the widget is inserted into the tree
    context.read<HomeFeatchCubit>().fetchBrands();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeFeatchCubit, HomeFetchState>(
      // Rebuild only when a brands-related state is emitted
      buildWhen: (previous, current) =>
          current is BrandsFetchLoading ||
          current is BrandsFetchFailure ||
          current is BrandsFetchSuccess,
      builder: (context, state) {
        if (state is BrandsFetchFailure) {
          // Show the error message returned from the cubit
          return Center(child: Text(state.errMessage));
        }

        // Determine whether to show skeleton or real data
        final isLoading = state is BrandsFetchLoading;

        // Fake placeholder items while loading — same structure as real items
        // so the skeleton cards have the exact same layout
        final items = isLoading
            ? List.generate(
                5,
                (_) => ItemResponse(name: 'Brand Name', image: ''),
              )
            : (state as BrandsFetchSuccess).brands;

        return Skeletonizer(
          // When true, Skeletonizer paints shimmer over the child widgets
          enabled: isLoading,
          effect: ShimmerEffect(
            baseColor: AppColors.backgroundLight,
            highlightColor: AppColors.border,
          ),
          child: SizedBox(
            height: 170.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              itemCount: items.length,
              separatorBuilder: (_, _) => SizedBox(width: 12.w),
              itemBuilder: (context, index) {
                return BrandCard(item: items[index]);
              },
            ),
          ),
        );
      },
    );
  }
}
