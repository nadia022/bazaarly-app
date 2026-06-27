import 'package:bazarly_app/core/functions/hide_keyboard.dart';
import 'package:bazarly_app/core/utils/colors/app_colors.dart';
import 'package:bazarly_app/core/utils/styles/app_styles.dart';
import 'package:bazarly_app/core/validators/app_validators.dart';
import 'package:bazarly_app/features/auth/presentation/views/shared/auth_screen_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordViewBody extends StatefulWidget {
  const ResetPasswordViewBody({super.key});

  @override
  State<ResetPasswordViewBody> createState() => _ResetPasswordViewBodyState();
}

class _ResetPasswordViewBodyState extends State<ResetPasswordViewBody> {
  // Form key used to validate both password fields before submitting
  final _formKey = GlobalKey<FormState>();

  // Controller for the new password field
  final TextEditingController _emailController = TextEditingController();

  // Controller for the confirm password field
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  // Controls visibility of the new password field
  bool _isPasswordObscure = true;

  // Controls visibility of the confirm password field

  @override
  void dispose() {
    _emailController.dispose();
    _confirmPasswordController.dispose();
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
            // Gradient header with Lottie animation and screen title
            const AuthScreenHeader(
              title: 'Reset Password',
              lottiePath: 'assets/lottie/reset_password.json',
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // ── New Password ─────────────────────────────────
                    Text(
                      'E-mail address',
                      style: AppStyles.labelMedium.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    SizedBox(height: 8.h),

                    TextFormField(
                      controller: _emailController,
                      obscureText: _isPasswordObscure,
                      decoration: InputDecoration(
                        hintText: 'enter your email address',
                        prefixIcon: const Icon(
                          Icons.email_outlined,
                          color: AppColors.primary,
                        ),
                      ),
                      validator: (value) => AppValidators.validateEmail(value),
                    ),

                    SizedBox(height: 20.h),

                    // ── Confirm New Password ──────────────────────────
                    Text(
                      'New Password',
                      style: AppStyles.labelMedium.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    SizedBox(height: 8.h),

                    TextFormField(
                      controller: _confirmPasswordController,
                      obscureText: _isPasswordObscure,
                      // Validates that this field matches the password field
                      validator: (value) =>
                          AppValidators.validateConfirmPassword(
                            value,
                            _emailController.text,
                          ),
                      decoration: _buildPasswordDecoration(
                        isObscure: _isPasswordObscure,
                        onToggle: () => setState(
                          () => _isPasswordObscure = !_isPasswordObscure,
                        ),
                      ),
                    ),

                    SizedBox(height: 40.h),

                    // Change Password button — TODO: add Bloc dispatch here
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
                        if (_formKey.currentState!.validate()) {
                          // TODO: context.read<ForgotPasswordCubit>().resetPassword(
                          //   email: email,
                          //   newPassword: _passwordController.text,
                          // );
                        }
                      },
                      child: Text(
                        'Change Password',
                        style: AppStyles.buttonLarge,
                      ),
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

  /// Builds a consistent password [InputDecoration] with a lock icon
  /// and a visibility toggle button.
  InputDecoration _buildPasswordDecoration({
    required bool isObscure,
    required VoidCallback onToggle,
  }) {
    return InputDecoration(
      hintText: 'enter new password',
      prefixIcon: const Icon(Icons.lock_outlined, color: AppColors.primary),
      suffixIcon: IconButton(
        icon: Icon(
          isObscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
          color: AppColors.textPrimary,
        ),
        onPressed: onToggle,
      ),
      filled: true,
      fillColor: AppColors.backgroundLight,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: const BorderSide(color: AppColors.primary),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: const BorderSide(color: AppColors.primary),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
      ),
    );
  }
}
