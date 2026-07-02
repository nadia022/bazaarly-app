import 'package:bazarly_app/core/helper/app_snack_bar.dart';
import 'package:bazarly_app/core/utils/colors/app_colors.dart';
import 'package:bazarly_app/core/utils/router/routes_name.dart';
import 'package:bazarly_app/features/cart/presentation/view_models/cart_cubit/cart_cubit.dart';
import 'package:bazarly_app/features/cart/presentation/view_models/cart_cubit/cart_state.dart';
import 'package:bazarly_app/features/product/data/models/products_response/product_details.dart';
import 'package:bazarly_app/features/product/presentation/view/product_tab_view/widgets/price_row.dart';
import 'package:bazarly_app/features/product/presentation/view/product_tab_view/widgets/produc_image.dart';
import 'package:bazarly_app/features/product/presentation/view/product_tab_view/widgets/product_name_and_brand.dart';
import 'package:bazarly_app/features/product/presentation/view/product_tab_view/widgets/review_and_cart_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

/// Single product card matching the design:
/// - Product image with a wishlist heart icon
/// - Brand name + product name
/// - Current price + old crossed-out price
/// - Star rating with review count
/// - Green add-to-cart button
class ProductCard extends StatelessWidget {
  ProductCard({super.key, required this.productDetails});
  ProductDetails productDetails;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(
          RoutesName.productDetails,
          pathParameters: {'id': productDetails.id ?? ''},
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColors.primary),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.black.withOpacity(0.06),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Product image + wishlist icon ─────────────
            ProductImage(image: productDetails.imageCover ?? ''),

            // ── Text info ─────────────────────────────────
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductNameAndBrand(
                    brand: productDetails.brand?.name ?? 'No Brand Name',
                    name: productDetails.description ?? 'No Description',
                  ),
                  SizedBox(height: 4.h),
                  // ── Prices row ────────────────────────────
                  PriceRow(
                    currentPrice:
                        (productDetails.priceAfterDiscount ??
                                productDetails.price)
                            ?.toString() ??
                        '',
                    oldPrice: productDetails.price?.toString() ?? '',
                  ),

                  SizedBox(height: 4.h),

                  // ── Review row + add button ───────────────
                  BlocListener<CartCubit, CartState>(
                    listener: (context, state) {
                      if (state is AddToCartFailure) {
                        AppSnackBar.error(context, state.errMessage);
                      } else if (state is AddToCartSuccess) {
                        AppSnackBar.success(context, state.successMessage);
                        context.read<CartCubit>().fetchUserCart();
                      }
                    },
                    child: ReviewAndCartRow(
                      rating: productDetails.ratingsAverage?.toDouble() ?? 0.0,
                      onAddToCart: () {
                        context.read<CartCubit>().addToCart(
                          productId: productDetails.id ?? '',
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
