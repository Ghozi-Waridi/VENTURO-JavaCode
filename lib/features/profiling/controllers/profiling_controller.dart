import 'package:get/get.dart';

class ProfilingController extends GetxController {
  static ProfilingController get to => Get.find();

  var profilingStepIndex = 0.obs;

  void nextProfilingStep() {
    profilingStepIndex++;
  }

  void previousProfilingStep() {
    profilingStepIndex--;
  }

  /// Set Profiling Step berdasarkan index
  void setProfilingStep(int index) {
    profilingStepIndex.value = index;
  }
}
