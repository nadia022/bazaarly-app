import 'package:bazarly_app/core/services/services_locator.dart';
import 'package:bazarly_app/core/widgets/app_nav_bar.dart';
import 'package:bazarly_app/core/widgets/main_layout_view_body.dart';
import 'package:bazarly_app/features/cart/data/repos/cart_repo.dart';
import 'package:bazarly_app/features/cart/presentation/view_models/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// The root scaffold of the app after login.
///
/// Holds the [AppNavBar] and switches between the 4 main screens.
/// All screens share this single Scaffold so the nav bar never
/// rebuilds or flickers when switching tabs.
class MainLayoutView extends StatelessWidget {
  const MainLayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(cartRepo: getIt<CartRepo>()),
      child: const Scaffold(body: MainLayoutViewBody()),
    );
  }
}
