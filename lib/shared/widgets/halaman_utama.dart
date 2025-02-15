// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../features/beranda/controllers/beranda_controller.dart';
// import '../../features/beranda/view/ui/beranda_screen.dart';
// import '../../features/pesanan/view/ui/pesanan_screen.dart';
// import 'Bottom_navigation_widget.dart';

// class HalamanUtama extends StatelessWidget {
//   const HalamanUtama({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Obx(() => IndexedStack(
//         index: BerandaController.to.selectedIndex.value,
//         children: [
//           BerandaScreen(),
//           PesananScreen(),
//         ],
//       )),
//       bottomNavigationBar: MyBottomNavigationBar(), 
//     );
//   }
// }