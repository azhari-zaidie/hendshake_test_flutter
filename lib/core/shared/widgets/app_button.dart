import 'package:flutter/material.dart';
import 'package:hendshake_test_flutter/core/shared/theme/app_theme.dart';

enum ButtonType { primary, secondary }

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonType type;
  final IconData? icon;
  final bool isLoading;
  final double width;
  final double height;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.type = ButtonType.primary,
    this.icon,
    this.isLoading = false,
    this.width = double.infinity,
    this.height = 48,
  });

  @override
  Widget build(BuildContext context) {
    final buttonStyle = type == ButtonType.primary
        ? AppTheme.primaryButtonStyle
        : AppTheme.secondaryButtonStyle;

    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: buttonStyle,
        child: isLoading
            ? SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    type == ButtonType.primary
                        ? Colors.white
                        : AppTheme.primaryColor,
                  ),
                ),
              )
            : _buildButtonContent(),
      ),
    );
  }

  Widget _buildButtonContent() {
    if (icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Icon(icon, size: 10, color: Colors.white,),
          // const SizedBox(width: 8),s
          Text(text),
        ],
      );
    }
    return Text(text);
  }
} 