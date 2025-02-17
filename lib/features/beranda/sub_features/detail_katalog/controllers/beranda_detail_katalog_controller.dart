import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venturo_java_code/features/beranda/sub_features/detail_katalog/models/menu_detial_model.dart';
import '../repositories/detail_katalog_repository.dart';
import '../../../models/menu_model.dart';


class BerandaDetailKatalogController extends GetxController {
  static BerandaDetailKatalogController get to => Get.find();

 final Rxn<MenuDetailModel> detailMenu = Rxn<MenuDetailModel>();

  final RxString menu = "".obs;
  final RxString level = "".obs;
  final RxString topping = "".obs;
  final RxString catatan = "".obs;
  RxInt jumlah = 0.obs;

  final RxBool isSelected = false.obs;

  late final DetailKatalogRepository detailRepository;

  final controller = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    detailRepository = DetailKatalogRepository();

    if (Get.arguments != null) {
      final MenuModel dataModel = Get.arguments as MenuModel;
      fetchMenuByID(dataModel.idMenu);
    }
  }

   Future<void> fetchMenuByID(int idMenu) async {
    try {
      final data = await detailRepository.getAllMenu(idMenu);
      detailMenu.value = data;
      update(); 
    } catch (e) {
      print("Failed to fetch menu data by ID: $e");
      Get.snackbar('Error', "Failed to fetch menu data by ID: $e");
    }
  }
}

