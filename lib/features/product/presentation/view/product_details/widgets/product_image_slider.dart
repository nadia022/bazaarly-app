import 'package:bazarly_app/core/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

/// Product image carousel with a wishlist heart icon overlay
/// and smooth dot indicators at the bottom.
class ProductImageSlider extends StatefulWidget {
  const ProductImageSlider({super.key, required this.images});
  final List<String> images;

  @override
  State<ProductImageSlider> createState() => _ProductImageSliderState();
}

class _ProductImageSliderState extends State<ProductImageSlider> {
  final PageController _pageController = PageController();

  // Tracks the currently visible image index
  int _currentPage = 0;

  // Controls whether the product is wishlisted
  bool _isWishlisted = false;

  // TODO: replace with product.images list from the model

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240.h,
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Stack(
        children: [
          // ── Image PageView ────────────────────────────────
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.images.length,
              onPageChanged: (index) => setState(() => _currentPage = index),
              itemBuilder: (context, index) {
                // TODO: replace with CachedNetworkImage(imageUrl: product.images[index])
                return Image.network(widget.images[index],fit: BoxFit.cover,);
              },
            ),
          ),

          // ── Wishlist heart icon (top-right) ───────────────
          Positioned(
            top: 12.h,
            right: 12.w,
            child: GestureDetector(
              onTap: () {
                setState(() => _isWishlisted = !_isWishlisted);
                // TODO: dispatch WishlistToggle event
              },
              child: Container(
                width: 36.w,
                height: 36.h,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  _isWishlisted
                      ? Icons.favorite_rounded
                      : Icons.favorite_border_rounded,
                  // Red when wishlisted, grey otherwise
                  color: _isWishlisted
                      ? AppColors.primary
                      : AppColors.textSecondary,
                  size: 18.sp,
                ),
              ),
            ),
          ),

          // ── Dot indicators (bottom-center) ────────────────
          Positioned(
            bottom: 12.h,
            left: 0,
            right: 0,
            child: Center(
              child: AnimatedSmoothIndicator(
                activeIndex: _currentPage,
                count: widget.images.length,
                effect: ExpandingDotsEffect(
                  activeDotColor: AppColors.primary,
                  dotColor: AppColors.border,
                  dotHeight: 7,
                  dotWidth: 7,
                  expansionFactor: 2.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
