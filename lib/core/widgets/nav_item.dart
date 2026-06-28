// ─────────────────────────────────────────────────────────────
//  Single nav item: icon + label
// ─────────────────────────────────────────────────────────────

import 'package:bazarly_app/core/utils/colors/app_colors.dart';
import 'package:bazarly_app/core/utils/styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavItem extends StatelessWidget {
  const NavItem({
    super.key,
    required this.selectedIcon,
    required this.unselectedIcon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  final String selectedIcon;
  final String unselectedIcon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 70.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Active tab shows filled icon in primary green
            Image.asset(isActive ? selectedIcon : unselectedIcon),

            SizedBox(height: 3.h),
          ],
        ),
      ),
    );
  }
}
