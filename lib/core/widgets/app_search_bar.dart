import 'package:bazarly_app/core/utils/colors/app_colors.dart';
import 'package:bazarly_app/core/utils/router/routes_name.dart';
import 'package:bazarly_app/core/utils/styles/app_styles.dart';
import 'package:bazarly_app/features/cart/presentation/view_models/cart_cubit/cart_cubit.dart';
import 'package:bazarly_app/features/cart/presentation/view_models/cart_cubit/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

/// Search bar at the top of the home screen with a cart icon.
class AppSearchBar extends StatefulWidget {
  const AppSearchBar({super.key});

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CartCubit>().fetchUserCart();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        children: [
          // ── Search input ──────────────────────────────────
          Expanded(
            child: Container(
              height: 48.h,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(24.r),
                border: Border.all(color: AppColors.primary, width: 1.5),
              ),
              child: Row(
                children: [
                  SizedBox(width: 12.w),
                  Icon(
                    Icons.search_rounded,
                    color: AppColors.primary,
                    size: 22.sp,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    'what do you search for?',
                    style: AppStyles.bodyMediumRg.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(width: 12.w),

          // ── Cart icon ─────────────────────────────────────
          BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              final cartCubit = context.read<CartCubit>();

              final count = cartCubit.cartResponse?.numOfCartItems ?? 0;

              return Stack(
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
              );
            },
          ),
        ],
      ),
    );
  }
}
