  class MenuModel {
      int idMenu;
      String? nama;
      String? kategori;
      int? harga;
      String? deskripsi;
      String? foto;
      int? status;
  
      MenuModel({
        required this.idMenu,
        required this.nama,
        required this.kategori,
        required this.harga,
        required this.deskripsi,
        required this.foto,
        required this.status,
      });
  
      factory MenuModel.fromJson(Map<String, dynamic> json) {
        return MenuModel(
          idMenu: json['id_menu'] ?? 0,
          nama: json['nama'],
          kategori: json['kategori'],
          harga: json['harga'] ?? 0,
          deskripsi: json['deskripsi'],
          foto: json['foto'] != null && json['foto'].isNotEmpty
              ? json['foto']
              : 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/240px-No_image_available.svg.png',
          status: json['status'],
        );
      }
  
      Map<String, dynamic> toJson() {
        return {
          'id_menu': idMenu,
          'nama': nama,
          'kategori': kategori,
          'harga': harga,
          'deskripsi': deskripsi,
          'foto': foto,
          'status': status,
        };
      }
  }