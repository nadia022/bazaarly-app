import 'package:bazarly_app/features/auth/presentation/views/sign_up/widgets/sign_up_view_body.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: const SafeArea(
        child: SignUpViewBody(),
      ),
    );
  }
}