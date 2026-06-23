import 'package:bazarly_app/core/functions/hide_keyboard.dart';
import 'package:bazarly_app/core/utils/assets/app_images.dart';
import 'package:bazarly_app/core/utils/router/routes_name.dart';
import 'package:bazarly_app/core/utils/styles/app_styles.dart';
import 'package:bazarly_app/core/validators/app_validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  // Form key used to validate all form fields
  final _formKey = GlobalKey<FormState>();

  // Controllers for text fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Focus node to move focus from username to password field
  final FocusNode _passFocusNode = FocusNode();

  // Controls password visibility state
  bool _isObscure = true;

  @override
  void dispose() {
    // Dispose controllers and focus node to prevent memory leaks
    _nameController.dispose();
    _passwordController.dispose();
    _passFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Hide keyboard when tapping outside text fields
      onTap: () => hideKeyboard(context),
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Form(
          key: _formKey,

          // Validate fields after user interaction
          autovalidateMode: AutovalidateMode.onUserInteraction,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 40.h),

              // App logo
              Image.asset(
                AppImages.imagesBazaarlyLogoPNG,
                height: 45.h,
                fit: BoxFit.contain,
              ),

              SizedBox(height: 50.h),

              // Welcome title
              Text(
                'Welcome Back to Bazaarly',
                style: AppStyles.titleMediumSb.copyWith(
                  color: Colors.white,
                ),
              ),

              SizedBox(height: 4.h),

              // Subtitle
              Text(
                'Please sign in with your mail',
                style: AppStyles.bodyMediumRg.copyWith(
                  // ignore: deprecated_member_use
                  color: Colors.white.withOpacity(0.8),
                ),
              ),

              SizedBox(height: 32.h),

              // Username label
              Text(
                'User Name',
                style: AppStyles.labelMedium.copyWith(
                  color: Colors.white,
                ),
              ),

              SizedBox(height: 8.h),

              // Username input field
              TextFormField(
                controller: _nameController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: 'enter your name',
                ),
                validator: AppValidators.validateName,

                // Move focus to password field when pressing "Next"
                onFieldSubmitted: (_) =>
                    FocusScope.of(context).requestFocus(_passFocusNode),
              ),

              SizedBox(height: 20.h),

              // Password label
              Text(
                'Password',
                style: AppStyles.labelMedium.copyWith(
                  color: Colors.white,
                ),
              ),

              SizedBox(height: 8.h),

              // Password input field
              TextFormField(
                controller: _passwordController,
                validator: AppValidators.validatePassword,
                obscureText: _isObscure,
                focusNode: _passFocusNode,
                decoration: InputDecoration(
                  hintText: 'enter your password',

                  // Toggle password visibility
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

              // Forgot password action
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Forgot password',
                    style: AppStyles.bodyMediumRg.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 56.h),

              // Login button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Theme.of(context).colorScheme.primary,
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Proceed with login when all fields are valid
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

              // Navigate to sign up screen
              GestureDetector(
                onTap: () {
                  context.push(RoutesName.signUp);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: AppStyles.bodyMediumRg.copyWith(
                        color: Colors.white,
                      ),
                    ),
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
        ),
      ),
    );
  }
}