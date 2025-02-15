import 'package:get/get.dart';
    import 'package:venturo_java_code/features/loading_location/controllers/loading_location_controller.dart';
    class LoadingLocationBinding extends Bindings {
      @override
      void dependencies() {
        Get.put(LoadingLocationController());
      }
    }
    