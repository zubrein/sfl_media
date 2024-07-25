import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

void showError({
  required BuildContext context,
  required String message,
  required VoidCallback onTapRetryButton,
}) {
  showDialog(
      context: context,
      builder: (context) {
        return _errorDialog(
          context: context,
          message: message,
          onTapRetryButton: onTapRetryButton,
        );
      });
}

Widget _errorDialog({
  required BuildContext context,
  required String message,
  required VoidCallback onTapRetryButton,
}) {
  return CupertinoAlertDialog(
    content: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Gap(16),
        Text(message),
        const Gap(8),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
                onPressed: onTapRetryButton,
                child: const Text(
                  'Retry',
                  style: TextStyle(fontWeight: FontWeight.w700),
                )),
          ],
        )
      ],
    ),
  );
}
