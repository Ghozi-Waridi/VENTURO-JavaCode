import 'package:venturo_java_code/features/beranda/models/menu_model.dart';
import 'package:venturo_java_code/features/beranda/sub_features/detail_katalog/models/menu_detial_model.dart';

class Pesanan {
  final int idMenu;
  final int harga;
  final String level;
  final String topping;
  late final int jumlah;
  final String catatan;
  final String category;
  final MenuModel menuModel;

  Pesanan({
    required this.idMenu,
    required this.harga,
    required this.level,
    required this.topping,
    required this.jumlah,
    required this.catatan,
    required this.category,
    required this.menuModel,
  });

  factory Pesanan.fromJson(Map<String, dynamic> json) {
    return Pesanan(
      idMenu: json['idMenu'],
      harga: json['harga'],
      level: json['level'],
      topping: json['topping'],
      jumlah: json['jumlah'],
      catatan: json['catatan'],
      category: json['category'],
      menuModel: json['MenuModel'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idMenu': idMenu,
      'harga': harga,
      'level': level,
      'topping': topping,
      'jumlah': jumlah,
      'catatan': catatan,
      'category': category,
      'menuModel': menuModel,
    };
  }
}
