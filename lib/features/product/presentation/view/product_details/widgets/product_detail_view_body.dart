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
import 'package:skeletonizer/skeletonizer.dart';

class ProductDetailsViewBody extends StatefulWidget {
  const ProductDetailsViewBody({super.key, required this.productId});
  final String productId;

  @override
  State<ProductDetailsViewBody> createState() => _ProductDetailsViewBodyState();
}

class _ProductDetailsViewBodyState extends State<ProductDetailsViewBody> {
  @override
  void initState() {
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
        }

        final isLoading = state is ProductDetailsFetchLoading;
        final product = state is ProductDetailsFetchSuccess
            ? state.product
            : null;

        final sliderImages =
            (product?.images != null && product!.images!.isNotEmpty)
            ? product.images!
            : [''];

        return Skeletonizer(
          enabled: isLoading,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8.h),
                      ProductImageSlider(images: sliderImages),

                      SizedBox(height: 16.h),

                      // ── Name + Price row ──────────────────────
                      ProductNameAndPrice(
                        name: product?.brand?.name ?? 'Loading Product Name',
                        price:
                            (product?.priceAfterDiscount ?? product?.price)
                                ?.toString() ??
                            '0.00',
                      ),

                      SizedBox(height: 8.h),

                      // ── Sold count + rating + quantity row ────
                      Row(
                        children: [
                          SoldCountBadgeAndRating(),
                          Spacer(),
                          const ProductQuantitySelector(),
                        ],
                      ),

                      SizedBox(height: 16.h),

                      // Description text with "Read More" link
                      ProductDescription(
                        descreption:
                            product?.description ??
                            'Loading description placeholder text that takes up some space',
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
                    (product?.priceAfterDiscount ?? product?.price)
                        ?.toString() ??
                    '0.00',
                productId: product?.id ?? '',
              ),
            ],
          ),
        );
      },
    );
  }
}
