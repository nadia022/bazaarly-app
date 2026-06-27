import 'package:bazarly_app/core/functions/hide_keyboard.dart';
import 'package:bazarly_app/core/utils/assets/app_lottie.dart';
import 'package:bazarly_app/core/utils/colors/app_colors.dart';
import 'package:bazarly_app/core/utils/router/routes_name.dart';
import 'package:bazarly_app/core/utils/styles/app_styles.dart';
import 'package:bazarly_app/core/validators/app_validators.dart';
import 'package:bazarly_app/features/auth/presentation/views/shared/auth_screen_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordViewBody extends StatefulWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  State<ForgotPasswordViewBody> createState() => _ForgotPasswordViewBodyState();
}

class _ForgotPasswordViewBodyState extends State<ForgotPasswordViewBody> {
  // Form key used to validate the email field before submitting
  final _formKey = GlobalKey<FormState>();

  // Controller for the email input field
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Dismiss keyboard when tapping outside any text field
      onTap: () => hideKeyboard(context),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Gradient header with Lottie lock animation and screen title
            const AuthScreenHeader(
              title: 'Forgot Password',
              lottiePath: AppLottie.forgotPassword,
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Subtitle describing what this screen does
                    Text(
                      'Please enter your email to reset your password',
                      style: AppStyles.bodyMediumRg.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),

                    SizedBox(height: 28.h),

                    // Email field label
                    Text(
                      'E-mail address',
                      style: AppStyles.labelMedium.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),

                    SizedBox(height: 8.h),

                    // Email input field
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: AppValidators.validateEmail,
                      decoration: InputDecoration(
                        hintText: 'enter your email address',
                        prefixIcon: const Icon(
                          Icons.email_outlined,
                          color: AppColors.primary,
                        ),
                        filled: true,
                        fillColor: AppColors.backgroundLight,
                      ),
                    ),
                    SizedBox(height: 40.h),
                    // Next Step button — TODO: add Bloc dispatch here
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.r),
                        ),
                      ),
                      onPressed: () {
                        // if (_formKey.currentState!.validate()) {
                        // TODO: context.read<ForgotPasswordCubit>().forgotPassword(
                        //   email: _emailController.text.trim(),
                        // );
                        // }
                        context.push(RoutesName.verifyResetCode);
                      },
                      child: Text('Next Step', style: AppStyles.buttonLarge),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
