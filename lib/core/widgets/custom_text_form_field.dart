import 'package:e_market/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.keyboardType,
    required this.hintText,
    this.suffixIcon,
    this.controller,
    this.obscureText = false,
    this.onSaved, this.prefixIcon,
  });

  final TextInputType keyboardType;
  final String hintText;
  final Widget? suffixIcon;
  final IconData? prefixIcon;
  final TextEditingController? controller;
  final bool obscureText;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.primaryColor,
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'the field is required';
        }
        return null;
      },
      keyboardType: keyboardType,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: Colors.white70) : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: Color(0xFFE6E9E9), width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: Color(0xFFE6E9E9), width: 1),
        ),
        fillColor: const Color(0XFFF9FAFA),
        filled: true,
      ),
    );
  }
}
