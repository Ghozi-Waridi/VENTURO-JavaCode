import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/color_style.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({
    super.key,
    required this.controller,
    this.errorMessage,
    this.label,
    this.hint,
    this.inputType = TextInputType.name,
    this.inputFormatters,
    this.obscureText = false,
    this.suffixIcon,
  });

  final TextEditingController controller;
  final String? errorMessage;
  final String? label;
  final String? hint;
  final TextInputType inputType;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      inputFormatters: inputFormatters,
      obscureText: obscureText,
      decoration: InputDecoration(
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorStyle.primary,
            width: 1,
          ),
        ),
        //errorText: errorMessage,
        labelText: label,
        labelStyle: const TextStyle(
          color: ColorStyle.primary,
        ),
        hintText: hint,
        border: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorStyle.success,
            width: 1,
          ),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        floatingLabelStyle: TextStyle(
          fontSize: 18.sp,
          color: errorMessage == null ? ColorStyle.danger : ColorStyle.primary,
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorStyle.primary,
            width: 2,
          ),
        ),
        suffixIcon: suffixIcon,
      ),
      validator: (value) {
        if ((value == null || value.isEmpty)) {
          return errorMessage;
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
