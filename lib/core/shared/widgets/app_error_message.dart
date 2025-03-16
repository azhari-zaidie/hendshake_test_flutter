import 'package:flutter/material.dart';
import 'package:hendshake_test_flutter/core/shared/theme/app_theme.dart';

class AppErrorMessage extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;

  const AppErrorMessage({
    super.key,
    required this.message,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              color: AppTheme.errorColor,
              size: 48,
            ),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: AppTheme.bodyStyle.copyWith(
                color: AppTheme.textPrimaryColor,
              ),
            ),
            if (onRetry != null) ...[
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
                label: const Text('Retry'),
                style: AppTheme.primaryButtonStyle,
              ),
            ],
          ],
        ),
      ),
    );
  }
} 