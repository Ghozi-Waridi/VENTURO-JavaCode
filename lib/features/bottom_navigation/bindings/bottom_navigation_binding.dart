import 'package:get/get.dart';
    import 'package:venturo_java_code/features/bottom_navigation/controllers/bottom_navigation_controller.dart';
    class BottomNavigationBinding extends Bindings {
      @override
      void dependencies() {
        Get.put(BottomNavigationController());
      }
    }
    