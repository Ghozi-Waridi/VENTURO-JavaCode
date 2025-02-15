import 'package:get/get.dart';
    import 'package:venturo_java_code/features/promo/controllers/promo_controller.dart';
    class PromoBinding extends Bindings {
      @override
      void dependencies() {
        Get.put(PromoController());
      }
    }
    