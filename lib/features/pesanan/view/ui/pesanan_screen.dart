import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
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
class PesananScreen extends StatelessWidget {
  PesananScreen({Key? key}) : super(key: key);

  final assetsConstant = PesananAssetsConstant();
  //final pesananController = Get.find<PesananController>();

  @override
  Widget build(BuildContext context) {
    //final MenuDetailModel menu = Get.arguments as MenuDetailModel;
    //final box = GetStorage();
   final PesananController pesananController = PesananController.to; 

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
                      13.horizontalSpace,
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
                Obx(
                  () {
                    print("PesananScreen - Obx ListView.builder rebuild, jumlah makanan: ${pesananController.makanan.length}"); // TAMBAHKAN PRINT INI
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: pesananController.makanan.length,
                      itemBuilder: (context, index) {
                        final pesananMakanan = pesananController.makanan[index];
                        return CardItemComponent(
                          menu: pesananMakanan.menuModel,
                        );
                      },
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    children: [
                      Image.asset(IconConstants.minuman),
                      13.horizontalSpace,
                      Text(
                        "Minuman",
                        style: GoogleTextStyle.fw800.copyWith(
                          fontSize: 20.sp,
                          color: ColorStyle.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                Obx(
                  () {
                    print("PesananScreen - Obx ListView.builder rebuild, jumlah minuman: ${pesananController.minuman.length}"); // TAMBAHKAN PRINT INI
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: pesananController.minuman.length,
                      itemBuilder: (context, index) {
                        final pesananMinuman = pesananController.minuman[index];
                        return CardItemComponent(
                          menu: pesananMinuman.menuModel,
                        );
                      },
                    );
                  },
                ),
                // ... (Tambahkan Obx ListView.builder untuk kategori snack jika ada)
              ],
            ),
          ),
        ));
  }
}

