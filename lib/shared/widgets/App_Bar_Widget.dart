import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:venturo_java_code/shared/styles/color_style.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
    this.label,
    this.iconsData,
    this.isBool = false,
  });

  final String? label;
  final IconData? iconsData;
  final bool isBool;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 68.h,
      backgroundColor: Colors.white,
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      shadowColor: const Color.fromARGB(111, 24, 24, 24),
      flexibleSpace: Container(
          decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30.r),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(111, 24, 24, 24),
            blurRadius: 15,
            spreadRadius: -1,
            offset: Offset(0, 1),
          ),
        ],
      )),
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: const Icon(
          Icons.arrow_back,
          color: ColorStyle.primary,
        ),
      ),
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.menu, size: 24.w, color: Colors.blue),
          SizedBox(width: 8.w),
          Text(
            label ?? 'Available promo',
            style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black),
          ),
        ],
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(68.h);
}
