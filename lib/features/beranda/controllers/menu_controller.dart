import 'package:get/get.dart';

import '../models/menu_model.dart';
import '../repositories/Menu/menu_repository.dart';


class MenuController2 extends GetxController {
  final MenuRepository _menuRepository = MenuRepository();
  var menuList = <MenuModel>[].obs; // Objek reaktif untuk daftar menu
  var isLoading = false.obs; // Objek reaktif untuk status loading

  @override
  void onInit() {
    super.onInit();
    fetchAllMenus();
  }

  Future<void> fetchAllMenus() async {
    isLoading.value = true;
    try {
      final menus = await _menuRepository.getAllMenu();
      print("Data Controller : $menus");
      menuList.value = menus; // Update daftar menu
    } catch (e) {
      Get.snackbar('Error', e.toString()); // Menampilkan error menggunakan GetX Snackbar
    } finally {
      isLoading.value = false;
    }
  }
}
