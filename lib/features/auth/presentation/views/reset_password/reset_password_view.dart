import 'package:bazarly_app/features/auth/presentation/views/reset_password/widgets/reset_password_view_body.dart';
import 'package:flutter/material.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: const Scaffold(body: ResetPasswordViewBody()));
  }
}
