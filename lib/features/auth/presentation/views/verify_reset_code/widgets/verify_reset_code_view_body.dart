import 'package:bazarly_app/core/utils/assets/app_lottie.dart';
import 'package:bazarly_app/core/utils/colors/app_colors.dart';
import 'package:bazarly_app/core/utils/router/routes_name.dart';
import 'package:bazarly_app/core/utils/styles/app_styles.dart';
import 'package:bazarly_app/features/auth/presentation/views/shared/auth_screen_header.dart';
import 'package:bazarly_app/features/auth/presentation/views/verify_reset_code/widgets/otp_input_row.dart';
import 'package:bazarly_app/features/auth/presentation/views/verify_reset_code/widgets/resend_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class VerifyResetCodeViewBody extends StatefulWidget {
  const VerifyResetCodeViewBody({super.key});

  @override
  State<VerifyResetCodeViewBody> createState() =>
      _VerifyResetCodeViewBodyState();
}

class _VerifyResetCodeViewBodyState extends State<VerifyResetCodeViewBody> {
  // Stores the OTP code as the user fills in each box
  String _otpCode = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Gradient header with Lottie OTP animation
          const AuthScreenHeader(
            title: 'Verify Account',
            lottiePath: AppLottie.forgotPassword,
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
            child: Column(
              children: [
                // Subtitle
                Text(
                  'We sent an OTP to your registered email address',
                  textAlign: TextAlign.center,
                  style: AppStyles.bodyMediumRg.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),

                SizedBox(height: 32.h),

                // 6-digit OTP input boxes
                OtpInputRow(
                  onCompleted: (code) => setState(() => _otpCode = code),
                ),

                SizedBox(height: 16.h),

                // Countdown timer + resend link
                ResendTimer(
                  onResend: () {
                    // TODO: context.read<ForgotPasswordCubit>().forgotPassword(email: email);
                  },
                ),

                SizedBox(height: 40.h),

                // Continue button — disabled until all 6 digits are entered
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    disabledBackgroundColor:
                        AppColors.primary.withOpacity(0.5),
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                  ),
                  onPressed: _otpCode.length == 6
                      ? () {
                          // TODO: context.read<ForgotPasswordCubit>().verifyResetCode(resetCode: _otpCode);
                          context.push(RoutesName.resetPassword);
                        }
                      : null,
                  child: Text(
                    'Continue',
                    style: AppStyles.buttonLarge,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}