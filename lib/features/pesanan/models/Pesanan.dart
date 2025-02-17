

class Pesanan {
  final int idMenu;
  final int? harga;
  final List<dynamic> level;
  final List<dynamic> topping;
  late final int jumlah;
  final String catatan;
  final String? category;

  Pesanan({
    required this.idMenu,
    required this.harga,
    required this.level,
    required this.topping,
    required this.jumlah,
    required this.catatan,
    required this.category,
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
    };
  }
}
