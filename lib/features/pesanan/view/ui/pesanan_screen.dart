import 'package:flutter/material.dart';
import 'package:venturo_java_code/constants/Icons/Icon_constants.dart';
import 'package:venturo_java_code/features/beranda/view/components/card_item_component.dart';
import 'package:venturo_java_code/features/pesanan/constants/pesanan_assets_constant.dart';
import 'package:venturo_java_code/features/pesanan/controllers/pesanan_controller.dart';
import 'package:venturo_java_code/shared/styles/color_style.dart';
import 'package:venturo_java_code/shared/styles/google_text_style.dart';
import 'package:venturo_java_code/shared/widgets/App_Bar_Widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../components/detail_pesanan_component.dart';
import 'package:get/get.dart';

class PesananScreen extends StatelessWidget {
  PesananScreen({Key? key}) : super(key: key);

  final assetsConstant = PesananAssetsConstant();

  @override
  Widget build(BuildContext context) {
    final PesananController pesananController = PesananController.to;

    return Scaffold(
      appBar: AppBarWidget(
        label: "Pesanan",
        iconsData: Icons.restaurant_menu,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: pesananController.makanan.isEmpty &&
                  pesananController.minuman.isEmpty &&
                  pesananController.snack.isEmpty
              ?Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.shopping_cart_outlined,
                        size: 80,
                        color: ColorStyle.primary, // Your primary color
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Silahkan Memesan terlebih dahulu",
                        style: GoogleTextStyle.fw800.copyWith(
                          fontSize: 22.sp,
                          color: ColorStyle.primary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Nikmati pilihan menu kami dengan berbagai kategori",
                        style: GoogleTextStyle.fw400.copyWith(
                          fontSize: 16.sp,
                          color: Colors.grey[600], // Subtle text color
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ) 
              : Column(
                  children: [
                    // Menampilkan kategori makanan jika ada pesanan
                    if (pesananController.makanan.isNotEmpty)
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
                    if (pesananController.makanan.isNotEmpty)
                      Obx(
                        () {
                          print(
                              "PesananScreen - Obx ListView.builder rebuild, jumlah makanan: ${pesananController.makanan.length}");
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: pesananController.makanan.length,
                            itemBuilder: (context, index) {
                              final pesananMakanan =
                                  pesananController.makanan[index];
                              return CardItemComponent(
                                menu: pesananMakanan.menuModel,
                              );
                            },
                          );
                        },
                      ),
                    // Menampilkan kategori minuman jika ada pesanan
                    if (pesananController.minuman.isNotEmpty)
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
                    if (pesananController.minuman.isNotEmpty)
                      Obx(
                        () {
                          print(
                              "PesananScreen - Obx ListView.builder rebuild, jumlah minuman: ${pesananController.minuman.length}");
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: pesananController.minuman.length,
                            itemBuilder: (context, index) {
                              final pesananMinuman =
                                  pesananController.minuman[index];
                              return CardItemComponent(
                                menu: pesananMinuman.menuModel,
                              );
                            },
                          );
                        },
                      ),
                    // Menampilkan kategori snack jika ada pesanan
                    if (pesananController.snack.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          children: [
                            Image.asset(IconConstants.pesanan), 
                            13.horizontalSpace,
                            Text(
                              "Snack",
                              style: GoogleTextStyle.fw800.copyWith(
                                fontSize: 20.sp,
                                color: ColorStyle.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    if (pesananController.snack.isNotEmpty)
                      Obx(
                        () {
                          print(
                              "PesananScreen - Obx ListView.builder rebuild, jumlah snack: ${pesananController.snack.length}");
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: pesananController.snack.length,
                            itemBuilder: (context, index) {
                              final pesananSnack =
                                  pesananController.snack[index];
                              return CardItemComponent(
                                menu: pesananSnack.menuModel,
                              );
                            },
                          );
                        },
                      ),
                  ],
                ),
        ),
      ),
          ),
          DetailPesananComponent(),
        ],
      ) 
    );
  }
}
