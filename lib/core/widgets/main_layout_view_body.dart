import 'package:bazarly_app/core/widgets/app_nav_bar.dart';
import 'package:bazarly_app/core/widgets/app_search_bar.dart';
import 'package:bazarly_app/core/widgets/home_header.dart';
import 'package:bazarly_app/features/home/presentation/view/home_tab_view.dart';
import 'package:flutter/material.dart';

class MainLayoutViewBody extends StatefulWidget {
  const MainLayoutViewBody({super.key});

  @override
  State<MainLayoutViewBody> createState() => _MainLayoutViewBodyState();
}

class _MainLayoutViewBodyState extends State<MainLayoutViewBody> {
  // Tracks which tab is currently active (0 = Home)
  int _currentIndex = 0;

  // The 4 screens — built once and kept alive when switching tabs
  static const List<Widget> _screens = [
    HomeTabView(),
    Placeholder(),
    Placeholder(),
    Placeholder(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // ── Pinned header — never scrolls or rebuilds ──
            const HomeHeader(),
            const AppSearchBar(),

            // ── Content area — switches between tabs ───────
            // Expanded makes it fill all remaining space between
            // the header above and the nav bar below
            Expanded(
              child: IndexedStack(index: _currentIndex, children: _screens),
            ),
          ],
        ),
      ),

      // Bottom navigation bar shared across all screens
      bottomNavigationBar: AppNavBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}
