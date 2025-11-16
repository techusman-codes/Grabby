import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grabby_app/core/constant/app_colors.dart';

/// OTP (One-Time Password) input widget
///
/// Creates multiple boxes for entering verification codes
///
/// Usage:
/// ```dart
/// OtpInput(
///   length: 6,
///   onCompleted: (code) => print('Code: $code'),
/// )
/// ```
class OtpInput extends StatefulWidget {
  /// Number of OTP boxes
  final int length;

  /// Called when all boxes are filled
  final Function(String) onCompleted;

  /// Called when OTP changes
  final Function(String)? onChanged;

  /// Box size (width and height)
  final double boxSize;

  /// Spacing between boxes
  final double spacing;

  /// Border radius
  final double borderRadius;

  const OtpInput({
    super.key,
    this.length = 6,
    required this.onCompleted,
    this.onChanged,
    this.boxSize = 50,
    this.spacing = 8,
    this.borderRadius = 12,
  });

  @override
  State<OtpInput> createState() => _OtpInputState();
}

class _OtpInputState extends State<OtpInput> {
  /// Controllers for each box
  late List<TextEditingController> _controllers;

  /// Focus nodes for each box
  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();

    // Initialize controllers and focus nodes
    _controllers = List.generate(
      widget.length,
      (index) => TextEditingController(),
    );

    _focusNodes = List.generate(widget.length, (index) => FocusNode());
  }

  @override
  void dispose() {
    // Clean up controllers and focus nodes
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  /// Get current OTP value
  String _getOtp() {
    return _controllers.map((controller) => controller.text).join();
  }

  /// Handle text change
  void _onChanged(String value, int index) {
    // Notify parent of change
    widget.onChanged?.call(_getOtp());

    if (value.isNotEmpty) {
      // Move to next box if current box is filled
      if (index < widget.length - 1) {
        _focusNodes[index + 1].requestFocus();
      } else {
        // Last box filled, unfocus and call onCompleted
        _focusNodes[index].unfocus();

        // Check if all boxes are filled
        if (_getOtp().length == widget.length) {
          widget.onCompleted(_getOtp());
        }
      }
    }
  }

  /// Handle backspace/delete
  // ignore: deprecated_member_use
  void _onKeyEvent(RawKeyEvent event, int index) {
    // ignore: deprecated_member_use
    if (event is RawKeyDownEvent) {
      if (event.logicalKey == LogicalKeyboardKey.backspace) {
        if (_controllers[index].text.isEmpty && index > 0) {
          // Move to previous box if current is empty
          _focusNodes[index - 1].requestFocus();
        }
      }
    }
  }

  /// Clear all boxes
  void clear() {
    for (var controller in _controllers) {
      controller.clear();
    }
    _focusNodes[0].requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.length, (index) {
        return Container(
          margin: EdgeInsets.only(
            right: index < widget.length - 1 ? widget.spacing : 0,
          ),
          child: _buildOtpBox(index),
        );
      }),
    );
  }

  /// Build single OTP box
  Widget _buildOtpBox(int index) {
    return RawKeyboardListener(
      focusNode: FocusNode(),
      onKey: (event) => _onKeyEvent(event, index),
      child: Container(
        width: widget.boxSize,
        height: widget.boxSize,
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(widget.borderRadius),
          border: Border.all(
            color: _focusNodes[index].hasFocus
                ? AppColors.primary
                : Colors.transparent,
            width: 2,
          ),
        ),
        child: TextFormField(
          cursorHeight: 10,
          controller: _controllers[index],
          focusNode: _focusNodes[index],
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          maxLength: 1,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
          decoration: InputDecoration(
            counterText: '', // Hide character counter
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly, // Only numbers
          ],
          onChanged: (value) => _onChanged(value, index),
        ),
      ),
    );
  }
}
