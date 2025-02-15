import 'dart:io';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../../configs/routes/route.dart';
import '../../constants/Cores/API/api_constant.dart';

class GlobalController extends GetxController {
  var baseUrl = ApiConstant.production;
  var isConnect = false.obs;
  var isStaging = false.obs;
  static GlobalController get to => Get.find();

  Future<void> checkConnection() async {
    try {
      final result = await InternetAddress.lookup("space.venturo.id");
      print("Result di Global Controlller : $result");
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isConnect.value = true;
      }
    } on SocketException catch (exception, stackTrace) {
      isConnect.value = false;
      /* CATATAN PRIBADI
       *  Di bagian ini kita akan menangkap error yang terjadi ketika koneksi internet tidak tersedia, dan di laporkan ke sentry, dan sentry akan melacak error tersebut
       */
      await Sentry.captureException(exception, stackTrace: stackTrace);
      Get.offAllNamed(Routes.noConnection);
    }
  }

  void showLoading({String message = "Loading..."}) {
    EasyLoading.show(
        status: message,
        maskType: EasyLoadingMaskType.black,
        dismissOnTap: false);
  }

  void hideLoading() {
    EasyLoading.dismiss();
  }
}
