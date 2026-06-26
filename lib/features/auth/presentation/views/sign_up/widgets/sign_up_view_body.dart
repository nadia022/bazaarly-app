import 'package:bazarly_app/core/functions/hide_keyboard.dart';
import 'package:bazarly_app/features/auth/presentation/views/sign_up/widgets/sign_up_form.dart';
import 'package:bazarly_app/features/auth/presentation/views/sign_up/widgets/sign_up_intro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// The main body of the Sign-Up screen.
///
/// Manages the form key, text controllers, and focus nodes,
/// then delegates the UI to [SignUpIntro] and [SignUpForm].
class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  /// Global key used to validate the sign-up form
  final _formKey = GlobalKey<FormState>();

  /// Controller for the full name input field
  final TextEditingController _nameController = TextEditingController();

  /// Controller for the mobile number input field
  final TextEditingController _mobileController = TextEditingController();

  /// Controller for the email input field
  final TextEditingController _emailController = TextEditingController();

  /// Controller for the password input field
  final TextEditingController _passwordController = TextEditingController();

  /// Focus node to shift keyboard focus to the mobile field
  final FocusNode _mobileFocusNode = FocusNode();

  /// Focus node to shift keyboard focus to the email field
  final FocusNode _emailFocusNode = FocusNode();

  /// Focus node to shift keyboard focus to the password field
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    // Dispose all controllers to free resources
    _nameController.dispose();
    _mobileController.dispose();
    _emailController.dispose();
    _passwordController.dispose();

    // Dispose all focus nodes to free resources
    _mobileFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();

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
            SizedBox(height: 30.h),

            // Displays the app logo at the top of the screen
            const SignUpIntro(),

            SizedBox(height: 40.h),

            // Displays all sign-up fields and the submit button
            SignUpForm(
              formKey: _formKey,
              nameController: _nameController,
              mobileController: _mobileController,
              emailController: _emailController,
              passwordController: _passwordController,
              mobileFocusNode: _mobileFocusNode,
              emailFocusNode: _emailFocusNode,
              passwordFocusNode: _passwordFocusNode,
            ),
          ],
        ),
      ),
    );
  }
}