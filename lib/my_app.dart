import 'package:bazarly_app/core/utils/router/app_router.dart';
import 'package:bazarly_app/core/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), 
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          title: 'Bazaarly',
          routerConfig: AppRouter.router,
          theme: AppTheme.appTheme,
          themeMode: ThemeMode.light,
          debugShowCheckedModeBanner: false,

          builder: (context, widget) {
            final mediaQuery = MediaQuery.of(context);

            return MediaQuery(
              data: mediaQuery.copyWith(
                textScaler: const TextScaler.linear(1.0),
              ),
              child: SafeArea(
                top: false,
                bottom: true,
                child: widget ?? const SizedBox(),
              ),
            );
          },
        );
      },
    );
  }
}
