import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants/profiling_assets_constant.dart';
import '../../controllers/profiling_controller.dart';
import '../../sub_features/profiling_one/view/ui/profiling_one_screen.dart';
import '../../sub_features/profiling_two/view/ui/profiling_two_screen.dart';
import '../components/progress_profiling_component.dart';

class ProfilingScreen extends StatelessWidget {
  ProfilingScreen({Key? key}) : super(key: key);

  final assetsConstant = ProfilingAssetsConstant();
  @override
  Widget build(BuildContext context) {
    var controller = ProfilingController.to;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                ProgressProfilingComponent(controller: controller),
                SizedBox(height: 16.h),
                Obx(() {
                  var profilingStep = controller.profilingStepIndex.value;

                  if (profilingStep == 0) {
                    return ProfilingOneScreen();
                  }

                  if (profilingStep == 1) {
                    return ProfilingTwoScreen();
                  }

                  if (profilingStep == 2) {
                    return const Center(
                      child: Text('Profiling Step 3'),
                    );
                  }

                  return const SizedBox();
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
