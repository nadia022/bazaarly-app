import 'package:bazarly_app/core/utils/colors/app_colors.dart';
import 'package:bazarly_app/core/utils/styles/app_styles.dart';
import 'package:bazarly_app/features/product/presentation/view/product_details/widgets/bottom_bar.dart';
import 'package:bazarly_app/features/product/presentation/view/product_details/widgets/product_color_selector.dart';
import 'package:bazarly_app/features/product/presentation/view/product_details/widgets/product_description.dart';
import 'package:bazarly_app/features/product/presentation/view/product_details/widgets/product_image_slider.dart';
import 'package:bazarly_app/features/product/presentation/view/product_details/widgets/product_name_and_price.dart';
import 'package:bazarly_app/features/product/presentation/view/product_details/widgets/product_quantity_selector.dart';
import 'package:bazarly_app/features/product/presentation/view/product_details/widgets/product_size_selector.dart';
import 'package:bazarly_app/features/product/presentation/view/product_details/widgets/sold_count_badge_and_rating.dart';
import 'package:bazarly_app/features/product/presentation/view_models/products_fetch_cubit/product_fetch_cubit.dart';
import 'package:bazarly_app/features/product/presentation/view_models/products_fetch_cubit/product_fetch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsViewBody extends StatefulWidget {
  const ProductDetailsViewBody({super.key, required this.productId});
  final String productId;

  @override
  State<ProductDetailsViewBody> createState() => _ProductDetailsViewBodyState();
}

class _ProductDetailsViewBodyState extends State<ProductDetailsViewBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ProductFetchCubit>().fetchProductDetails(
      productId: widget.productId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductFetchCubit, ProductFetchState>(
      builder: (context, state) {
        if (state is ProductDetailsFetchFailure) {
          return Center(child: Text(state.errMessage));
        } else if (state is ProductDetailsFetchLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is ProductDetailsFetchSuccess) {
          return Column(
            children: [
              // ── Scrollable content ────────────────────────────
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8.h),

                      // Product image carousel with wishlist + dots
                      ProductImageSlider(images: state.product.images ?? []),

                      SizedBox(height: 16.h),

                      // ── Name + Price row ──────────────────────
                      ProductNameAndPrice(
                        name: state.product.brand?.name ?? '',
                        price:
                            (state.product.priceAfterDiscount ??
                                    state.product.price)
                                ?.toString() ??
                            '',
                      ),

                      SizedBox(height: 8.h),

                      // ── Sold count + rating + quantity row ────
                      Row(
                        children: [
                          // Sold count badge and rating
                          SoldCountBadgeAndRating(),
                          Spacer(),
                          // Quantity counter widget
                          const ProductQuantitySelector(),
                        ],
                      ),

                      SizedBox(height: 16.h),

                      // Description text with "Read More" link
                      ProductDescription(
                        descreption:
                            state.product.description ?? 'No Descreption',
                      ),

                      SizedBox(height: 16.h),

                      // ── Size selector ─────────────────────────
                      Text(
                        'Size',
                        style: AppStyles.bodySmallSb.copyWith(
                          color: AppColors.textPrimary,
                          fontSize: 14.sp,
                        ),
                      ),

                      SizedBox(height: 8.h),

                      const ProductSizeSelector(),

                      SizedBox(height: 16.h),

                      // ── Color selector ────────────────────────
                      Text(
                        'Color',
                        style: AppStyles.bodySmallSb.copyWith(
                          color: AppColors.textPrimary,
                          fontSize: 14.sp,
                        ),
                      ),

                      SizedBox(height: 8.h),

                      const ProductColorSelector(),

                      SizedBox(height: 24.h),
                    ],
                  ),
                ),
              ),

              // ── Pinned bottom bar: total price + add to cart ──
              BottomBar(
                price:
                    (state.product.priceAfterDiscount ?? state.product.price)
                        ?.toString() ??
                    '',
              ),
            ],
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
