import 'package:get/get.dart';
import 'package:venturo_java_code/features/beranda/controllers/beranda_controller.dart';
import 'package:venturo_java_code/features/beranda/sub_features/detail_katalog/controllers/beranda_detail_katalog_controller.dart';

// import '../controllers/menu_controller.dart';
    class BerandaBinding extends Bindings {
      @override
      void dependencies() {
        Get.put(BerandaController());
        Get.put(BerandaDetailKatalogController());
      }
    }
    
