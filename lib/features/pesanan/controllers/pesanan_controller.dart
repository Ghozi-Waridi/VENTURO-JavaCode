import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:venturo_java_code/features/beranda/models/menu_model.dart';
import 'package:venturo_java_code/features/beranda/sub_features/detail_katalog/models/menu_detial_model.dart';
import 'package:venturo_java_code/features/pesanan/models/Pesanan.dart';
class PesananController extends GetxController {
  static PesananController get to => Get.find();

  RxList<MenuDetailModel> pesanan = <MenuDetailModel>[].obs;
  RxList<Pesanan> makanan = <Pesanan>[].obs;
  RxList<Pesanan> minuman = <Pesanan>[].obs;
  RxList<Pesanan> snack = <Pesanan>[].obs;

  late GetStorage box;

  @override
  void onInit() {
    super.onInit();
    box = GetStorage();
  }

  Future<void> addDataPesanan(Pesanan menu) async {
    print("PesananController - addDataPesanan terpanggil, data menu: ${menu.toJson()}"); // TAMBAHKAN PRINT INI
    try {
      if (menu != null) {
        if (menu.category!.toLowerCase() == "makanan") {
          _tambahPesanan(makanan, menu);
        } else if (menu.category!.toLowerCase() == "minuman") {
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
    print("PesananController - _tambahPesanan terpanggil, data menu: ${menu.toJson()}"); // TAMBAHKAN PRINT INI
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

  void _savePesanan(){
    
    box.write("makanan", makanan.map((item) => item.toJson()).toList());
    box.write("minuman", minuman.map((item) => item.toJson()).toList());
    box.write("snack", snack.map((item) => item.toJson()).toList());
  }

  void _loadDataPesanan(){
    var makananData = box.read("makanan");
    var minumanData = box.read("minuman");
    var snackData = box.read("snack");

    if (makananData != null) {
      makanan.value = List<Pesanan>.from(makananData.map((item) => Pesanan.fromJson(item)));
    }
    if (minumanData != null) {
      minuman.value = List<Pesanan>.from(minumanData.map((item) => Pesanan.fromJson(item)));
    }
    if (snackData != null) {
      snack.value = List<Pesanan>.from(snackData.map((item) => Pesanan.fromJson(item)));
    }
  }
}
