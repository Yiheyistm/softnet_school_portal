// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:softnet_school_portal/core/theme/app_colors.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.controller,
    required this.validator,
    required this.keyboardType,
    required this.obscureText,
    required this.suffix,
  });
  TextEditingController controller;
  String? Function(String?)? validator;
  TextInputType keyboardType;
  bool obscureText;
  Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      scrollPhysics: const BouncingScrollPhysics(),
      onTapOutside: (value) => FocusScope.of(context).unfocus(),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: obscureText,
      controller: controller,
      style: Theme.of(context).textTheme.bodyMedium,
      cursorColor: AppColors.primaryColor,
      cursorErrorColor: AppColors.errorColor,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        suffixIcon: suffix,
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.errorColor, width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
        errorStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: AppColors.requiredColor,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            fontSize: 12),
      ),
      validator: validator,
    );
  }
}
