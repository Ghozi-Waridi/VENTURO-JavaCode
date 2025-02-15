class PromoModel {
  int? idPromo;
  String? nama;
  String? type;
  int? diskon;
  int? nominal;
  int? kadaluarsa;
  String? syaratKetentuan;
  String? foto;
  int? createdAt;
  int? createdBy;
  int? isDeleted;

  PromoModel(
      {this.idPromo,
      this.nama,
      this.type,
      this.diskon,
      this.nominal,
      this.kadaluarsa,
      this.syaratKetentuan,
      this.foto,
      this.createdAt,
      this.createdBy,
      this.isDeleted});

  PromoModel.fromJson(Map<String, dynamic> json) {
    idPromo = json['id_promo'];
    nama = json['nama'];
    type = json['type'];
    diskon = json['diskon'];
    nominal = json['nominal'];
    kadaluarsa = json['kadaluarsa'];
    syaratKetentuan = json['syarat_ketentuan'];
    foto = json['foto'];
    createdAt = json['created_at'];
    createdBy = json['created_by'];
    isDeleted = json['is_deleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_promo'] = this.idPromo;
    data['nama'] = this.nama;
    data['type'] = this.type;
    data['diskon'] = this.diskon;
    data['nominal'] = this.nominal;
    data['kadaluarsa'] = this.kadaluarsa;
    data['syarat_ketentuan'] = this.syaratKetentuan;
    data['foto'] = this.foto;
    data['created_at'] = this.createdAt;
    data['created_by'] = this.createdBy;
    data['is_deleted'] = this.isDeleted;
    return data;
  }
}
