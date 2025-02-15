import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:venturo_java_code/features/beranda/view/components/card_item_component.dart';

import '../../../../shared/styles/color_style.dart';
import '../../../../shared/styles/google_text_style.dart';


class DrinkSectionComponent extends StatelessWidget {
  const DrinkSectionComponent({super.key, required this.filteredMenu});

  final filteredMenu;
 
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Makanan",
            style: GoogleTextStyle.fw600.copyWith(
              fontSize: 24.sp,
              color: ColorStyle.dark,
            ),
          ),
          16.verticalSpace,
          SizedBox(
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              itemCount: filteredMenu.length,
              itemBuilder: (context, index) {
                final menu = filteredMenu[index];

                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.5.h),
                  child: CardItemComponent(
                    onTap: () {
                      Get.toNamed("/beranda_detail_katalog", arguments: menu);
                    },
                    menu: menu,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

}