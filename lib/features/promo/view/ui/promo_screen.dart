import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:venturo_java_code/features/promo/constants/promo_assets_constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_java_code/shared/models/promo_model.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:venturo_java_code/shared/styles/color_style.dart';
import 'package:flutter_html/flutter_html.dart';
 import '../../../../shared/widgets/App_Bar_Widget.dart';

class PromoScreen extends StatelessWidget {
  PromoScreen({Key? key}) : super(key: key);

  final assetsConstant = PromoAssetsConstant();
  @override
  Widget build(BuildContext context) {
    final PromoModel promoModel = Get.arguments as PromoModel;

    return SafeArea(
      child: Scaffold(
       appBar: const AppBarWidget(
          label: 'Promo',
          isBool: true,
          iconsData: Icons.topic,

        ),
      body: Column(
          children: [
            Card(
              margin: EdgeInsets.all(25.w),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              child: Container(
                width: double.infinity,
                height: 200.h,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(15.r),
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      promoModel.foto ??
                          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/240px-No_image_available.svg.png',
                    ),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).primaryColor.withAlpha(150),
                      BlendMode.srcATop,
                    ),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(115, 71, 70, 70),
                      offset: Offset(0, 2),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        promoModel.type == 'voucher'
                            ? 'Voucher\nRp. ${promoModel.nominal?.toStringAsFixed(0) ?? ''}'
                            : 'Diskon ${promoModel.diskon ?? ''}%',
                        textAlign: TextAlign.center,
                        style: Get.textTheme.displaySmall?.copyWith(
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              color: Colors.black.withOpacity(0.3),
                              offset: Offset(2, 2),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        promoModel.nama ?? '',
                        textAlign: TextAlign.center,
                        style: Get.textTheme.labelMedium?.copyWith(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.w),
            Expanded(
              child: Container(
                width: double.infinity,
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
                      //blurRadius: 8,
                       blurRadius: 15,
                      spreadRadius: -1

                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nama Promo',
                        style: Get.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        promoModel.nama ?? '',
                        style: Get.textTheme.bodyLarge?.copyWith(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        children: [
                          Icon(Icons.check_circle,
                              color: Colors.green, size: 24.w),
                          SizedBox(width: 8.w),
                          Text(
                            'Syarat dan Ketentuan',
                            style: Get.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Divider(height: 2, thickness: 1),
                      SizedBox(height: 10.h),
                      Html(data: promoModel.syaratKetentuan ?? ''),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
