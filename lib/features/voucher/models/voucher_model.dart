
class VoucherModel {
  final int idVoucher;
  final String nama;
  final int idUser;
  final String namaUser;
  final double nominal;
  final String infoVoucher;
  final String periodeMulai;
  final String periodeSelesai;
  final int type;
  final int status;
  final String catatan;

  VoucherModel({
    required this.idVoucher,
    required this.nama,
    required this.idUser,
    required this.namaUser,
    required this.nominal,
    required this.infoVoucher,
    required this.periodeMulai,
    required this.periodeSelesai,
    required this.type,
    required this.status,
    required this.catatan,
  });

  // Fungsi untuk membuat objek Voucher dari JSON
  factory VoucherModel.fromJson(Map<String, dynamic> json) {
    return VoucherModel(
      idVoucher: json['id_voucher'],
      nama: json['nama'],
      idUser: json['id_user'],
      namaUser: json['nama_user'],
      nominal: json['nominal'].toDouble(),
      infoVoucher: json['info_voucher'],
      periodeMulai: json['periode_mulai'],
      periodeSelesai: json['periode_selesai'],
      type: json['type'],
      status: json['status'],
      catatan: json['catatan'],
    );
  }

  // Fungsi untuk mengubah objek Voucher menjadi JSON
  Map<String, dynamic> toJson() {
    return {
      'id_voucher': idVoucher,
      'nama': nama,
      'id_user': idUser,
      'nama_user': namaUser,
      'nominal': nominal,
      'info_voucher': infoVoucher,
      'periode_mulai': periodeMulai,
      'periode_selesai': periodeSelesai,
      'type': type,
      'status': status,
      'catatan': catatan,
    };
  }
}

