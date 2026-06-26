import 'package:bazarly_app/core/helper/app_snack_bar.dart';
import 'package:bazarly_app/core/utils/colors/app_colors.dart';
import 'package:bazarly_app/core/utils/router/routes_name.dart';
import 'package:bazarly_app/core/utils/styles/app_styles.dart';
import 'package:bazarly_app/features/auth/data/models/sign_up_request_model.dart';
import 'package:bazarly_app/features/auth/presentation/view_model/sign_up_cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

/// A widget that wraps the sign-up submit button with a [BlocConsumer].
///
/// Listens to [SignUpCubit] state changes to show success/error feedback,
/// and displays a loading indicator while the request is in progress.
class SignUpButton extends StatelessWidget {
  const SignUpButton({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.mobileController,
    required this.emailController,
    required this.passwordController,
    required this.rePasswordController,
  });

  /// Global key used to trigger form validation before submitting
  final GlobalKey<FormState> formKey;

  /// Controller holding the full name value
  final TextEditingController nameController;

  /// Controller holding the mobile number value
  final TextEditingController mobileController;

  /// Controller holding the email value
  final TextEditingController emailController;

  /// Controller holding the password value
  final TextEditingController passwordController;

  /// Controller holding the confirm password value
  final TextEditingController rePasswordController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        // Show success snack bar and navigate home on successful sign-up
        if (state is SignUpSuccess) {
          AppSnackBar.success(context, 'Account created successfully');
          context.go(RoutesName.home);
        }
        // Show error snack bar on sign-up failure
        else if (state is SignUpFailure) {
          AppSnackBar.error(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Theme.of(context).colorScheme.primary,
          ),
          onPressed: () {
            if (formKey.currentState!.validate()) {
              // Dispatch sign-up event with all collected field values
              context.read<SignUpCubit>().signup(
                signupRequestModel: SignUpRequestModel(
                  name: nameController.text,
                  email: emailController.text,
                  password: passwordController.text,
                  rePassword: rePasswordController.text,
                  phone: mobileController.text,
                ),
              );
            }
          },
          // Show loading indicator while the sign-up request is in progress
          child: state is SignUpLoading
              ? const CircularProgressIndicator(color: AppColors.primary)
              : Text(
                  'Sign up',
                  style: AppStyles.buttonLarge.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
        );
      },
    );
  }
}