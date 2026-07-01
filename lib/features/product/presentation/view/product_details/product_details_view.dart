import 'package:bazarly_app/core/services/services_locator.dart';
import 'package:bazarly_app/core/utils/colors/app_colors.dart';
import 'package:bazarly_app/core/utils/router/routes_name.dart';
import 'package:bazarly_app/core/utils/styles/app_styles.dart';
import 'package:bazarly_app/features/cart/data/repos/cart_repo.dart';
import 'package:bazarly_app/features/cart/presentation/view_models/cart_cubit/cart_cubit.dart';
import 'package:bazarly_app/features/cart/presentation/view_models/cart_cubit/cart_state.dart';
import 'package:bazarly_app/features/product/data/repos/product_repo.dart';
import 'package:bazarly_app/features/product/presentation/view/product_details/widgets/product_detail_view_body.dart';
import 'package:bazarly_app/features/product/presentation/view_models/products_fetch_cubit/product_fetch_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key, required this.productId});

  final String productId;

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  @override
  void initState() {
    super.initState();
    // Fetch cart items as soon as the screen loads
    context.read<CartCubit>().fetchUserCart();
  }
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductFetchCubit>(
          create: (_) => ProductFetchCubit(getIt<ProductRepo>()),
        ),
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: GestureDetector(
            onTap: () => context.pop(),
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColors.primary,
            ),
          ),
          title: Text(
            'Product Details',
            style: AppStyles.titleMediumSb.copyWith(color: AppColors.primary),
          ),
          centerTitle: true,
          actions: [
            BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                int count = 0;

                if (state is FetchUserCartSuccess) {
                  count = state.response.numOfCartItems ?? 0;
                }

                return Padding(
                  padding:  EdgeInsets.only(right: 16.sp),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.push(RoutesName.cart);
                        },
                        child: Icon(
                          Icons.shopping_cart_outlined,
                          color: AppColors.primary,
                          size: 28.sp,
                        ),
                      ),
                      if (count > 0)
                        Positioned(
                          right: -6,
                          top: -6,
                          child: Container(
                            width: 18.w,
                            height: 18.w,
                            decoration: const BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              '$count',
                              style: AppStyles.bodySmallRg.copyWith(
                                color: Colors.white,
                                fontSize: 12.sp,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
        body: ProductDetailsViewBody(productId: widget.productId),
      ),
    );
  }
}
