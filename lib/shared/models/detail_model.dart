class DetailModel {
  int? idDetail;
  int? idMenu;
  String? keterangan;
  String? type;
  int? harga;

  DetailModel({
    this.idDetail,
    this.idMenu,
    this.keterangan,
    this.type,
    this.harga,
  });

  DetailModel.fromJson(Map<String, dynamic> json) {
    idDetail = json['id_detail'];
    idMenu = json['id_menu'];
    keterangan = json['keterangan'];
    type = json['type'];
    harga = json['harga'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_detail'] = this.idDetail;
    data['id_menu'] = this.idMenu;
    data['keterangan'] = this.keterangan;
    data['type'] = this.type;
    data['harga'] = this.harga;
    return data;
  }
}
