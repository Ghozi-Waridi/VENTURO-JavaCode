import 'package:get/get.dart';
import 'package:venturo_java_code/features/beranda/models/menu_model.dart';
import 'package:venturo_java_code/features/beranda/sub_features/detail_katalog/models/menu_detial_model.dart';
import 'package:venturo_java_code/features/pesanan/models/Pesanan.dart';

class PesananController extends GetxController {
  static PesananController get to => Get.find();

  List<MenuDetailModel> pesanan = <MenuDetailModel>[].obs;
  List<Pesanan> makanan = <Pesanan>[].obs;
  List<Pesanan> minuman = <Pesanan>[].obs;
  List<Pesanan> snack = <Pesanan>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> addDataPesanan(Pesanan menu) async {
    try {
      if (menu != null) {
        if (menu.category.toLowerCase() == "makanan") {
          _tambahPesanan(makanan, menu);
        } else if (menu.category.toLowerCase() == "minuman") {
          _tambahPesanan(minuman, menu);
        } else {
          _tambahPesanan(snack, menu);
        }
      }
    } catch (e) {
      print("Penambahan Data $e");
    }
  }

  void _tambahPesanan(List<Pesanan> list, Pesanan menu) {
    int index = list.indexWhere((item) =>
        item.idMenu == menu.idMenu &&
        item.topping == menu.topping &&
        item.level == menu.level);

    if (index != -1) {
      list[index].jumlah = (list[index].jumlah ?? 0) + (menu.jumlah ?? 0);
    } else {
      list.add(menu);
    }
    update();
  }
}
