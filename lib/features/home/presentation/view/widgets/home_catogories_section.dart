import 'package:bazarly_app/core/utils/colors/app_colors.dart';
import 'package:bazarly_app/features/home/data/models/home_scetion_response/item_reponse.dart';
import 'package:bazarly_app/features/home/presentation/view/widgets/category_card.dart';
import 'package:bazarly_app/features/home/presentation/view_models/home_fetch_cubit/home_fetch_cubit.dart';
import 'package:bazarly_app/features/home/presentation/view_models/home_fetch_cubit/home_fetch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

/// Horizontal scrollable categories section.
/// Shows a skeleton grid while loading and the real data on success.
class HomeCategoriesSection extends StatefulWidget {
  const HomeCategoriesSection({super.key});

  @override
  State<HomeCategoriesSection> createState() => _HomeCategoriesSectionState();
}

class _HomeCategoriesSectionState extends State<HomeCategoriesSection> {
  @override
  void initState() {
    super.initState();
    // Trigger the API call as soon as the widget is inserted into the tree
    context.read<HomeFeatchCubit>().fetchGategories();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeFeatchCubit, HomeFetchState>(
      // Rebuild only when a categories-related state is emitted
      buildWhen: (previous, current) =>
          current is GategoriesFetchLoading ||
          current is GategoriesFetchFailure ||
          current is GategoriesFetchSuccess,
      builder: (context, state) {
        if (state is GategoriesFetchFailure) {
          // Show the error message returned from the cubit
          return Center(child: Text(state.errMessage));
        }

        // Determine whether to show skeleton or real data
        final isLoading = state is GategoriesFetchLoading;

        // Use fake placeholder items while loading so the skeleton
        // has the exact same layout as the real grid
        final items = isLoading
            ? List.generate(8, (_) => ItemResponse(name: 'Category', image: ''))
            : (state as GategoriesFetchSuccess).gategories;

        return Skeletonizer(
          // When true, Skeletonizer paints shimmer over the child widgets
          enabled: isLoading,
          effect: ShimmerEffect(
            baseColor: AppColors.backgroundLight,
            highlightColor: AppColors.border,
          ),
          child: SizedBox(
            height: 240.h,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12.h,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return CategoryCard(item: items[index]);
              },
            ),
          ),
        );
      },
    );
  }
}
