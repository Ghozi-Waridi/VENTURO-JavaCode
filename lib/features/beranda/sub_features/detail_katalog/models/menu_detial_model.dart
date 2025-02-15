import 'package:venturo_java_code/features/beranda/models/menu_model.dart';
import 'package:venturo_java_code/shared/models/detail_model.dart';

class MenuDetailModel {
  final MenuModel menu;
  final List<DetailModel> topping;
  final List<DetailModel> level;

  MenuDetailModel({ 
    required this.menu,
    required this.topping,
    required this.level,
  });

  factory MenuDetailModel.fromJson(Map<String, dynamic> json) =>
      MenuDetailModel(
        menu: json["menu"] != null ? MenuModel.fromJson(json["menu"]) : MenuModel(idMenu: 0, nama: '', kategori: '', harga: 0, deskripsi: '', foto: '', status: 0),
        topping: json["topping"] != null ? List<DetailModel>.from(
            json["topping"].map((x) => DetailModel.fromJson(x))) : [],
        level: json["level"] != null ? List<DetailModel>.from(
            json["level"].map((x) => DetailModel.fromJson(x))) : [],
      );

  Map<String, dynamic> toJson() => {
        "menu": menu.toJson(),
        "topping": List<dynamic>.from(topping.map((x) => x.toJson())),
        "level": List<dynamic>.from(level.map((x) => x.toJson())),
      };
}
