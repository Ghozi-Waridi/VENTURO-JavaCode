import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/color_style.dart';

class PrimaryButtonWidget extends StatelessWidget {
  const PrimaryButtonWidget({
    super.key,
    required this.label,
    this.onPressed,
  });

  final String label;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: ColorStyle.primary,
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 16.h,
        ),
        minimumSize: const Size(0, 0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            16.r,
          ),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: ColorStyle.white,
          fontSize: 16.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
