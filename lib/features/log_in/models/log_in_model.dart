class UserModel {
  final int idUser;
  final String email;
  final String nama;
  final String? foto;
  final String roles;
  final bool? isGoole;
  final bool? isCustomer;
  final Map<String, bool> akses;

  UserModel({
    required this.idUser,
    required this.email,
    required this.nama,
    this.foto,
    this.isGoole,
    this.isCustomer,
    required this.roles,
    required this.akses,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      idUser: json['id_user'],
      email: json['email'],
      nama: json['nama'],
      foto: json['foto'],
      roles: json['roles'],
      isGoole: json['is_goole'] == 1 ? true  : false,
      isCustomer: json['is_customer'] == 1 ? true : false,
      akses: Map<String, bool>.from(json['akses']),
    );
  }
}

class AuthResponse {
  final UserModel user;
  final String token;

  AuthResponse({
    required this.user,
    required this.token,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      user: UserModel.fromJson(json['user']),
      token: json['token'],
    );
  }
}
