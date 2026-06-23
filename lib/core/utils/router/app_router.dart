import 'package:bazarly_app/features/auth/presentation/views/login/login_view.dart';
import 'package:bazarly_app/features/auth/presentation/views/sign_up/sign_up_view.dart';
import 'package:bazarly_app/features/home/presentation/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:bazarly_app/features/splash/presentation/views/splash_view.dart';
import 'routes_name.dart';

class AppRouter {
  AppRouter._();

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: RoutesName.splash,

    routes: [
      /// Splash
      GoRoute(
        path: RoutesName.splash,
        name: RoutesName.splash,
        builder: (context, state) => const SplashView(),
      ),
       /// Home
      GoRoute(
        path: RoutesName.home,
        name: RoutesName.home,
        builder: (context, state) => const HomeView(),
      ),

      /// Login
      GoRoute(
        path: RoutesName.login,
        name: RoutesName.login,
        builder: (context, state) => const LoginView(),
      ),

      /// Sign Up
      GoRoute(
        path: RoutesName.signUp,
        name: RoutesName.signUp,
        builder: (context, state) => const SignUpView(),
      ),

     
    ],
  );
}