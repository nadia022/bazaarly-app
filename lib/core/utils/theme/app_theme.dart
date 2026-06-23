import 'package:bazarly_app/core/utils/colors/app_colors.dart';
import 'package:bazarly_app/core/utils/styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ═══════════════════════════════════════════════════════════════
//  🎨  BAZAARLY — APP THEME
// ═══════════════════════════════════════════════════════════════

class AppTheme {
  AppTheme._();

  static ThemeData get appTheme => ThemeData(
    useMaterial3: true,
    fontFamily: AppStyles.fontFamily,
    colorScheme: _buildColorScheme(),
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: _buildAppBarTheme(),
    bottomNavigationBarTheme: _buildBottomNavBarTheme(),
    elevatedButtonTheme: _buildElevatedButtonTheme(),
    outlinedButtonTheme: _buildOutlinedButtonTheme(),
    textButtonTheme: _buildTextButtonTheme(),
    inputDecorationTheme: _buildInputDecorationTheme(),
    cardTheme: _buildCardTheme(),
    chipTheme: _buildChipTheme(),
    dividerTheme: _buildDividerTheme(),
    iconTheme: _buildIconTheme(),
    checkboxTheme: _buildCheckboxTheme(),
    radioTheme: _buildRadioTheme(),
    switchTheme: _buildSwitchTheme(),
    snackBarTheme: _buildSnackBarTheme(),
    progressIndicatorTheme: _buildProgressIndicatorTheme(),
    tabBarTheme: _buildTabBarTheme(),
    badgeTheme: _buildBadgeTheme(),
  );

