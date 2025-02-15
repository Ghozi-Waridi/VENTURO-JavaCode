import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilingProfilingTwoController extends GetxController {
  static ProfilingProfilingTwoController get to => Get.find();

  final instagramController = TextEditingController();
  var instagramErrorMessage = "".obs;

  final tiktokController = TextEditingController();
  var tiktokErrorMessage = "".obs;

  final twitterController = TextEditingController();
  var twitterErrorMessage = "".obs;

  final facebookController = TextEditingController();
  var facebookErrorMessage = "".obs;

  @override
  void onInit() {
    super.onInit();

    instagramController.addListener(instagramListener);
  }

  void instagramListener() {
    var instagram = instagramController.text.trim();

    if (instagram.isEmpty) {
      instagramErrorMessage.value = 'Instagram harus diisi';
      return;
    }

    if (instagram.startsWith('@')) {
      instagramErrorMessage.value = "Tidak boleh diawali '@'";
      return;
    }

    // Regular expression pattern to match allowed characters
    RegExp regExp = RegExp(r'^[a-zA-Z0-9_.]+$');

    if (!regExp.hasMatch(instagram)) {
      instagramErrorMessage.value =
          "Gunakan hanya huruf besar dan kecil, angka, (_) dan (.)";
      return;
    }

    instagramErrorMessage.value = '';
  }
}
