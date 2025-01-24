import 'package:cal_ai/configs/app_colors.dart';
import 'package:flutter/material.dart';

class AppSnackbar extends StatelessWidget {
  final String? text;
  final BuildContext context;
  final bool isError;
  final int? duration;
  const AppSnackbar(
    this.context, {
    super.key,
    this.text,
    this.isError = false,
    this.duration,
  });

  void show() {
    final snackbar = SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: isError ? AppColors.snackbarErrorColor : AppColors.snackbarSuccessColor,
      content: Text(
        text ?? '',
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      duration: Duration(seconds: duration ?? 2),
    );
    // ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
