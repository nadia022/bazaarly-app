import 'dart:async';
import 'package:bazarly_app/core/utils/colors/app_colors.dart';
import 'package:bazarly_app/core/utils/styles/app_styles.dart';
import 'package:flutter/material.dart';

/// A countdown timer with a "Resend" link.
///
/// The resend link is disabled while the timer is running.
/// Once the timer reaches zero [onResend] becomes tappable.
class ResendTimer extends StatefulWidget {
  const ResendTimer({
    super.key,
    required this.onResend,
    this.seconds = 50,
  });

  /// Called when the user taps "Resend" after the timer expires
  final VoidCallback onResend;

  /// Initial countdown duration in seconds
  final int seconds;

  @override
  State<ResendTimer> createState() => _ResendTimerState();
}

class _ResendTimerState extends State<ResendTimer> {
  late int _remaining;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _remaining = widget.seconds;
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (_remaining == 0) {
        t.cancel();
      } else {
        setState(() => _remaining--);
      }
    });
  }

  void _handleResend() {
    setState(() => _remaining = widget.seconds);
    _startTimer();
    widget.onResend();
  }

  // Formats remaining seconds as MM:SS
  String get _formatted {
    final m = (_remaining ~/ 60).toString().padLeft(2, '0');
    final s = (_remaining % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  @override
  Widget build(BuildContext context) {
    final expired = _remaining == 0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Show countdown while timer is running
        if (!expired)
          Text(
            '$_formatted  ',
            style: AppStyles.bodyMediumRg.copyWith(color: AppColors.textPrimary),
          ),

        Text(
          "Didn't get a code? ",
          style: AppStyles.bodyMediumRg.copyWith(color: AppColors.textPrimary),
        ),

        // Resend link — active only after the timer expires
        GestureDetector(
          onTap: expired ? _handleResend : null,
          child: Text(
            'Resend',
            style: AppStyles.bodyMediumRg.copyWith(
              color: expired ? AppColors.primary : AppColors.textPrimary,
              fontWeight: expired ? FontWeight.w700 : FontWeight.w400,
              decoration:
                  expired ? TextDecoration.underline : TextDecoration.none,
            ),
          ),
        ),
      ],
    );
  }
}