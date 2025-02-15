class DetailModel {
  final int idDetail;
  final int idMenu;
  final String? keterangan;
  final String? type;
  final double? harga;

  DetailModel({
    required this.idDetail,
    required this.idMenu,
    this.keterangan,
    this.type,
    this.harga,
  });


 factory DetailModel.fromJson(Map<String, dynamic> json) => DetailModel(
        idDetail: json["id_detail"],
        idMenu: json["id_menu"],
        keterangan: json["keterangan"],
        type: json["type"],
        harga: json["harga"],
      );

  Map<String, dynamic> toJson() => {
        "id_detail": idDetail,
        "id_menu": idMenu,
        "keterangan": keterangan,
        "type": type,
        "harga": harga,
      };
}
