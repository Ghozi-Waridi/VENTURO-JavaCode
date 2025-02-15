import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/color_style.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
    this.color,
    this.rounded,
    this.textColor,
  });

  final String label;
  final Function()? onPressed;
  final IconData? icon;
  final Color?  color;
  final double? rounded;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      
      style: ElevatedButton.styleFrom(
        
        elevation: 0,
        backgroundColor: color ??ColorStyle.primary,
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 16.h,
        ),
        minimumSize: const Size(0, 0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            rounded ?? 16.r,
          ),
        ),
      ),
      child: Row(
        children: [
          if (icon != null) Icon(icon),
          Text(
            label,
            style: TextStyle(
              color: textColor ?? ColorStyle.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
