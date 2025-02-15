import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:venturo_java_code/features/beranda/sub_features/detail_katalog/view/components/catatan_component.dart';
import 'package:venturo_java_code/features/beranda/sub_features/detail_katalog/view/components/level_component.dart';
import 'package:venturo_java_code/features/beranda/sub_features/detail_katalog/view/components/toping_component.dart';


import '../../../../../../shared/styles/google_text_style.dart';


class ListComponent extends StatelessWidget {
  const ListComponent({
    super.key,
    //this.menuModel,
    this.iconData,
    this.title,
    this.value,
    this.color,
    this.isTrue = true,
    this.bold,
  });

  //final MenuDetailModel? menuModel;
  final String? iconData;
  final String? title;
  final String? value;
  final Color? color;
  final bool? isTrue;
  final double? bold;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: 16.w, vertical: 12.h),
      child: InkWell(
        onTap: () {
          Get.bottomSheet(
            title!.toLowerCase() == "level" ?
            LevelComponent(
                     ) : title!.toLowerCase() == "topping" ?
            TopingComponent(
                          ) : CatatanComponent()
          );
        },
        child: Row(
          children: [
            Image.asset(
              iconData!,
              width: 16.w,
              height: 16.h,
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Text(
                title!,
                style: GoogleTextStyle.fw600.copyWith(
                  fontSize: 16.sp,
                  letterSpacing: 2.0,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
            Text(
              value!,
              style: GoogleTextStyle.fw400.copyWith(
                fontSize: 18.sp,
                letterSpacing: 2.0,
                fontFamily: 'Montserrat',
                color: color,
              ),
            ),
            isTrue!
                ? Icon(
                    Icons.arrow_forward_ios,
                    size: 16.w,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
