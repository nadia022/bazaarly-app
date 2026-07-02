import 'package:bazarly_app/core/helper/app_snack_bar.dart';
import 'package:bazarly_app/core/utils/colors/app_colors.dart';
import 'package:bazarly_app/core/utils/styles/app_styles.dart';
import 'package:bazarly_app/features/cart/presentation/view/widgets/cart_bottom_bar.dart';
import 'package:bazarly_app/features/cart/presentation/view/widgets/cart_item_card.dart';
import 'package:bazarly_app/features/cart/presentation/view_models/cart_cubit/cart_cubit.dart';
import 'package:bazarly_app/features/cart/presentation/view_models/cart_cubit/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartViewBody extends StatefulWidget {
  const CartViewBody({super.key});

  @override
  State<CartViewBody> createState() => _CartViewBodyState();
}

class _CartViewBodyState extends State<CartViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<CartCubit>().fetchUserCart();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        if (state is RemoveFromCartSuccess) {
          AppSnackBar.success(context, state.successMessage);
          context.read<CartCubit>().fetchUserCart(isRefresh: false);
        }

        if (state is UpdateCartItemQuantitySuccess) {
          context.read<CartCubit>().fetchUserCart(isRefresh: false);
        }

        if (state is ClearCartSuccess) {
          AppSnackBar.success(context, state.successMessage);
          context.read<CartCubit>().fetchUserCart(isRefresh: false);
        }

        if (state is RemoveFromCartFailure) {
          AppSnackBar.error(context, state.errMessage);
        }

        if (state is UpdateCartItemQuantityFailure) {
          AppSnackBar.error(context, state.errMessage);
        }

        if (state is ClearCartFailure) {
          AppSnackBar.error(context, state.errMessage);
        }
      },
      builder: (context, state) {
        final cubit = context.read<CartCubit>();

        if (state is FetchUserCartLoading && cubit.cartResponse == null) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.primary,
            ),
          );
        }

        if (state is FetchUserCartFailure && cubit.cartResponse == null) {
          return Center(
            child: Text(
              state.errMessage,
              style: AppStyles.bodySmallSb.copyWith(
                color: Colors.red,
                fontSize: 14.sp,
              ),
            ),
          );
        }

        final products = cubit.cartResponse?.data?.products ?? [];
        final totalPrice =
            cubit.cartResponse?.data?.totalCartPrice?.toDouble() ?? 0;

        return Column(
          children: [
            Expanded(
              child: products.isEmpty
                  ? Center(
                      child: Text(
                        'Your cart is empty',
                        style: AppStyles.bodySmallSb.copyWith(
                          color: AppColors.textSecondary,
                          fontSize: 15.sp,
                        ),
                      ),
                    )
                  : ListView.separated(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 12.h,
                      ),
                      itemCount: products.length,
                      separatorBuilder: (_, __) =>
                          SizedBox(height: 12.h),
                      itemBuilder: (context, index) {
                        final item = products[index];

                        return CartItemCard(
                          imageUrl: item.product?.imageCover ?? '',
                          name: item.product?.title ?? '',
                          price: item.price?.toStringAsFixed(0) ?? '0',
                          quantity: item.count ?? 1,
                          onDelete: () {
                            context.read<CartCubit>().removeFromCart(
                                  productId: item.product?.id ?? '',
                                );
                          },
                          onIncrement: () {
                            context
                                .read<CartCubit>()
                                .updateCartItemQuantity(
                                  productId: item.product?.id ?? '',
                                  quantity: (item.count ?? 1) + 1,
                                );
                          },
                          onDecrement: () {
                            if ((item.count ?? 1) > 1) {
                              context
                                  .read<CartCubit>()
                                  .updateCartItemQuantity(
                                    productId: item.product?.id ?? '',
                                    quantity: (item.count ?? 1) - 1,
                                  );
                            }
                          },
                        );
                      },
                    ),
            ),
            CartBottomBar(total: totalPrice),
          ],
        );
      },
    );
  }
}