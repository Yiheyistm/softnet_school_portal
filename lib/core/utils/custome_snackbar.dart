import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:softnet_school_portal/core/theme/app_colors.dart';

class CustomSnackBar {
  static void showSuccessSnackBar(
      BuildContext context, String title, String message) {
    _showSnackBar(context, title, message, ContentType.success);
  }

  static void showInfoSnackBar(
      BuildContext context, String title, String message) {
    _showSnackBar(context, title, message, ContentType.help);
  }

  static void showErrorSnackBar(
      BuildContext context, String title, String message) {
    _showSnackBar(context, title, message, ContentType.failure);
  }

  static void showWarningSnackBar(
      BuildContext context, String title, String message) {
    _showSnackBar(context, title, message, ContentType.warning);
  }

  static void _showSnackBar(
    BuildContext context,
    String title,
    String message,
    ContentType contentType,
  ) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColors.transparentColor,
        content: AwesomeSnackbarContent(
          title: title,
          message: message,
          contentType: contentType,
        ),
      ));
    });
  }
}
