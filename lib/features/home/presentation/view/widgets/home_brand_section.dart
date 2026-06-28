import 'package:bazarly_app/features/home/presentation/view/widgets/brand_card.dart';
import 'package:bazarly_app/features/home/presentation/view_models/home_fetch_cubit/home_fetch_cubit.dart';
import 'package:bazarly_app/features/home/presentation/view_models/home_fetch_cubit/home_fetch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A reusable horizontal product cards section.
///
/// Used for "Home Appliance" and any other section on the home screen.
/// Pass [sectionTitle] to set the header text.
/// Products will come from Bloc/API — the list is passed via [products]
/// or left empty for now with a TODO.
class HomeBrandSection extends StatefulWidget {
  const HomeBrandSection({super.key});

  @override
  State<HomeBrandSection> createState() => _HomeBrandSectionState();
}

class _HomeBrandSectionState extends State<HomeBrandSection> {
  /// Title shown in the section header (e.g. "Home Appliance")
  @override
  void initState() {
    super.initState();
    context.read<HomeFeatchCubit>().fetchBrands();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeFeatchCubit, HomeFetchState>(
      buildWhen: (previous, current) =>
          current is BrandsFetchLoading ||
          current is BrandsFetchFailure ||
          current is BrandsFetchSuccess,
      builder: (context, state) {
        if (state is BrandsFetchLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is BrandsFetchFailure) {
          return Center(child: Text(state.errMessage));
        } else if (state is BrandsFetchSuccess) {
          return SizedBox(
            height: 170.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              itemCount: state.brands.length,
              separatorBuilder: (context, index) => SizedBox(width: 12.w),
              itemBuilder: (context, index) {
                return BrandCard(item: state.brands[index]);
              },
            ),
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
