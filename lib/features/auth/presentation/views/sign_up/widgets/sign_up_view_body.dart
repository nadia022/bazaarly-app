import 'package:bazarly_app/core/functions/hide_keyboard.dart';
import 'package:bazarly_app/core/utils/assets/app_images.dart';
import 'package:bazarly_app/core/utils/styles/app_styles.dart';
import 'package:bazarly_app/core/validators/app_validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  // Form key used to validate all form fields
  final _formKey = GlobalKey<FormState>();

  // Controllers for text fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Focus nodes to handle keyboard navigation between fields
  final FocusNode _mobileFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  // Controls password visibility state
  bool _isObscure = true;

  @override
  void dispose() {
    // Dispose controllers to prevent memory leaks
    _nameController.dispose();
    _mobileController.dispose();
    _emailController.dispose();
    _passwordController.dispose();

    // Dispose focus nodes
    _mobileFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();

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
              SizedBox(height: 30.h),

              // App logo
              Image.asset(
                AppImages.imagesBazaarlyLogoPNG,
                height: 45.h,
                fit: BoxFit.contain,
              ),

              SizedBox(height: 40.h),

              // Full name label
              Text(
                'Full Name',
                style: AppStyles.labelMedium.copyWith(
                  color: Colors.white,
                ),
              ),

              SizedBox(height: 8.h),

              // Full name input field
              TextFormField(
                controller: _nameController,
                validator: AppValidators.validateName,

                // Move focus to mobile field
                onFieldSubmitted: (_) => FocusScope.of(
                  context,
                ).requestFocus(_mobileFocusNode),

                decoration: const InputDecoration(
                  hintText: 'enter your full name',
                ),
              ),

              SizedBox(height: 16.h),

              // Mobile number label
              Text(
                'Mobile Number',
                style: AppStyles.labelMedium.copyWith(
                  color: Colors.white,
                ),
              ),

              SizedBox(height: 8.h),

              // Mobile number input field
              TextFormField(
                focusNode: _mobileFocusNode,
                controller: _mobileController,
                validator: AppValidators.validatePhone,
                keyboardType: TextInputType.phone,

                // Move focus to email field
                onFieldSubmitted: (_) => FocusScope.of(
                  context,
                ).requestFocus(_emailFocusNode),

                decoration: const InputDecoration(
                  hintText: 'enter your mobile no.',
                ),
              ),

              SizedBox(height: 16.h),

              // Email label
              Text(
                'E-mail address',
                style: AppStyles.labelMedium.copyWith(
                  color: Colors.white,
                ),
              ),

              SizedBox(height: 8.h),

              // Email input field
              TextFormField(
                focusNode: _emailFocusNode,
                controller: _emailController,
                validator: AppValidators.validateEmail,
                keyboardType: TextInputType.emailAddress,

                // Move focus to password field
                onFieldSubmitted: (_) => FocusScope.of(
                  context,
                ).requestFocus(_passwordFocusNode),

                decoration: const InputDecoration(
                  hintText: 'enter your email address',
                ),
              ),

              SizedBox(height: 16.h),

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
                focusNode: _passwordFocusNode,
                controller: _passwordController,
                validator: AppValidators.validatePassword,
                obscureText: _isObscure,
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

              SizedBox(height: 40.h),

              // Sign up button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Theme.of(context).colorScheme.primary,
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Proceed with registration when all fields are valid
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
        ),
      ),
    );
  }
}