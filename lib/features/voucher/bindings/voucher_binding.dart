import 'package:get/get.dart';
    import 'package:venturo_java_code/features/voucher/controllers/voucher_controller.dart';
    class VoucherBinding extends Bindings {
      @override
      void dependencies() {
        Get.put(VoucherController());
      }
    }
    