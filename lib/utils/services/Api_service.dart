import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class ApiService {
  late final Dio _dio;
  final storage = GetStorage();

  ApiService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://trainee.landa.id/javacode',
        connectTimeout: const Duration(milliseconds: 5000),
        receiveTimeout: const Duration(milliseconds: 5000),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        final token = storage.read<String>('token');
        print("Token Service : $token");
        if (token != null) {
          print("Options : ${options.headers['token'] = token}");
          options.headers['token'] = token;
        }
        return handler.next(options);
      },
      onError: (error, handler) {
        return handler.next(error);
      },
    ));
  }

  Future<Response> post(String endpoint, {Map<String, dynamic>? data}) async {
    try {
      
      return await _dio.post(endpoint, data: data);
    } catch (e) {
      throw Exception('Error in POST: $e');
    }
  }

  Future<Response> get(String endpoint) async {
    try {
      print("GET : ${_dio.get(endpoint)}");
      return await _dio.get(endpoint);
    } catch (e) {
      throw Exception('Error in GET: $e');
    }
  }
}
