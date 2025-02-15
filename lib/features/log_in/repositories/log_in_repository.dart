import 'package:get_storage/get_storage.dart';

import '../../../utils/services/Api_service.dart';
import '../models/log_in_model.dart';

class LogInRepository {
  final ApiService _apiService = ApiService();
  final storage = GetStorage();

  Future<UserModel> login(
      {required String email, required String password}) async {
    try {
      final response = await _apiService.post(
        '/auth/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        final success = response.data['status_code'] == 200;
        if (success) {
          final token = response.data['data']['token'];
          storage.write('token', token);

          final userData = response.data['data']['user'];
          return UserModel.fromJson(userData);
        } else {
          throw Exception('Login gagal: ${response.data['message']}');
        }
      } else {
        throw Exception('Server Error: ${response.data}');
      }
    } catch (e) {
      throw Exception('Error during login: $e');
    }
  }
}
