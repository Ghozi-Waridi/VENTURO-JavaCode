import 'package:flutter/material.dart';
import 'package:venturo_java_code/constants/Icons/Icon_constants.dart';
import 'package:venturo_java_code/features/beranda/models/menu_model.dart';
import 'package:venturo_java_code/features/beranda/sub_features/detail_katalog/models/menu_detial_model.dart';
import 'package:venturo_java_code/features/beranda/view/components/card_item_component.dart';

import 'package:venturo_java_code/features/pesanan/constants/pesanan_assets_constant.dart';
import 'package:venturo_java_code/features/pesanan/controllers/pesanan_controller.dart';

import 'package:venturo_java_code/shared/styles/color_style.dart';
import 'package:venturo_java_code/shared/styles/google_text_style.dart';
import 'package:venturo_java_code/shared/widgets/App_Bar_Widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../models/Pesanan.dart';


class PesananScreen extends StatelessWidget {
  PesananScreen({Key? key}) : super(key: key);

  final controller = Get.find<PesananController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        label: "Pesanan",
        iconsData: Icons.restaurant_menu,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: [
                    Image.asset(IconConstants.makanan),
                    const SizedBox(width: 13),
                    Text(
                      "Makanan",
                      style: GoogleTextStyle.fw800.copyWith(
                        fontSize: 20.sp,
                        color: ColorStyle.primary,
                      ),
                    ),
                  ],
                ),
              ),
              Obx(() {
                final pesananList = controller.pesanan;
                print("Data Pesanan : $pesananList");
                return pesananList.isNotEmpty
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: pesananList.length,
                        itemBuilder: (context, index) {
                          final menu = pesananList[index];
                          return CardItemComponent(menu: menu.menu);
                        },
                      )
                    : Center(
                        child: Text("Tidak Ada Pesanan"),
                      );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

