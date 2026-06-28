import 'package:bazarly_app/core/utils/colors/app_colors.dart';
import 'package:bazarly_app/features/home/presentation/view/widgets/category_card.dart';
import 'package:bazarly_app/features/home/presentation/view_models/home_fetch_cubit/home_fetch_cubit.dart';
import 'package:bazarly_app/features/home/presentation/view_models/home_fetch_cubit/home_fetch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Horizontal scrollable categories section with a "view all" link.
class HomeCategoriesSection extends StatefulWidget {
  const HomeCategoriesSection({super.key});

  @override
  State<HomeCategoriesSection> createState() => _HomeCategoriesSectionState();
}

class _HomeCategoriesSectionState extends State<HomeCategoriesSection> {
  @override
  void initState() {
    super.initState();
    context.read<HomeFeatchCubit>().fetchGategories();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeFeatchCubit, HomeFetchState>(
      buildWhen: (previous, current) =>
          current is GategoriesFetchLoading ||
          current is GategoriesFetchFailure ||
          current is GategoriesFetchSuccess,
      builder: (context, state) {
        if (state is GategoriesFetchLoading) {
          return Center(
            child: CircularProgressIndicator(color: AppColors.primary),
          );
        } else if (state is GategoriesFetchFailure) {
          return Center(child: Text(state.errMessage));
        } else if (state is GategoriesFetchSuccess) {
          return SizedBox(
            height: 240.h,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12.h,
              ),
              itemCount: state.gategories.length,
              itemBuilder: (context, index) {
                return CategoryCard(item: state.gategories[index]);
              },
            ),
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
