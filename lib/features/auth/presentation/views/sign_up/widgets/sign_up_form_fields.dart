import 'package:bazarly_app/core/utils/styles/app_styles.dart';
import 'package:bazarly_app/core/validators/app_validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A stateful widget that renders all sign-up input fields:
/// full name, mobile number, email, password, and confirm password.
class SignUpFormFields extends StatefulWidget {
  const SignUpFormFields({
    super.key,
    required this.nameController,
    required this.mobileController,
    required this.emailController,
    required this.passwordController,
    required this.rePasswordController,
    required this.mobileFocusNode,
    required this.emailFocusNode,
    required this.passwordFocusNode,
  });

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
  State<SignUpFormFields> createState() => _SignUpFormFieldsState();
}

class _SignUpFormFieldsState extends State<SignUpFormFields> {
  // Controls whether the password field is hidden or visible
  bool _isPasswordObscure = true;

  // Controls whether the confirm password field is hidden or visible
  bool _isConfirmPasswordObscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Label for the full name field
        Text(
          'Full Name',
          style: AppStyles.labelMedium.copyWith(color: Colors.white),
        ),

        SizedBox(height: 8.h),

        // Full name input field
        TextFormField(
          controller: widget.nameController,
          validator: AppValidators.validateName,

          // Move focus to the mobile number field on submit
          onFieldSubmitted: (_) =>
              FocusScope.of(context).requestFocus(widget.mobileFocusNode),

          decoration: const InputDecoration(hintText: 'enter your full name'),
        ),

        SizedBox(height: 16.h),

        // Label for the mobile number field
        Text(
          'Mobile Number',
          style: AppStyles.labelMedium.copyWith(color: Colors.white),
        ),

        SizedBox(height: 8.h),

        // Mobile number input field
        TextFormField(
          focusNode: widget.mobileFocusNode,
          controller: widget.mobileController,
          validator: AppValidators.validatePhone,
          keyboardType: TextInputType.phone,

          // Move focus to the email field on submit
          onFieldSubmitted: (_) =>
              FocusScope.of(context).requestFocus(widget.emailFocusNode),

          decoration: const InputDecoration(hintText: 'enter your mobile no.'),
        ),

        SizedBox(height: 16.h),

        // Label for the email field
        Text(
          'E-mail address',
          style: AppStyles.labelMedium.copyWith(color: Colors.white),
        ),

        SizedBox(height: 8.h),

        // Email input field
        TextFormField(
          focusNode: widget.emailFocusNode,
          controller: widget.emailController,
          validator: AppValidators.validateEmail,
          keyboardType: TextInputType.emailAddress,

          // Move focus to the password field on submit
          onFieldSubmitted: (_) =>
              FocusScope.of(context).requestFocus(widget.passwordFocusNode),

          decoration: const InputDecoration(
            hintText: 'enter your email address',
          ),
        ),

        SizedBox(height: 16.h),

        // Label for the password field
        Text(
          'Password',
          style: AppStyles.labelMedium.copyWith(color: Colors.white),
        ),

        SizedBox(height: 8.h),

        // Password input field with visibility toggle
        TextFormField(
          focusNode: widget.passwordFocusNode,
          controller: widget.passwordController,
          validator: AppValidators.validatePassword,
          obscureText: _isPasswordObscure,
          decoration: InputDecoration(
            hintText: 'enter your password',

            // Button to toggle password visibility
            suffixIcon: IconButton(
              icon: Icon(
                _isPasswordObscure
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: Colors.grey,
              ),
              onPressed: () {
                setState(() => _isPasswordObscure = !_isPasswordObscure);
              },
            ),
          ),
        ),

        SizedBox(height: 16.h),

        // Label for the confirm password field
        Text(
          'Confirm Password',
          style: AppStyles.labelMedium.copyWith(color: Colors.white),
        ),

        SizedBox(height: 8.h),

        // Confirm password input field with visibility toggle
        TextFormField(
          controller: widget.rePasswordController,
          obscureText: _isConfirmPasswordObscure,

          // Validate that confirm password matches the original password
          validator: (value) => AppValidators.validateConfirmPassword(
            value,
            widget.passwordController.text,
          ),
          decoration: InputDecoration(
            hintText: 'confirm your password',

            // Button to toggle confirm password visibility
            suffixIcon: IconButton(
              icon: Icon(
                _isConfirmPasswordObscure
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: Colors.grey,
              ),
              onPressed: () {
                setState(
                  () => _isConfirmPasswordObscure = !_isConfirmPasswordObscure,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
