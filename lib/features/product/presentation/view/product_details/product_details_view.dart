import 'package:bazarly_app/core/services/services_locator.dart';
import 'package:bazarly_app/core/utils/colors/app_colors.dart';
import 'package:bazarly_app/core/utils/styles/app_styles.dart';
import 'package:bazarly_app/features/product/data/repos/product_repo.dart';
import 'package:bazarly_app/features/product/presentation/view/product_details/widgets/product_detail_view_body.dart';
import 'package:bazarly_app/features/product/presentation/view_models/products_fetch_cubit/product_fetch_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.productId});
  final String productId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductFetchCubit(getIt<ProductRepo>()),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          // Back button
          leading: GestureDetector(
            onTap: () => context.pop(),
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColors.primary,
            ),
          ),
          // Screen title
          title: Text(
            'Product Details',
            style: AppStyles.titleMediumSb.copyWith(color: AppColors.primary),
          ),
          centerTitle: true,
          actions: [
            // Cart icon only — no search icon per the requirement
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: GestureDetector(
                onTap: () {
                  // TODO: navigate to cart screen
                },
                child: const Icon(
                  Icons.shopping_cart_outlined,
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
        body: ProductDetailsViewBody(productId: productId),
      ),
    );
  }
}
