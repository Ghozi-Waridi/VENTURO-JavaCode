import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  /// Inisialisasi Hive
  static Future<void> init() async {
    await Hive.initFlutter();
    // Tambahkan adapter jika menyimpan object custom
    // Hive.registerAdapter(YourModelAdapter()); 
  }

  /// Getter untuk mengakses Box
  static Box get box => Hive.box('venturo_box');
  
  /// Contoh method untuk menyimpan data
  static Future<void> saveData(String key, dynamic value) async {
    await box.put(key, value);
  }

  /// Contoh method untuk membaca data
  static dynamic getData(String key) {
    return box.get(key);
  }
}