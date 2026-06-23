import 'package:bazarly_app/core/utils/assets/app_images.dart';
import 'package:bazarly_app/core/utils/colors/app_colors.dart';
import 'package:bazarly_app/core/utils/styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class AppSuccessDialog extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback onTapped;

  const AppSuccessDialog({
    super.key,
    required this.title,
    required this.message,
    required this.onTapped,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: Dialog(
        backgroundColor: AppColors.backgroundLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(80),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                AppImages.imagesSuccessDialog,
              ),
              const SizedBox(height: 50),
              Text(
                title,
                style: AppStyles.bodyLargeSb.copyWith(
                  color: AppColors.primaryDark,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                message,
                style: AppStyles.bodyMediumRg.copyWith(
                  color: AppColors.primary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
