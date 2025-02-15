import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venturo_java_code/features/bottom_navigation/controllers/bottom_navigation_controller.dart';
import 'package:venturo_java_code/features/bottom_navigation/view/ui/bottom_navigation_screen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigationController = Get.put(BottomNavigationController());

    return Scaffold(
      body: Obx(() => navigationController.pages[navigationController.currentIndex.value]),
      bottomNavigationBar: BottomNavigationScreen(),
    );
  }
}