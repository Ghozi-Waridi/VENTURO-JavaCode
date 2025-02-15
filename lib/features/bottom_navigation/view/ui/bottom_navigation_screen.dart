  import 'package:flutter/material.dart';
import 'package:get/get.dart';
  import 'package:venturo_java_code/features/bottom_navigation/constants/bottom_navigation_assets_constant.dart';
import 'package:venturo_java_code/features/bottom_navigation/controllers/bottom_navigation_controller.dart';

import '../../../../shared/styles/color_style.dart';
  class BottomNavigationScreen extends StatelessWidget {
    BottomNavigationScreen({Key? key}):super(key: key);

    final assetsConstant = BottomNavigationAssetsConstant();
    @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 80,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Beranda',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.assignment),
                label: 'Pesanan',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profil',
              ),
            ],
            currentIndex: BottomNavigationController.to.currentIndex.value,
            onTap: (index) => BottomNavigationController.to.changePage(index),
            backgroundColor: ColorStyle.dark,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
          ),
        ),
      ),
    );
  }
}
    