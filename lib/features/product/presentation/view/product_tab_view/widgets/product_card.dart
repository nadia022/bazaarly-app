import 'package:bazarly_app/core/utils/colors/app_colors.dart';
import 'package:bazarly_app/core/utils/router/routes_name.dart';
import 'package:bazarly_app/features/product/data/models/products_response/product_details.dart';
import 'package:bazarly_app/features/product/presentation/view/product_tab_view/widgets/price_row.dart';
import 'package:bazarly_app/features/product/presentation/view/product_tab_view/widgets/produc_image.dart';
import 'package:bazarly_app/features/product/presentation/view/product_tab_view/widgets/product_name_and_brand.dart';
import 'package:bazarly_app/features/product/presentation/view/product_tab_view/widgets/review_and_cart_row.dart';
import 'package:flutter/material.dart';
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

  // TODO: accept a ProductModel parameter and replace hardcoded values

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: navigate to product details screen
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
                  ReviewAndCartRow(
                    rating:
                        productDetails.ratingsAverage?.toDouble() ??
                        0.0, // TODO: product.rating
                    onAddToCart: () {
                      // TODO: dispatch AddToCart event
                    },
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
