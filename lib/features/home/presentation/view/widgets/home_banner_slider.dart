import 'dart:async';
import 'package:bazarly_app/core/utils/assets/app_images.dart';
import 'package:bazarly_app/core/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Auto-scrolling banner slider with 3 static local images.
///
/// The banner switches automatically every 3 seconds without
/// any user interaction. Dot indicators show the current page.
class HomeBannerSlider extends StatefulWidget {
  const HomeBannerSlider({super.key});

  @override
  State<HomeBannerSlider> createState() => _HomeBannerSliderState();
}

class _HomeBannerSliderState extends State<HomeBannerSlider> {
  // Controls the PageView programmatically
  final PageController _pageController = PageController();

  // Tracks which banner is currently visible
  int _currentPage = 0;

  // Auto-scroll timer
  Timer? _autoScrollTimer;

  // The 3 static banner images — replace with your actual asset paths
  static const List<String> _bannerImages = [
    AppImages.bannerOne,
    AppImages.bannerTwo,
    AppImages.bannerThree,
  ];

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _autoScrollTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  /// Starts a repeating timer that advances the banner every 3 seconds
  void _startAutoScroll() {
    _autoScrollTimer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (!mounted) return;
      final nextPage = (_currentPage + 1) % _bannerImages.length;
      _pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Stack(
        children: [
          // ── Banner PageView ───────────────────────────────
          SizedBox(
            height: 160.h,
            child: PageView.builder(
              controller: _pageController,
              itemCount: _bannerImages.length,
              onPageChanged: (index) {
                setState(() => _currentPage = index);
              },
              itemBuilder: (context, index) {
                return Image.asset(_bannerImages[index], fit: BoxFit.cover);
              },
            ),
          ),

          SizedBox(height: 10.h),

          // ── Dot indicators ────────────────────────────────
          Positioned(
            bottom: 8.h,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _bannerImages.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 3.w),
                  width: _currentPage == index ? 18.w : 7.w,
                  height: 7.h,
                  decoration: BoxDecoration(
                    color: _currentPage == index
                        ? AppColors.primary
                        : AppColors.border,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
