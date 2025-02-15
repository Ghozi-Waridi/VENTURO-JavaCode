// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:venturo_java_code/configs/routes/route.dart';
// import 'package:venturo_java_code/features/log_in/controllers/log_in_controller.dart';
// import 'package:venturo_java_code/shared/styles/color_style.dart';

// import '../../features/beranda/controllers/beranda_controller.dart';

// class MyBottomNavigationBar extends StatelessWidget {
//   const MyBottomNavigationBar({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () =>
//       SizedBox(
//         height: 80,
//         child: ClipRRect(
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(30.0),
//             topRight: Radius.circular(30.0),
//           ),
//           child: BottomNavigationBar(
//             items: const <BottomNavigationBarItem>[
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.home),
//                 label: 'Beranda',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.assignment),
//                 label: 'Pesanan',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.person),
//                 label: 'Profil',
//               ),
//             ],
//             currentIndex: BerandaController.to.selectedIndex.value,
//             onTap: (index) {
//               if (LogInController.to.isLoggedIn.value) {
//                 BerandaController.to.changeIndex(index);
//               } else {
//                 Get.toNamed(Routes.logInRoute);
//               }
//             },
//             backgroundColor: ColorStyle.dark,
//             selectedItemColor: Colors.blue,
//             unselectedItemColor: Colors.grey,
//           ),
//         ),
//       )
//     );
    
    
//   }
// }
