import 'package:bazarly_app/core/utils/assets/app_images.dart';
import 'package:bazarly_app/core/utils/colors/app_colors.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeBannerSlider extends StatefulWidget {
  const HomeBannerSlider({super.key});

  @override
  State<HomeBannerSlider> createState() => _HomeBannerSliderState();
}

class _HomeBannerSliderState extends State<HomeBannerSlider> {
  // Tracks the index of the currently visible banner
  int _currentPage = 0;

  // Static list of 3 local banner asset paths
  static const List<String> _bannerImages = [
    AppImages.bannerOne,
    AppImages.bannerTwo,
    AppImages.bannerThree,
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // ── Auto-scrolling banner carousel ───────────────
        CarouselSlider(
          options: CarouselOptions(
            height: 160.h,
            // Advances to the next banner automatically every 3 seconds
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayCurve: Curves.easeInOut,
            // 1.0 means each banner fills the full available width
            viewportFraction: 1.0,
            // Updates the dot indicator whenever the page changes
            onPageChanged: (index, _) => setState(() => _currentPage = index),
          ),
          items: _bannerImages.map((path) {
            return Image.asset(path, fit: BoxFit.cover);
          }).toList(),
        ),

        // ── Dot indicators centered at the bottom ────────
        Positioned(
          bottom: 8.h,
          left: 0, // stretch to full width so Center works correctly
          right: 0,
          child: Center(
            child: AnimatedSmoothIndicator(
              activeIndex: _currentPage,
              count: _bannerImages.length,
              // ExpandingDots: the active dot stretches wider than the rest
              effect: ExpandingDotsEffect(
                activeDotColor: AppColors.primary,
                dotColor: AppColors.border,
                dotHeight: 7,
                dotWidth: 7,
                // How much wider the active dot grows compared to inactive ones
                expansionFactor: 2.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
