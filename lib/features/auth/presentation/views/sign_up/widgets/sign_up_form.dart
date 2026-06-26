import 'package:bazarly_app/features/auth/presentation/views/sign_up/widgets/sign_up_button.dart';
import 'package:bazarly_app/features/auth/presentation/views/sign_up/widgets/sign_up_form_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A widget that composes the complete sign-up form
/// by combining [SignUpFormFields] and [SignUpButton].
class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.mobileController,
    required this.emailController,
    required this.passwordController,
    required this.rePasswordController,
    required this.mobileFocusNode,
    required this.emailFocusNode,
    required this.passwordFocusNode,
  });

  /// Global key used to validate the form before submitting
  final GlobalKey<FormState> formKey;

  /// Controller for the full name text field
  final TextEditingController nameController;

  /// Controller for the mobile number text field
  final TextEditingController mobileController;

  /// Controller for the email text field
  final TextEditingController emailController;

  /// Controller for the password text field
  final TextEditingController passwordController;

  /// Controller for the confirm password text field
  final TextEditingController rePasswordController;

  /// Focus node to shift keyboard focus to the mobile field
  final FocusNode mobileFocusNode;

  /// Focus node to shift keyboard focus to the email field
  final FocusNode emailFocusNode;

  /// Focus node to shift keyboard focus to the password field
  final FocusNode passwordFocusNode;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,

      // Validate fields automatically after each user interaction
      autovalidateMode: AutovalidateMode.onUserInteraction,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // All input fields (name, mobile, email, password, confirm password)
          SignUpFormFields(
            nameController: nameController,
            mobileController: mobileController,
            emailController: emailController,
            passwordController: passwordController,
            rePasswordController: rePasswordController,
            mobileFocusNode: mobileFocusNode,
            emailFocusNode: emailFocusNode,
            passwordFocusNode: passwordFocusNode,
          ),

          SizedBox(height: 40.h),

          // Submit button with Bloc state handling
          SignUpButton(
            formKey: formKey,
            nameController: nameController,
            mobileController: mobileController,
            emailController: emailController,
            passwordController: passwordController,
            rePasswordController: rePasswordController,
          ),

          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}
