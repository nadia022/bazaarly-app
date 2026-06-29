import 'package:bazarly_app/features/home/presentation/view/widgets/home_Brand_section.dart';
import 'package:bazarly_app/features/home/presentation/view/widgets/home_banner_slider.dart';
import 'package:bazarly_app/features/home/presentation/view/widgets/home_catogories_section.dart';
import 'package:bazarly_app/features/home/presentation/view/widgets/home_section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTabViewBody extends StatelessWidget {
  const HomeTabViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    // Header and SearchBar are now pinned in MainLayoutViewBody,
    // so this scroll view contains only the scrollable content
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: SizedBox(height: 16.h)),

        // ── Auto-scrolling banner slider ──────────────────
        const SliverToBoxAdapter(child: HomeBannerSlider()),

        SliverToBoxAdapter(child: SizedBox(height: 24.h)),

        // ── Section header for categories ─────────────────
        SliverToBoxAdapter(
          child: HomeSectionHeader(
            sectionTitle: 'Categories',
            onViewAllPressed: () {
              // TODO: navigate to all categories screen
            },
          ),
        ),

        SliverToBoxAdapter(child: SizedBox(height: 8.h)),

        // ── Categories section ────────────────────────────
        const SliverToBoxAdapter(child: HomeCategoriesSection()),

        SliverToBoxAdapter(child: SizedBox(height: 24.h)),

        // ── Section header for brands ─────────────────────
        SliverToBoxAdapter(
          child: HomeSectionHeader(
            sectionTitle: 'Brands',
            onViewAllPressed: () {
              // TODO: navigate to all brands screen
            },
          ),
        ),

        SliverToBoxAdapter(child: SizedBox(height: 8.h)),

        // ── Brands section ────────────────────────────────
        const SliverToBoxAdapter(child: HomeBrandSection()),

        SliverToBoxAdapter(child: SizedBox(height: 24.h)),
      ],
    );
  }
}
