import 'package:flutter/material.dart';
import 'package:venturo_java_code/features/beranda/sub_features/detail_katalog/controllers/beranda_detail_katalog_controller.dart';
import 'package:venturo_java_code/shared/widgets/App_Bar_Widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:venturo_java_code/shared/widgets/custom_Button_widget.dart';
import '../../../../../../configs/routes/route.dart';

import '../../../../../../constants/Icons/Icon_constants.dart';
import '../../../../../../shared/styles/color_style.dart';
import '../../../../constants/beranda_assets_constant.dart';
import '../../../../models/menu_model.dart';
import '../components/list_component.dart';

class DetailKatalogScreen extends StatelessWidget {
  DetailKatalogScreen({Key? key}) : super(key: key);

  final assetsConstant = BerandaAssetsConstant();

  @override
  Widget build(BuildContext context) {
    final MenuModel dataModel = Get.arguments as MenuModel;
    BerandaDetailKatalogController.to.fetchMenuByID(dataModel.idMenu);

    return Scaffold(
      appBar: AppBarWidget(
        label: "Detail Katalog",
        isBool: true,
        iconsData: Icons.book_online,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: dataModel.foto ??
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/240px-No_image_available.svg.png',
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) =>
                  Icon(Icons.error, size: 40.r),
              fit: BoxFit.contain,
            ),
            SizedBox(
              width: double.infinity,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
                decoration: BoxDecoration(
                  color: ColorStyle.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40.r),
                    topLeft: Radius.circular(40.r),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(111, 24, 24, 24),
                      offset: Offset(0, 1),
                      blurRadius: 15,
                      spreadRadius: -1,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    26.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          dataModel.nama ?? '',
                          style: Get.textTheme.titleLarge?.copyWith(
                            fontSize: 20.sp,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                            color: ColorStyle.primary,
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.remove_outlined)),
                            Text("1"),
                            IconButton(
                                onPressed: () {}, icon: Icon(Icons.add_box)),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      dataModel.deskripsi ?? '',
                      textAlign: TextAlign.start,
                      style: Get.textTheme.bodyLarge?.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Montserrat',
                        letterSpacing: 2.0,
                      ),
                    ),
                    26.verticalSpace,
                    const Divider(height: 2, color: ColorStyle.grey),
                    ListComponent(
                      iconData: IconConstants.hargaKatalog,
                      title: "Harga",
                      value: dataModel.harga.toString(),
                      color: ColorStyle.primary,
                      isTrue: false,
                    ),
                    const Divider(height: 2, color: ColorStyle.grey),
                    if (BerandaDetailKatalogController.to.detailMenu?.level !=
                            null &&
                        (BerandaDetailKatalogController
                            .to.detailMenu?.level.isNotEmpty ?? false)) ...[
                      Obx(() {
                        return ListComponent(
                          iconData: IconConstants.level,
                          title: "Level",
                          value: BerandaDetailKatalogController.to.level
                              .toString(),
                        );
                      }),
                      const Divider(height: 2, color: ColorStyle.grey),
                    ],
                    if (BerandaDetailKatalogController.to.detailMenu?.topping !=
                            null &&
                       !(BerandaDetailKatalogController
                            .to.detailMenu?.topping.isNotEmpty ?? false)) ...[
                      Obx(() {
                        return ListComponent(
                          iconData: IconConstants.topingKatalog,
                          title: "Topping",
                          value: BerandaDetailKatalogController.to.topping
                              .toString(),
                        );
                      }),
                      const Divider(height: 2, color: ColorStyle.grey),
                    ],
                    Obx(
                      () => ListComponent(
                        iconData: IconConstants.keterangan,
                        title: "Catatan",
                        value: BerandaDetailKatalogController.to.catatan
                            .toString(),
                      ),
                    ),
                    36.verticalSpace,
                    Center(
                      child: CustomButtonWidget(
                        label: "Tambahkan Ke Pesanan",
                        color: ColorStyle.primary,
                        rounded: 20,
                        textColor: Colors.white,
                        onPressed: () {
                          Get.offNamed(
                            Routes.pesananRoute,
                            arguments: BerandaDetailKatalogController.to.detailMenu
                          );
                        },
                      ),
                    ),
                    36.verticalSpace,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
