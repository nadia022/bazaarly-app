import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Bazaarly — Mobile Text Styles
/// Font: Poppins
class AppStyles {
  AppStyles._();

  static const String fontFamily = 'Poppins';
  // =========================================================
  // 📌 TITLES
  // =========================================================

  /// 32sp — Splash screen / hero headings
  static TextStyle get titleLarge => TextStyle(
    fontSize: 32.sp.clamp(28, 36),
    fontWeight: FontWeight.w500,
    fontFamily: fontFamily,
  );

  /// 24sp Medium — Section headings
  static TextStyle get titleMedium => TextStyle(
    fontSize: 24.sp.clamp(20, 28),
    fontWeight: FontWeight.w500,
    fontFamily: fontFamily,
  );

  /// 24sp SemiBold — Screen titles (Sign In, Sign Up, Cart…)
  static TextStyle get titleMediumSb => TextStyle(
    fontSize: 24.sp.clamp(20, 28),
    fontWeight: FontWeight.w600,
    fontFamily: fontFamily,
  );

  /// 24sp Regular — Light section titles
  static TextStyle get titleMediumRg => TextStyle(
    fontSize: 24.sp.clamp(20, 28),
    fontWeight: FontWeight.w400,
    fontFamily: fontFamily,
  );

  /// 20sp SemiBold — Card titles / product names
  static TextStyle get titleSmallSb => TextStyle(
    fontSize: 20.sp.clamp(18, 24),
    fontWeight: FontWeight.w600,
    fontFamily: fontFamily,
  );

  /// 14sp Medium — AppBar title / small headings
  static TextStyle get titleXSmall => TextStyle(
    fontSize: 14.sp.clamp(13, 16),
    fontWeight: FontWeight.w500,
    fontFamily: fontFamily,
  );

  /// 14sp Medium — AppBar title / small headings
  static TextStyle get generalText => TextStyle(
    fontSize: 10.sp.clamp(13, 16),
    fontWeight: FontWeight.w400,
    fontFamily: fontFamily,
  );

  // =========================================================
  // 🏷️ LABELS
  // =========================================================

  /// 16sp Medium — Form labels / tab labels
  static TextStyle get labelMedium => TextStyle(
    fontSize: 16.sp.clamp(14, 18),
    fontWeight: FontWeight.w500,
    fontFamily: fontFamily,
  );

  /// 16sp Regular — Secondary labels
  static TextStyle get labelMediumRg => TextStyle(
    fontSize: 16.sp.clamp(14, 18),
    fontWeight: FontWeight.w400,
    fontFamily: fontFamily,
  );

  // =========================================================
  // 🔘 BUTTONS
  // =========================================================

  /// 22sp SemiBold — Primary buttons (Login, Sign Up, Add to Cart…)
  static TextStyle get buttonLarge => TextStyle(
    fontSize: 22.sp.clamp(18, 24),
    fontWeight: FontWeight.w600,
    fontFamily: fontFamily,
  );

  /// 16sp SemiBold — Secondary / small buttons
  static TextStyle get buttonSmall => TextStyle(
    fontSize: 16.sp.clamp(14, 18),
    fontWeight: FontWeight.w600,
    fontFamily: fontFamily,
  );

  // =========================================================
  // 📝 BODY TEXT
  // =========================================================

  /// 20sp Regular — Product description / long body text
  static TextStyle get bodyXLargeRg => TextStyle(
    fontSize: 20.sp.clamp(18, 22),
    fontWeight: FontWeight.w400,
    fontFamily: fontFamily,
  );

  /// 18sp Regular — Body text default
  static TextStyle get bodyLargeRg => TextStyle(
    fontSize: 18.sp.clamp(16, 20),
    fontWeight: FontWeight.w400,
    fontFamily: fontFamily,
  );

  /// 18sp Medium — Emphasized body
  static TextStyle get bodyLargeMd => TextStyle(
    fontSize: 18.sp.clamp(16, 20),
    fontWeight: FontWeight.w500,
    fontFamily: fontFamily,
  );

  /// 18sp SemiBold — Prices / totals / highlights
  static TextStyle get bodyLargeSb => TextStyle(
    fontSize: 18.sp.clamp(16, 20),
    fontWeight: FontWeight.w600,
    fontFamily: fontFamily,
  );

  /// 16sp Regular — Form hints / secondary body
  static TextStyle get bodyMediumRg => TextStyle(
    fontSize: 16.sp.clamp(14, 18),
    fontWeight: FontWeight.w400,
    fontFamily: fontFamily,
  );

  /// 14sp Regular — Captions / small descriptions
  static TextStyle get bodySmallRg => TextStyle(
    fontSize: 14.sp.clamp(12, 16),
    fontWeight: FontWeight.w400,
    fontFamily: fontFamily,
  );

  /// 14sp Medium — Small emphasized text / tags
  static TextStyle get bodySmallMd => TextStyle(
    fontSize: 14.sp.clamp(12, 16),
    fontWeight: FontWeight.w500,
    fontFamily: fontFamily,
  );

  /// 14sp SemiBold — Category names / badges
  static TextStyle get bodySmallSb => TextStyle(
    fontSize: 14.sp.clamp(12, 16),
    fontWeight: FontWeight.w600,
    fontFamily: fontFamily,
  );

  /// 12sp Regular — Helper text / timestamps / hints
  static TextStyle get bodyXSmallRg => TextStyle(
    fontSize: 12.sp.clamp(10, 14),
    fontWeight: FontWeight.w400,
    fontFamily: fontFamily,
  );

  /// 12sp Medium — Small badges / bottom nav labels
  static TextStyle get bodyXSmallMd => TextStyle(
    fontSize: 12.sp.clamp(10, 14),
    fontWeight: FontWeight.w500,
    fontFamily: fontFamily,
  );

  // =========================================================
  // 🔢 SPECIAL CASES
  // =========================================================

  /// 17sp SemiBold — AppBar actions / nav titles
  static TextStyle get semibold17 => TextStyle(
    fontSize: 17.sp.clamp(15, 19),
    fontWeight: FontWeight.w600,
    fontFamily: fontFamily,
  );

  /// 24sp Medium — Section totals / checkout price
  static TextStyle get xxLargeMedium => TextStyle(
    fontSize: 24.sp.clamp(22, 28),
    fontWeight: FontWeight.w500,
    fontFamily: fontFamily,
  );
}
