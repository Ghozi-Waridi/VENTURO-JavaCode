import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:venturo_java_code/features/beranda/controllers/beranda_controller.dart';
import 'package:venturo_java_code/features/log_in/controllers/log_in_controller.dart';
import 'package:venturo_java_code/features/pesanan/controllers/pesanan_controller.dart';
import 'package:venturo_java_code/utils/services/hive_service.dart';

import 'configs/pages/page.dart';
import 'configs/routes/route.dart';
import 'configs/themes/theme.dart';
import 'shared/controllers/Global_Controller.dart';

import 'package:get_storage/get_storage.dart';

import 'shared/controllers/Initial_controller.dart';

void main() async {
  
  await GetStorage.init();
  await HiveService.init();
  await Hive.openBox('venturo_box');
  // Get.put(ProfilingBinding());
  Get.put(GlobalController());
  Get.put(InitialController());
  Get.put(LogInController());
  Get.put(BerandaController());  
  print("Main File Di Panggil");
  Get.lazyPut(() => PesananController(), fenix: true);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Venturor',
          debugShowCheckedModeBanner: false,
          // initialBinding: , Jika memiliki global bindding
          initialRoute: Routes.logInRoute,
          theme: mainTheme,
          defaultTransition: Transition.native,
          getPages: Pages.pages,
          builder: EasyLoading.init(),
        );
      },
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:venturo_java_code/features/log_in/controllers/log_in_controller.dart';
// import 'package:venturo_java_code/utils/services/hive_service.dart';

// import 'Main_screen.dart';
// import 'configs/pages/page.dart';
// import 'configs/routes/route.dart';
// import 'configs/themes/theme.dart';
// import 'shared/controllers/Global_Controller.dart';
// import 'shared/controllers/Initial_controller.dart';
// // import 'features/main_screen.dart';
// import 'package:get_storage/get_storage.dart';

// void main() async {
//   await GetStorage.init();
//   await HiveService.init();
//   await Hive.openBox('venturo_box');

//   Get.put(GlobalController());
//   Get.put(InitialController());
//   Get.put(LogInController());

//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       designSize: const Size(414, 896),
//       minTextAdapt: true,
//       splitScreenMode: true,
//       builder: (context, child) {
//         return GetMaterialApp(
//           title: 'Venturo',
//           debugShowCheckedModeBanner: false,
//           theme: mainTheme,
//           defaultTransition: Transition.native,
//           getPages: Pages.pages,
//           builder: EasyLoading.init(),
//         );
//       },
//     );
//   }
// }
