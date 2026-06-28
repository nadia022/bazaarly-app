import 'package:bazarly_app/core/utils/assets/app_icons.dart';
import 'package:bazarly_app/core/utils/colors/app_colors.dart';
import 'package:bazarly_app/core/widgets/nav_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// The app-wide bottom navigation bar.
///
/// Displays 4 tabs: Home, Categories, Wishlist, Account.
/// Pass [currentIndex] to highlight the active tab,
/// and [onTap] to handle tab switches.
class AppNavBar extends StatelessWidget {
  const AppNavBar({super.key, required this.currentIndex, required this.onTap});

  /// Index of the currently active tab (0 → 3)
  final int currentIndex;

  /// Called with the new index when the user taps a tab
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary,
        boxShadow: [
          BoxShadow(
            // Subtle shadow above the nav bar
            color: AppColors.border.withOpacity(0.4),
            blurRadius: 12,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 60.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavItem(
                selectedIcon: AppIcons.selectedHomeIcon,
                unselectedIcon: AppIcons.unSelectedHomeIcon,
                label: 'Home',
                isActive: currentIndex == 0,
                onTap: () => onTap(0),
              ),
              NavItem(
                selectedIcon: AppIcons.selectedCategoriesIcon,
                unselectedIcon: AppIcons.unSelectedCategoriesIcon,
                label: 'Categories',
                isActive: currentIndex == 1,
                onTap: () => onTap(1),
              ),
              NavItem(
                selectedIcon: AppIcons.selectedWishlistIcon,
                unselectedIcon: AppIcons.unSelectedWishlistIcon,
                label: 'Wishlist',
                isActive: currentIndex == 2,
                onTap: () => onTap(2),
              ),
              NavItem(
                selectedIcon: AppIcons.selectedProfileIcon,
                unselectedIcon: AppIcons.unSelectedProfileIcon,
                label: 'Account',
                isActive: currentIndex == 3,
                onTap: () => onTap(3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
