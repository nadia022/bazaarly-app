import 'package:bazarly_app/core/services/services_locator.dart';
import 'package:bazarly_app/features/auth/data/repo/auth_repo.dart';
import 'package:bazarly_app/features/auth/presentation/view_model/sign_up_cubit/sign_up_cubit.dart';
import 'package:bazarly_app/features/auth/presentation/views/sign_up/widgets/sign_up_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: BlocProvider(
          create: (context) => SignUpCubit(getIt<AuthRepo>()),
          child: SignUpViewBody(),
        ),
      ),
    );
  }
}
