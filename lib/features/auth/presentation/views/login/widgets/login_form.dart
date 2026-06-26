import 'package:bazarly_app/core/utils/router/routes_name.dart';
import 'package:bazarly_app/core/utils/styles/app_styles.dart';
import 'package:bazarly_app/core/validators/app_validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

/// A stateful widget that contains the full login form:
/// username field, password field, forgot password link,
/// login button, and navigation to the sign-up screen.
class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.passwordController,
    required this.passFocusNode,
  });

  /// Global key used to validate the form
  final GlobalKey<FormState> formKey;

  /// Controller for the username text field
  final TextEditingController nameController;

  /// Controller for the password text field
  final TextEditingController passwordController;

  /// Focus node to shift focus from username to password field
  final FocusNode passFocusNode;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  // Controls whether the password is hidden or visible
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,

      // Validate fields automatically after each user interaction
      autovalidateMode: AutovalidateMode.onUserInteraction,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Label for the username field
          Text(
            'User Name',
            style: AppStyles.labelMedium.copyWith(
              color: Colors.white,
            ),
          ),

          SizedBox(height: 8.h),

          // Username input field
          TextFormField(
            controller: widget.nameController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: 'enter your name',
            ),
            validator: AppValidators.validateName,

            // Move focus to the password field when "Next" is pressed
            onFieldSubmitted: (_) =>
                FocusScope.of(context).requestFocus(widget.passFocusNode),
          ),

          SizedBox(height: 20.h),

          // Label for the password field
          Text(
            'Password',
            style: AppStyles.labelMedium.copyWith(
              color: Colors.white,
            ),
          ),

          SizedBox(height: 8.h),

          // Password input field with visibility toggle
          TextFormField(
            controller: widget.passwordController,
            validator: AppValidators.validatePassword,
            obscureText: _isObscure,
            focusNode: widget.passFocusNode,
            decoration: InputDecoration(
              hintText: 'enter your password',

              // Button to toggle password visibility
              suffixIcon: IconButton(
                icon: Icon(
                  _isObscure
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
              ),
            ),
          ),

          SizedBox(height: 14.h),

          // Forgot password link aligned to the right
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                // TODO: Navigate to forgot password screen
              },
              child: Text(
                'Forgot password',
                style: AppStyles.bodyMediumRg.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ),

          SizedBox(height: 56.h),

          // Login submit button
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Theme.of(context).colorScheme.primary,
            ),
            onPressed: () {
              if (widget.formKey.currentState!.validate()) {
                // TODO: Proceed with login logic when all fields are valid
                // context.go(RoutesName.home);
              }
            },
            child: Text(
              'Login',
              style: AppStyles.buttonLarge.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),

          SizedBox(height: 24.h),

          // Navigation row to the sign-up screen
          GestureDetector(
            onTap: () {
              context.push(RoutesName.signUp);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Prompt text for users without an account
                Text(
                  "Don't have an account? ",
                  style: AppStyles.bodyMediumRg.copyWith(
                    color: Colors.white,
                  ),
                ),

                // Underlined link to navigate to the sign-up screen
                Text(
                  "Create Account",
                  style: AppStyles.bodySmallSb.copyWith(
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}