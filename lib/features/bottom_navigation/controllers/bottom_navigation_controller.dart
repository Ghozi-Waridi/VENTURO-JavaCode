import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../beranda/view/ui/beranda_screen.dart';
import '../../pesanan/view/ui/pesanan_screen.dart';
import '../../profiling/view/ui/profile.dart';

class BottomNavigationController extends GetxController {
  static BottomNavigationController get to => Get.find();

  final RxInt currentIndex = 0.obs;

  final List<Widget> pages = [
    BerandaScreen(),
    PesananScreen(),
    Profile(),
  ];

  void changePage(int index) {
    currentIndex.value = index;
  }
}
