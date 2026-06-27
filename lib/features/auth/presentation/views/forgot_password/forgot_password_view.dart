import 'package:bazarly_app/features/auth/presentation/views/forgot_password/widgets/forgot_password_view_body.dart';
import 'package:flutter/material.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: ForgotPasswordViewBody()));
  }
}