  // ── Color Scheme ─────────────────────────────────────────────
  static ColorScheme _buildColorScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      // ── Primary ──────────────────────────────────────────
      primary: AppColors.primary,
      onPrimary: AppColors.white,
      primaryContainer: AppColors.backgroundLight,
      onPrimaryContainer: AppColors.primaryDark,
      // ── Secondary (Accent) ───────────────────────────────
      secondary: AppColors.accent,
      onSecondary: AppColors.white,
      secondaryContainer: AppColors.backgroundLight,
      onSecondaryContainer: AppColors.primaryDark,
      // ── Surface ──────────────────────────────────────────
      surface: AppColors.white,
      onSurface: AppColors.textPrimary,
      surfaceContainerHighest: AppColors.backgroundLight,
      // ── Error ────────────────────────────────────────────
      error: AppColors.error,
      onError: AppColors.white,
      // ── Outline ──────────────────────────────────────────
      outline: AppColors.border,
      outlineVariant: AppColors.borderLight,
    );
  }

  // ── AppBar ───────────────────────────────────────────────────
  static AppBarTheme _buildAppBarTheme() {
    return AppBarTheme(
      backgroundColor: AppColors.white,
      foregroundColor: AppColors.textPrimary,
      elevation: 0,
      scrolledUnderElevation: 0.5,
      shadowColor: AppColors.border,
      centerTitle: false,
      titleTextStyle: AppStyles.semibold17.copyWith(
        color: AppColors.textPrimary,
      ),
      iconTheme: const IconThemeData(color: AppColors.textPrimary),
      actionsIconTheme: const IconThemeData(color: AppColors.primary),
    );
  }

  // ── Bottom Navigation Bar ────────────────────────────────────
  static BottomNavigationBarThemeData _buildBottomNavBarTheme() {
    return BottomNavigationBarThemeData(
      backgroundColor: AppColors.white,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.textSecondary,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      elevation: 8,
      selectedLabelStyle: AppStyles.bodyXSmallMd,
      unselectedLabelStyle: AppStyles.bodyXSmallRg,
    );
  }

  // ── ElevatedButton ───────────────────────────────────────────
  static ElevatedButtonThemeData _buildElevatedButtonTheme() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        disabledBackgroundColor: AppColors.border,
        disabledForegroundColor: AppColors.textSecondary,
        elevation: 0,
        textStyle: AppStyles.buttonLarge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        minimumSize: Size(double.infinity, 56.h),
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.h),
      ),
    );
  }

  // ── OutlinedButton ───────────────────────────────────────────
  static OutlinedButtonThemeData _buildOutlinedButtonTheme() {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primary,
        side: const BorderSide(color: AppColors.primary, width: 1.5),
        textStyle: AppStyles.buttonLarge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        minimumSize: Size(double.infinity, 56.h),
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.h),
      ),
    );
  }

  // ── TextButton ───────────────────────────────────────────────
  static TextButtonThemeData _buildTextButtonTheme() {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primary,
        textStyle: AppStyles.bodySmallMd,
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      ),
    );
  }

  // ── InputDecoration (TextField / Form) ───────────────────────
  static InputDecorationTheme _buildInputDecorationTheme() {
    return InputDecorationTheme(
      filled: true,
      fillColor: AppColors.backgroundLight,
      hintStyle: AppStyles.bodyMediumRg.copyWith(
        color: AppColors.textSecondary,
      ),
      labelStyle: AppStyles.bodyMediumRg.copyWith(
        color: AppColors.textSecondary,
      ),
      floatingLabelStyle: AppStyles.bodySmallMd.copyWith(
        color: AppColors.primary,
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: const BorderSide(color: AppColors.error),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: const BorderSide(color: AppColors.error, width: 1.5),
      ),
      prefixIconColor: AppColors.textSecondary,
      suffixIconColor: AppColors.textSecondary,
    );
  }

  // ── Card ─────────────────────────────────────────────────────
  static CardThemeData _buildCardTheme() {
    return CardThemeData(
      color: AppColors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
        side: const BorderSide(color: AppColors.borderLight),
      ),
      margin: EdgeInsets.zero,
    );
  }

  // ── Chip ─────────────────────────────────────────────────────
  static ChipThemeData _buildChipTheme() {
    return ChipThemeData(
      backgroundColor: AppColors.backgroundLight,
      selectedColor: AppColors.primary,
      labelStyle: AppStyles.bodySmallMd.copyWith(color: AppColors.textPrimary),
      secondaryLabelStyle: AppStyles.bodySmallMd.copyWith(
        color: AppColors.white,
      ),
      side: const BorderSide(color: AppColors.border),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
    );
  }

  // ── Divider ──────────────────────────────────────────────────
  static DividerThemeData _buildDividerTheme() {
    return const DividerThemeData(
      color: AppColors.borderLight,
      thickness: 1,
      space: 0,
    );
  }

  // ── Icon ─────────────────────────────────────────────────────
  static IconThemeData _buildIconTheme() {
    return const IconThemeData(color: AppColors.textPrimary, size: 24);
  }

  // ── CheckBox ─────────────────────────────────────────────────
  static CheckboxThemeData _buildCheckboxTheme() {
    return CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) return AppColors.primary;
        return Colors.transparent;
      }),
      checkColor: WidgetStateProperty.all(AppColors.white),
      side: const BorderSide(color: AppColors.border, width: 1.5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
    );
  }

  // ── Radio ────────────────────────────────────────────────────
  static RadioThemeData _buildRadioTheme() {
    return RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) return AppColors.primary;
        return AppColors.textSecondary;
      }),
    );
  }

  // ── Switch ───────────────────────────────────────────────────
  static SwitchThemeData _buildSwitchTheme() {
    return SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) return AppColors.white;
        return AppColors.textSecondary;
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) return AppColors.primary;
        return AppColors.border;
      }),
    );
  }

  // ── SnackBar ─────────────────────────────────────────────────
  static SnackBarThemeData _buildSnackBarTheme() {
    return SnackBarThemeData(
      backgroundColor: AppColors.textPrimary,
      contentTextStyle: AppStyles.bodySmallRg.copyWith(color: AppColors.white),
      actionTextColor: AppColors.accent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      behavior: SnackBarBehavior.floating,
    );
  }

  // ── ProgressIndicator ────────────────────────────────────────
  static ProgressIndicatorThemeData _buildProgressIndicatorTheme() {
    return const ProgressIndicatorThemeData(
      color: AppColors.primary,
      linearTrackColor: AppColors.backgroundLight,
      circularTrackColor: AppColors.backgroundLight,
    );
  }

  // ── TabBar ───────────────────────────────────────────────────
  static TabBarThemeData _buildTabBarTheme() {
    return TabBarThemeData(
      labelColor: AppColors.primary,
      unselectedLabelColor: AppColors.textSecondary,
      labelStyle: AppStyles.bodySmallSb,
      unselectedLabelStyle: AppStyles.bodySmallRg,
      indicatorColor: AppColors.primary,
      indicatorSize: TabBarIndicatorSize.label,
      dividerColor: AppColors.borderLight,
    );
  }

  // ── Badge ────────────────────────────────────────────────────
  static BadgeThemeData _buildBadgeTheme() {
    return BadgeThemeData(
      backgroundColor: AppColors.error,
      textColor: AppColors.white,
      textStyle: AppStyles.bodyXSmallMd,
      padding: EdgeInsets.symmetric(horizontal: 6.w),
    );
  }
}
