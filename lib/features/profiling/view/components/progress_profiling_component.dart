import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../shared/styles/color_style.dart';
import '../../controllers/profiling_controller.dart';

class ProgressProfilingComponent extends StatelessWidget {
  const ProgressProfilingComponent({
    super.key,
    required this.controller,
  });

  final ProfilingController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /* Lingkaran Step Profiling 1*/
        Obx(() {
          var profilingStepIndex = controller.profilingStepIndex.value;

          /// Jika step profiling pada step 1 (index = 0) atau lebih
          ///
          /// Berikan warna lingkaran menjadi [ColorStyle.primary]
          /// Jika tidak, ubah color menjadi [ColorStyle.colorE9ECEF]
          var selected = false;
          if (profilingStepIndex >= 0) {
            selected = true;
          }

          return InkWell(
            onTap: () => controller.setProfilingStep(0),
            child: Container(
              width: 20.w,
              height: 20.h,
              decoration: BoxDecoration(
                color: selected ? ColorStyle.primary : ColorStyle.colorE9ECEF,
                shape: BoxShape.circle,
              ),
            ),
          );
        }),

        /* Garis Step Profiling 1 */
        Obx(() {
          var profilingStepIndex = controller.profilingStepIndex.value;

          /// Jika step profiling pada step 2 (index 1) atau lebih
          ///
          /// Berikan warna container menjadi [ColorStyle.primary]
          /// Jika tidak, ubah color menjadi [ColorStyle.colorE9ECEF]
          var selected = false;
          if (profilingStepIndex >= 1) {
            selected = true;
          }

          return Expanded(
            child: Container(
              height: 5.h,
              decoration: BoxDecoration(
                color: selected ? ColorStyle.primary : ColorStyle.colorE9ECEF,
              ),
            ),
          );
        }),
        /* Lingkaran Step Profiling 2 */
        Obx(() {
          var profilingStepIndex = controller.profilingStepIndex.value;

          /// Jika step profiling pada step 2 (index = 1) atau lebih
          ///
          /// Berikan warna lingkaran menjadi [ColorStyle.primary]
          /// Jika tidak, ubah color menjadi [ColorStyle.colorE9ECEF]
          var selected = false;
          if (profilingStepIndex >= 1) {
            selected = true;
          }

          return InkWell(
            onTap: () => controller.setProfilingStep(1),
            child: Container(
              width: 20.w,
              height: 20.h,
              decoration: BoxDecoration(
                color: selected ? ColorStyle.primary : ColorStyle.colorE9ECEF,
                shape: BoxShape.circle,
              ),
            ),
          );
        }),
        /* Garis Step Profiling 2 */
        Obx(() {
          var profilingStepIndex = controller.profilingStepIndex.value;

          /// Jika step profiling pada step 3 (index 2)
          ///
          /// Berikan warna container menjadi [ColorStyle.primary]
          /// Jika tidak, ubah color menjadi [ColorStyle.colorE9ECEF]
          var selected = false;
          if (profilingStepIndex == 2) {
            selected = true;
          }

          return Expanded(
            child: Container(
              height: 5.h,
              color: selected ? ColorStyle.primary : ColorStyle.colorE9ECEF,
            ),
          );
        }),
        /* Lingkaran Step Profiling 3 */
        Obx(() {
          var profilingStepIndex = controller.profilingStepIndex.value;

          /// Jika step profiling pada step 3 (index = 2)
          ///
          /// Berikan warna lingkaran menjadi [ColorStyle.primary]
          /// Jika tidak, ubah color menjadi [ColorStyle.colorE9ECEF]
          var selected = false;
          if (profilingStepIndex == 2) {
            selected = true;
          }

          return InkWell(
            onTap: () => controller.setProfilingStep(2),
            child: Container(
              width: 20.w,
              height: 20.h,
              decoration: BoxDecoration(
                color: selected ? ColorStyle.primary : ColorStyle.colorE9ECEF,
                shape: BoxShape.circle,
              ),
            ),
          );
        }),
      ],
    );
  }
}
