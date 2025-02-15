import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venturo_java_code/Main_screen.dart';
import 'package:venturo_java_code/features/beranda/bindings/beranda_binding.dart';
import 'package:venturo_java_code/features/beranda/sub_features/detail_katalog/view/ui/detail_katalog_screen.dart';
import 'package:venturo_java_code/features/beranda/view/ui/beranda_screen.dart';
import 'package:venturo_java_code/features/bottom_navigation/bindings/bottom_navigation_binding.dart';
import 'package:venturo_java_code/features/log_in/bindings/log_in_binding.dart';
import 'package:venturo_java_code/features/log_in/view/ui/log_in_screen.dart';
import 'package:venturo_java_code/features/pesanan/bindings/pesanan_binding.dart';
import 'package:venturo_java_code/features/pesanan/view/ui/pesanan_screen.dart';
import 'package:venturo_java_code/features/promo/view/ui/promo_screen.dart';
import 'package:venturo_java_code/shared/widgets/halaman_utama.dart';

import '../../features/bottom_navigation/view/ui/bottom_navigation_screen.dart';
import '../../features/loading_location/view/ui/loading_location_screen.dart';
import '../../features/pesanan/view/ui/pesanaan_UI.dart';
import '../../features/profiling/bindings/profiling_binding.dart';
import '../../features/profiling/view/ui/profiling_screen.dart';
import '../../features/promo/bindings/promo_binding.dart';
import '../routes/route.dart';

abstract class Pages {
  static final pages = [
    /*  
HALAMAN-UTAMA
*/
    // GetPage(
    //   name: Routes.halamanUtama,
    //   page: () => HalamanUtama(),
    //   // binding: PesananBinding(),
    // ),
    GetPage(
      name: Routes.profilingRoute,
      page: () => ProfilingScreen(),
      binding: ProfilingBinding(),
    ),

/*
LOGIN
 */
    GetPage(
        name: Routes.logInRoute,
        page: () => LogInScreen(),
        binding: LogInBinding()),

/*
GETTING LOCATION
*/

    GetPage(
      name: Routes.loadingLocationRoute,
      page: () => LoadingLocationScreen(),
      // binding: BerandaBinding(),
    ),

/*
BERANDA-PAGE
*/
    GetPage(
      name: Routes.berandaRoute,
      page: () => BerandaScreen(),
      binding: BerandaBinding(),
    ),

/*
PROMO-PAGE
*/
    GetPage(
      name: Routes.promoRoute,
      page: () => PromoScreen(),
      binding: PromoBinding(),
    ),

/*
DETAIL KATALOG PAGE
*/

    GetPage(
      name: Routes.berandaDetailKatalogRoute,
      page: () => DetailKatalogScreen(),
      binding: BerandaBinding(),
    ),

/*
PESANAN-PAGE
*/
     GetPage(
       name: Routes.pesananRoute,
       page: () => PesananScreen(),
        binding: PesananBinding(),
     ),

    
    GetPage(
      name: Routes.bottomNavigationRoute,
      page: () => MainScreen(),
    )
  ];
}
