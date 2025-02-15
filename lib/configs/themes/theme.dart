import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared/styles/color_style.dart';

final ThemeData mainTheme = ThemeData(
  primaryColor: ColorStyle.primary,
  primaryColorLight: ColorStyle.primary,
  primaryColorDark: ColorStyle.primary,
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSwatch(
    accentColor: ColorStyle.secondary,
    cardColor: ColorStyle.white,
    errorColor: ColorStyle.danger,
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: ColorStyle.primary,
    selectionHandleColor: ColorStyle.primary,
  ),
  iconTheme: IconThemeData(
    color: ColorStyle.primary,
    size: 24.sp,
  ),
);
