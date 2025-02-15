import 'package:get/get.dart';

import '../controllers/profiling_controller.dart';
import '../sub_features/profiling_one/controllers/profiling_profiling_one_controller.dart';
import '../sub_features/profiling_three/controllers/profiling_profiling_three_controller.dart';
import '../sub_features/profiling_two/controllers/profiling_profiling_two_controller.dart';


class ProfilingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfilingController());
    Get.put(ProfilingProfilingOneController());
    Get.put(ProfilingProfilingTwoController());
    Get.put(ProfilingProfilingThreeController());
  }
}
