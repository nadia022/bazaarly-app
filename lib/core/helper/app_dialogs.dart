import 'package:bazarly_app/core/widgets/app_failute_dialog.dart';
import 'package:bazarly_app/core/widgets/app_success_dialog.dart';
import 'package:flutter/material.dart';

class AppDialog {
  AppDialog._();

  //* Show Success Dialog
  static Future<void> showSuccess(
    BuildContext context, {
    required String title,
    required String message,
    required VoidCallback onTap,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) =>
          AppSuccessDialog(title: title, message: message, onTapped: onTap),
    );
  }

  //* Show Failure Dialog
  static Future<void> showFailure(
    BuildContext context, {
    required String title,
    required String message,
    required VoidCallback onTap,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) =>
          AppFailureDialog(title: title, message: message, onTapped: onTap),
    );
  }
}
