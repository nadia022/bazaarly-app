import 'package:bazarly_app/core/services/services_locator.dart';
import 'package:bazarly_app/features/home/data/repos/home_repo.dart';
import 'package:bazarly_app/features/home/presentation/view/widgets/home_tab_view_body.dart';
import 'package:bazarly_app/features/home/presentation/view_models/home_fetch_cubit/home_fetch_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTabView extends StatelessWidget {
  const HomeTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeFeatchCubit(getIt<HomeRepo>()),
      child: const Scaffold(body: HomeTabViewBody()),
    );
  }
}
