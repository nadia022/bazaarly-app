import 'package:bazarly_app/core/utils/assets/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: SizedBox(
          height: 30.h,
          child: Image.asset(AppImages.imagesHomeLogo),
        ),
      ),
    );
  }
}
