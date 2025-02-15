import 'package:get/get.dart';
    import 'package:venturo_java_code/features/log_in/controllers/log_in_controller.dart';
    class LogInBinding extends Bindings {
      @override
      void dependencies() {
        Get.put(LogInController());
      }
    }
    