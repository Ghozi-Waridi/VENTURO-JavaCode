import 'package:get/get.dart';
    import 'package:venturo_java_code/features/pesanan/controllers/pesanan_controller.dart';
    class PesananBinding extends Bindings {
      @override
      void dependencies() {
        Get.put(PesananController());
      }
    }
    