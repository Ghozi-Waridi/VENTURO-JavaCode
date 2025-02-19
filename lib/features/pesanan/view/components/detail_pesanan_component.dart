import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../shared/styles/google_text_style.dart';
import '../../../../shared/styles/color_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../constants/Icons/Icon_constants.dart';
import '../components/showDialog_component.dart';

class DetailPesananComponent extends StatelessWidget {
  final int? jumlah;
  final int? diskon;
  final int? idVoucher;

  const DetailPesananComponent({
    super.key,
    this.jumlah,
    this.diskon,
    this.idVoucher,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25.0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25),
          topLeft: Radius.circular(25),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          15.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total Pesanan (${jumlah.toString()} Menu) :",
                style: GoogleTextStyle.fw600.copyWith(
                  fontSize: 18.sp,
                  color: Colors.black,
                ),
              ),
              Text(
                "Rp 30.000",
                style: GoogleTextStyle.fw700.copyWith(
                  fontSize: 16.sp,
                  color: ColorStyle.primary,
                ),
              ),
            ],
          ),
          10.verticalSpace,

          Divider(
            color: Colors.grey,
          ),
10.verticalSpace,

          InkWell(
            onTap: () {
              showDiskonDialog(context);
            },
            child: Row(
              children: [
                SvgPicture.asset(
                  IconConstants.pesananDiskon,
                  height: 30.h,
                  width: 30.w,
                ),
                SizedBox(width: 8.0),
                Text(
                  "Diskon 20%",
                  style: GoogleTextStyle.fw700.copyWith(
                    fontSize: 18.sp,
                    color: Colors.black,
                  ),
                ),
                const Spacer(),
                            Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 20.sp,
                ),              ],
            ),
          ),
10.verticalSpace,

          Divider(
            color: Colors.grey,
          ),
          10.verticalSpace,

          InkWell(
            onTap: () {},
            child: Row(
              children: [
                SvgPicture.asset(
                  IconConstants.pesananVoucher,
                  height: 20.h,
                  width: 20.w,
                ),
                const SizedBox(width: 8.0),
                Text(
                  "Voucher",
                  style: GoogleTextStyle.fw700.copyWith(
                    fontSize: 18.sp,
                    color: Colors.black,
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 20.sp,
                ),
              ],
            ),
          ),
          10.verticalSpace,
          Divider(
            color: Colors.grey,
          ),
10.verticalSpace,

          InkWell(
            onTap: () {},
            child: Row(
              children: [
                SvgPicture.asset(
                  IconConstants.pesananPembayaran,
                  height: 30.h,
                  width: 30.w,
                ),
                const SizedBox(width: 8.0),
                Text(
                  "Pembayaran",
                  style: GoogleTextStyle.fw700.copyWith(
                    fontSize: 18.sp,
                    color: Colors.black,
                  ),
                ),
                const Spacer(),
               Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 20.sp,
                ),
              ],
            ),
          ),
          15.verticalSpace
        ],
      ),
    );
  }
}
