import 'package:bazarly_app/core/utils/colors/app_colors.dart';
import 'package:bazarly_app/core/utils/styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ═══════════════════════════════════════════════════════════════
//  🎨  BAZAARLY — APP THEME

// ═══════════════════════════════════════════════════════════════

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        fontFamily: AppStyles.fontFamily,
        colorScheme: ColorScheme(
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
        ),

        // ── Scaffold ─────────────────────────────────────────────
        scaffoldBackgroundColor: AppColors.white,

        // ── AppBar ───────────────────────────────────────────────
        appBarTheme: AppBarTheme(
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
        ),

        // ── Bottom Navigation Bar ─────────────────────────────────
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.white,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.textSecondary,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          elevation: 8,
          selectedLabelStyle: AppStyles.bodyXSmallMd,
          unselectedLabelStyle: AppStyles.bodyXSmallRg,
        ),

        // ── ElevatedButton ────────────────────────────────────────
        elevatedButtonTheme: ElevatedButtonThemeData(
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
        ),

        // ── OutlinedButton ────────────────────────────────────────
        outlinedButtonTheme: OutlinedButtonThemeData(
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
        ),

        // ── TextButton ────────────────────────────────────────────
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: AppColors.primary,
            textStyle: AppStyles.bodySmallMd,
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
          ),
        ),

        // ── InputDecoration (TextField / Form) ────────────────────
        inputDecorationTheme: InputDecorationTheme(
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
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
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
        ),

        // ── Card ──────────────────────────────────────────────────
        cardTheme: CardThemeData(
          color: AppColors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
            side: const BorderSide(color: AppColors.borderLight),
          ),
          margin: EdgeInsets.zero,
        ),

        // ── Chip ──────────────────────────────────────────────────
        chipTheme: ChipThemeData(
          backgroundColor: AppColors.backgroundLight,
          selectedColor: AppColors.primary,
          labelStyle: AppStyles.bodySmallMd.copyWith(
            color: AppColors.textPrimary,
          ),
          secondaryLabelStyle: AppStyles.bodySmallMd.copyWith(
            color: AppColors.white,
          ),
          side: const BorderSide(color: AppColors.border),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
        ),

        // ── Divider ───────────────────────────────────────────────
        dividerTheme: const DividerThemeData(
          color: AppColors.borderLight,
          thickness: 1,
          space: 0,
        ),

        // ── Icon ──────────────────────────────────────────────────
        iconTheme: const IconThemeData(
          color: AppColors.textPrimary,
          size: 24,
        ),

        // ── CheckBox ──────────────────────────────────────────────
        checkboxTheme: CheckboxThemeData(
          fillColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return AppColors.primary;
            }
            return Colors.transparent;
          }),
          checkColor: WidgetStateProperty.all(AppColors.white),
          side: const BorderSide(color: AppColors.border, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),

        // ── Radio ─────────────────────────────────────────────────
        radioTheme: RadioThemeData(
          fillColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) return AppColors.primary;
            return AppColors.textSecondary;
          }),
        ),

        // ── Switch ────────────────────────────────────────────────
        switchTheme: SwitchThemeData(
          thumbColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) return AppColors.white;
            return AppColors.textSecondary;
          }),
          trackColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) return AppColors.primary;
            return AppColors.border;
          }),
        ),

        // ── SnackBar ──────────────────────────────────────────────
        snackBarTheme: SnackBarThemeData(
          backgroundColor: AppColors.textPrimary,
          contentTextStyle:
              AppStyles.bodySmallRg.copyWith(color: AppColors.white),
          actionTextColor: AppColors.accent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          behavior: SnackBarBehavior.floating,
        ),

        // ── ProgressIndicator ─────────────────────────────────────
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: AppColors.primary,
          linearTrackColor: AppColors.backgroundLight,
          circularTrackColor: AppColors.backgroundLight,
        ),

        // ── TabBar ────────────────────────────────────────────────
        tabBarTheme: TabBarThemeData(
          labelColor: AppColors.primary,
          unselectedLabelColor: AppColors.textSecondary,
          labelStyle: AppStyles.bodySmallSb,
          unselectedLabelStyle: AppStyles.bodySmallRg,
          indicatorColor: AppColors.primary,
          indicatorSize: TabBarIndicatorSize.label,
          dividerColor: AppColors.borderLight,
        ),

        // ── Badge ─────────────────────────────────────────────────
        badgeTheme: BadgeThemeData(
          backgroundColor: AppColors.error,
          textColor: AppColors.white,
          textStyle: AppStyles.bodyXSmallMd,
          padding: EdgeInsets.symmetric(horizontal: 6.w),
        ),
      );
}



