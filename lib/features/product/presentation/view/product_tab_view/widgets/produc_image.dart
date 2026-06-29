// ─────────────────────────────────────────────────────────────
//  Product image with wishlist heart overlay
// ─────────────────────────────────────────────────────────────

import 'package:bazarly_app/core/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductImage extends StatefulWidget {
  @override
  State<ProductImage> createState() => _ProductImageState();
}

class _ProductImageState extends State<ProductImage> {
  // Controls whether the item is wishlisted
  bool _isWishlisted = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Product image
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.r),
            topRight: Radius.circular(12.r),
          ),
          child: Container(
            height: 130.h,
            width: double.infinity,
            color: AppColors.backgroundLight,
            // TODO: replace with CachedNetworkImage(imageUrl: product.image)
            child: Icon(
              Icons.image_outlined,
              color: AppColors.border,
              size: 36.sp,
            ),
          ),
        ),

        // Wishlist heart icon in the top-right corner
        Positioned(
          top: 8.h,
          right: 8.w,
          child: GestureDetector(
            onTap: () {
              setState(() => _isWishlisted = !_isWishlisted);
              // TODO: dispatch WishlistToggle event
            },
            child: Container(
              width: 28.w,
              height: 28.h,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(
                _isWishlisted
                    ? Icons.favorite_rounded
                    : Icons.favorite_border_rounded,
                // Active: red / Inactive: grey
                color: _isWishlisted ? Colors.red : AppColors.textSecondary,
                size: 16.sp,
              ),
            ),
          ),
        ),
      ],
    );
  }
}