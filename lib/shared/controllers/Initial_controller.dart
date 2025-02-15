import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:venturo_java_code/configs/routes/route.dart';
import 'package:venturo_java_code/utils/services/location_service.dart';

import '../../features/loading_location/view/ui/loading_location_screen.dart';
import '../../utils/services/hive_service.dart';

class InitialController extends GetxController {
  static InitialController get to => Get.find<InitialController>();

  RxString statusLocation = RxString('Loading');
  RxString messageLocation = RxString('');
  Rxn<Position> position = Rxn<Position>();
  RxnString address = RxnString('');

  RxString id = RxString('');
  RxString name = RxString('');
  RxString photo = RxString('');

  @override
  void onReady() {
    super.onReady();
    getLocation();
    LocationServices.streamService.listen(
      (status) => getLocation(),
    );
    id.value = HiveService.getData("id") ?? '';
    name.value = HiveService.getData("name") ?? '';
    photo.value = HiveService.getData("photo") ?? '';
  }

  Future<void> getLocation() async {
    if (Get.isDialogOpen == false) {
      Get.dialog(const LoadingLocationScreen(), barrierDismissible: false);
    }

    try {
      statusLocation.value = 'Getting location...';
      final locationResult = await LocationServices.getCurrentPosition();

      if (locationResult.success) {
        position.value = locationResult.position;
        address.value = locationResult.address;
        statusLocation.value = 'Success';

        await Future.delayed(Duration(seconds: 1));
        Get.until(ModalRoute.withName(Routes.berandaRoute));
      } else {
        statusLocation.value = 'Failed';
        messageLocation.value = locationResult.message!;
      }
    } catch (e) {
      statusLocation.value = 'Failed';
      messageLocation.value = "server Error".tr;
    } finally {
      Get.back();
    }
  }
}
