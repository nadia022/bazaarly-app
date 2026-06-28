import 'package:bazarly_app/core/widgets/app_search_bar.dart';
import 'package:bazarly_app/features/home/presentation/view/widgets/home_Brand_section.dart';
import 'package:bazarly_app/features/home/presentation/view/widgets/home_banner_slider.dart';
import 'package:bazarly_app/features/home/presentation/view/widgets/home_catogories_section.dart';
import 'package:bazarly_app/core/widgets/home_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          // ──   Header
          SliverToBoxAdapter(child: HomeHeader()),
          // ── Search bar pinned at the top ──────────────────
          const SliverToBoxAdapter(child: AppSearchBar()),

          SliverToBoxAdapter(child: SizedBox(height: 16.h)),

          // ── Auto-scrolling banner slider ──────────────────
          const SliverToBoxAdapter(child: HomeBannerSlider()),

          SliverToBoxAdapter(child: SizedBox(height: 24.h)),

          // ── Categories section ────────────────────────────
          const SliverToBoxAdapter(child: HomeCategoriesSection()),

          SliverToBoxAdapter(child: SizedBox(height: 24.h)),

          // ── Home Appliance products section ───────────────
          const SliverToBoxAdapter(
            child: HomeBrandSection(sectionTitle: 'Brands'),
          ),

          SliverToBoxAdapter(child: SizedBox(height: 24.h)),
        ],
      ),
    );
  }
}
