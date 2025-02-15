import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:venturo_java_code/shared/models/promo_model.dart';

class CardPromoComponent extends StatelessWidget {
  const CardPromoComponent({
    super.key,
    this.enableShadow,
    required this.promoModel,
    //required this.promoName,
    //required this.discountNominal,
    //required this.thumbnailUrl,
    this.width,
    //required this.promoType,
    this.isVoucher = false,
  });

  final bool? enableShadow;
  final PromoModel promoModel;
  //final String promoName;
  //final String discountNominal;
  //final String thumbnailUrl;
  final double? width;
  //final String? promoType;
  final bool? isVoucher;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('/promo', arguments: promoModel);
      },
      borderRadius: BorderRadius.circular(15.r),
      child: Container(
        width: width ?? 282.w,
        height: 188.h,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(15.r),
          image: DecorationImage(
              image: CachedNetworkImageProvider(
                promoModel.foto ?? 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/240px-No_image_available.svg.png',
              ),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Theme.of(context).primaryColor.withAlpha(150),
                BlendMode.srcATop,
              ),
            ),
          boxShadow: [
            if (enableShadow == true)
              const BoxShadow(
                color: Color.fromARGB(115, 71, 70, 70),
                offset: Offset(0, 2),
                blurRadius: 8,
              ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text.rich(
                softWrap: true,
                textAlign: TextAlign.center,
                TextSpan(
                  text: promoModel.type!.toLowerCase() == 'voucher'? "Voucher" : "Diskon",
                  style: Get.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                  children: [
                    TextSpan(
                      text: isVoucher == true? ' Rp. ${promoModel.nominal ?? ''}' : ' ${promoModel.nominal ?? ''} %',
                      style: Get.textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 1
                          ..color = Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
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
    );
  }
}
