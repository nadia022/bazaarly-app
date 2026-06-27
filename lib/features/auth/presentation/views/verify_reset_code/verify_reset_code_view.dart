import 'package:bazarly_app/features/auth/presentation/views/verify_reset_code/widgets/verify_reset_code_view_body.dart';
import 'package:flutter/material.dart';

class VerifyResetCodeView extends StatelessWidget {
  const VerifyResetCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: VerifyResetCodeViewBody()),
    );
  }
}