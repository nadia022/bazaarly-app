import 'package:bazarly_app/core/functions/hide_keyboard.dart';
import 'package:bazarly_app/features/auth/presentation/views/login/widgets/login_form.dart';
import 'package:bazarly_app/features/auth/presentation/views/login/widgets/login_intro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// The main body of the Login screen.
///
/// Manages the form key, text controllers, and focus node,
/// then delegates the UI to [LoginIntro] and [LoginForm].
class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  /// Global key used to validate the login form
  final _formKey = GlobalKey<FormState>();

  /// Controller for the username input field
  final TextEditingController _nameController = TextEditingController();

  /// Controller for the password input field
  final TextEditingController _passwordController = TextEditingController();

  /// Focus node used to shift keyboard focus to the password field
  final FocusNode _passFocusNode = FocusNode();

  @override
  void dispose() {
    // Dispose all controllers and focus nodes to free resources
    _nameController.dispose();
    _passwordController.dispose();
    _passFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Dismiss the keyboard when the user taps outside any text field
      onTap: () => hideKeyboard(context),
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(height: 40.h),

            // Displays the app logo, welcome title, and subtitle
            const LoginIntro(),

            SizedBox(height: 32.h),

            // Displays the username field, password field,
            // forgot password link, login button, and sign-up navigation
            LoginForm(
              formKey: _formKey,
              nameController: _nameController,
              passwordController: _passwordController,
              passFocusNode: _passFocusNode,
            ),
          ],
        ),
      ),
    );
  }
}