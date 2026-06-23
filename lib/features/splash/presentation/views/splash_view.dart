import 'package:bazarly_app/core/utils/colors/app_colors.dart';
import 'package:bazarly_app/features/splash/presentation/views/widgets/splash_body.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary, 
      body: SplashBody(),
    );
  }
}