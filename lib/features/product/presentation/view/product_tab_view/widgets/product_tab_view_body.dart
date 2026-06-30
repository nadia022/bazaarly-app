import 'package:bazarly_app/core/utils/colors/app_colors.dart';
import 'package:bazarly_app/features/product/presentation/view/product_tab_view/widgets/product_card.dart';
import 'package:bazarly_app/features/product/presentation/view_models/products_fetch_cubit/product_fetch_cubit.dart';
import 'package:bazarly_app/features/product/presentation/view_models/products_fetch_cubit/product_fetch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductTabViewBody extends StatefulWidget {
  const ProductTabViewBody({super.key});

  @override
  State<ProductTabViewBody> createState() => _ProductTabViewBodyState();
}

class _ProductTabViewBodyState extends State<ProductTabViewBody> {
  // Controls the grid scroll position — used to detect when to load more
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();

    // Fetch the first page on screen load
    context.read<ProductFetchCubit>().fetchAllProducts();

    /// ================= PAGINATION LOGIC =================
    /// When user scrolls near the bottom of the list,
    /// we trigger loading the next page if available.
    scrollController.addListener(() {
      final cubit = context.read<ProductFetchCubit>();
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent - 300 &&
          !cubit.isLoadingMore &&
          cubit.hasNextPage) {
        cubit.fetchAllProducts(page: cubit.currentPage + 1);
      }
    });
  }

  @override
  void dispose() {
    // Always dispose the controller to free resources
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductFetchCubit, ProductFetchState>(
      builder: (context, state) {
        if (state is ProductsFetchFailure) {
          return Center(child: Text(state.errMessage));
        } else if (state is ProductsFetchLoading) {
          return Center(
            child: CircularProgressIndicator(color: AppColors.primary),
          );
        }
        if (state is ProductsFetchSuccess) {
          final products = state.response.data ?? [];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            child: Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    controller: scrollController,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12.w,
                      mainAxisSpacing: 12.h,
                      mainAxisExtent: 260.h,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return ProductCard(productDetails: products[index]);
                    },
                  ),
                ),
                if (state.isLoadingMore)
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    child: CircularProgressIndicator(color: AppColors.primary),
                  ),
              ],
            ),
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
