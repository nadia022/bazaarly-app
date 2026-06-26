import 'package:bazarly_app/core/services/services_locator.dart';
import 'package:bazarly_app/features/auth/data/repo/auth_repo.dart';
import 'package:bazarly_app/features/auth/presentation/view_model/login_cubit/login_cubit.dart';
import 'package:bazarly_app/features/auth/presentation/views/login/widgets/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body:  SafeArea(
        child: BlocProvider(
          create: (context) => LoginCubit(getIt<AuthRepo>()),
          child: LoginViewBody(),
        ),
      ),
    );
  }
}


