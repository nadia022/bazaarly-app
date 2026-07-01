import 'package:bazarly_app/core/widgets/app_nav_bar.dart';
import 'package:bazarly_app/core/widgets/main_layout_view_body.dart';
import 'package:flutter/material.dart';

/// The root scaffold of the app after login.
///
/// Holds the [AppNavBar] and switches between the 4 main screens.
/// All screens share this single Scaffold so the nav bar never
/// rebuilds or flickers when switching tabs.
class MainLayoutView extends StatelessWidget {
  const MainLayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: MainLayoutViewBody());
  }
}
