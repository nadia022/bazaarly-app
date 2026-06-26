import 'package:bazarly_app/core/utils/styles/app_styles.dart';
import 'package:bazarly_app/core/validators/app_validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A stateful widget that contains the full sign-up form:
/// full name, mobile number, email, password fields,
/// and the sign-up submit button.
class SignUpForm extends StatefulWidget {
  const SignUpForm({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.mobileController,
    required this.emailController,
    required this.passwordController,
    required this.mobileFocusNode,
    required this.emailFocusNode,
    required this.passwordFocusNode,
  });

  /// Global key used to validate the form
  final GlobalKey<FormState> formKey;

  /// Controller for the full name text field
  final TextEditingController nameController;

  /// Controller for the mobile number text field
  final TextEditingController mobileController;

  /// Controller for the email text field
  final TextEditingController emailController;

  /// Controller for the password text field
  final TextEditingController passwordController;

  /// Focus node to shift keyboard focus to the mobile field
  final FocusNode mobileFocusNode;

  /// Focus node to shift keyboard focus to the email field
  final FocusNode emailFocusNode;

  /// Focus node to shift keyboard focus to the password field
  final FocusNode passwordFocusNode;

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
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
          // Label for the full name field
          Text(
            'Full Name',
            style: AppStyles.labelMedium.copyWith(
              color: Colors.white,
            ),
          ),

          SizedBox(height: 8.h),

          // Full name input field
          TextFormField(
            controller: widget.nameController,
            validator: AppValidators.validateName,

            // Move focus to the mobile number field on submit
            onFieldSubmitted: (_) =>
                FocusScope.of(context).requestFocus(widget.mobileFocusNode),

            decoration: const InputDecoration(
              hintText: 'enter your full name',
            ),
          ),

          SizedBox(height: 16.h),

          // Label for the mobile number field
          Text(
            'Mobile Number',
            style: AppStyles.labelMedium.copyWith(
              color: Colors.white,
            ),
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

            decoration: const InputDecoration(
              hintText: 'enter your mobile no.',
            ),
          ),

          SizedBox(height: 16.h),

          // Label for the email field
          Text(
            'E-mail address',
            style: AppStyles.labelMedium.copyWith(
              color: Colors.white,
            ),
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
            style: AppStyles.labelMedium.copyWith(
              color: Colors.white,
            ),
          ),

          SizedBox(height: 8.h),

          // Password input field with visibility toggle
          TextFormField(
            focusNode: widget.passwordFocusNode,
            controller: widget.passwordController,
            validator: AppValidators.validatePassword,
            obscureText: _isObscure,
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

          SizedBox(height: 40.h),

          // Sign-up submit button
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Theme.of(context).colorScheme.primary,
            ),
            onPressed: () {
              if (widget.formKey.currentState!.validate()) {
                // TODO: Proceed with registration logic when all fields are valid
              }
            },
            child: Text(
              'Sign up',
              style: AppStyles.buttonLarge.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),

          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}