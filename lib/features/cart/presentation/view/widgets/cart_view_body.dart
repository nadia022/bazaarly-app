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
    // Fetch cart items as soon as the screen loads
    context.read<CartCubit>().fetchUserCart();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        // ── Loading ────────────────────────────────────────────
        if (state is FetchUserCartLoading) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.primary),
          );
        }

        // ── Error ──────────────────────────────────────────────
        if (state is FetchUserCartFailure) {
          return Center(
            child: Text(
              state.errMessage,
              style: AppStyles.bodySmallSb.copyWith(
                color: Colors.red,
                fontSize: 14.sp,
              ),
              textAlign: TextAlign.center,
            ),
          );
        }

        // ── Success ────────────────────────────────────────────
        if (state is FetchUserCartSuccess) {
          final products = state.response.data?.products ?? [];
          final totalPrice =
              state.response.data?.totalCartPrice?.toDouble() ?? 0.0;

          return Column(
            children: [
              // ── Scrollable list of cart items ──────────────
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
                        separatorBuilder: (_, __) => SizedBox(height: 12.h),
                        itemBuilder: (context, index) {
                          final item = products[index];
                          return CartItemCard(
                            imageUrl: item.product?.imageCover ?? '',
                            name: item.product?.title ?? '',
                            price: item.price?.toStringAsFixed(0) ?? '0',
                            quantity: item.count ?? 1,
                            onDelete: () {
                              // TODO: dispatch remove-from-cart event
                            },
                            onIncrement: () {
                              // TODO: dispatch update-cart-quantity event (+1)
                            },
                            onDecrement: () {
                              // TODO: dispatch update-cart-quantity event (-1)
                            },
                          );
                        },
                      ),
              ),

              // ── Pinned bottom bar ───────────────────────────
              CartBottomBar(total: totalPrice),
            ],
          );
        }

        // ── Initial / fallback ─────────────────────────────────
        return const SizedBox.shrink();
      },
    );
  }
}
