import 'package:bazarly_app/features/auth/presentation/views/verify_reset_code/widgets/otp_single_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A row of 6 OTP digit boxes.
///
/// Automatically moves focus forward on entry and backward on delete.
/// Calls [onCompleted] with the full 6-digit string when all boxes are filled.
class OtpInputRow extends StatefulWidget {
  const OtpInputRow({super.key, required this.onCompleted});

  /// Called with the complete OTP string when all 6 digits are entered
  final ValueChanged<String> onCompleted;

  @override
  State<OtpInputRow> createState() => _OtpInputRowState();
}

class _OtpInputRowState extends State<OtpInputRow> {
  static const int _length = 6;

  // One controller per digit box
  final List<TextEditingController> _controllers = List.generate(
    _length,
    (_) => TextEditingController(),
  );

  // One focus node per digit box
  final List<FocusNode> _focusNodes = List.generate(
    _length,
    (_) => FocusNode(),
  );

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  // Moves focus forward or fires onCompleted when the last digit is entered
  void _onChanged(String value, int index) {
    if (value.isNotEmpty) {
      if (index < _length - 1) {
        _focusNodes[index + 1].requestFocus();
      } else {
        // All 6 digits filled — assemble and return the code
        final code = _controllers.map((c) => c.text).join();
        widget.onCompleted(code);
        FocusScope.of(context).unfocus();
      }
    }
  }

  // Moves focus backward when backspace is pressed on an empty box
  void _onKeyEvent(KeyEvent event, int index) {
    if (event is KeyDownEvent &&
        event.logicalKey == LogicalKeyboardKey.backspace &&
        _controllers[index].text.isEmpty &&
        index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(_length, (index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: OtpSingleBox(
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            onChanged: (value) => _onChanged(value, index),
            onKeyEvent: (event) => _onKeyEvent(event, index),
          ),
        );
      }),
    );
  }
}
