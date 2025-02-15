import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:venturo_java_code/features/beranda/constants/beranda_assets_constant.dart';
import 'package:venturo_java_code/features/beranda/controllers/beranda_controller.dart';
import 'package:venturo_java_code/features/beranda/view/components/all_section_component.dart';

import 'package:venturo_java_code/features/beranda/view/components/chip_menu_component.dart';


import '../../../../shared/widgets/Bottom_navigation_widget.dart';
import '../components/Section_header_component.dart';
import '../components/card_promo_component.dart';

import '../components/food_section_component.dart';
import '../components/search_bar_component.dart';

class BerandaScreen extends StatelessWidget {
  BerandaScreen({Key? key}) : super(key: key);

  final assetsConstant = BerandaAssetsConstant();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: const SearchAppBarComponent(),
        body: SmartRefresher(
          controller: BerandaController.to.refreshController,
          enablePullDown: true,
          onRefresh: BerandaController.to.onRefresh,
          enablePullUp: false,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 25.w, top: 15.h, bottom: 10.h),
                  child: Row(
                    children: [
                      Icon(Icons.local_offer, size: 24.w, color: Colors.blue),
                      SizedBox(width: 8.w),
                      Text(
                        'Available promo',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 150.h,
                  child: GetBuilder<BerandaController>(
                    builder: (controller) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.symmetric(horizontal: 25.w),
                        itemCount: controller.promoItems.length,
                        itemBuilder: (context, index) {
                          final dataPromo = controller.promoItems[index];
                          return Padding(
                            padding: EdgeInsets.only(right: 15.w),
                            child: CardPromoComponent(
                              isVoucher:
                                  dataPromo.type!.toLowerCase() == "voucher"
                                      ? true
                                      : false,
                              promoModel: dataPromo,
                              enableShadow: true,
                              width: 300,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                SizedBox(height: 15.h),
                SizedBox(
                  width: 1.sw,
                  height: 45.h,
                  child: GetBuilder<BerandaController>(
                    builder: (controller) {
                      return ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.category.length,
                        padding: EdgeInsets.symmetric(horizontal: 25.w),
                        itemBuilder: (context, index) {
                          final category = controller.category[index];
                          return ChipMenuComponent(
                            onTap: () {
                              controller.selectedcategory(category.toLowerCase());
                              controller.fetchMenuByCategory(
                                  controller.selectedcategory.value);
                              controller.update();
                            },
                            isSelected: controller.selectedcategory.value ==
                                category.toLowerCase(),
                            text: category,
                          );
                        },
                        separatorBuilder: (context, index) => 13.horizontalSpace,
                      );
                    },
                  ),
                ),
                SizedBox(height: 10.h),
                GetBuilder<BerandaController>(
                  builder: (controller) {
                    final currentCategory = controller.selectedcategory.value;
                    return Container(
                      width: 1.sw,
                      height: 35.h,
                      color: Colors.grey[100],
                      margin: EdgeInsets.only(bottom: 10.h),
                      child: SectionHeaderComponent(
                        title: currentCategory == 'all'
                            ? 'All Menu'
                            : currentCategory == 'makanan'
                                ? 'Makanan'
                                : currentCategory == 'minuman'
                                    ? 'Minuman'
                                    : 'Snack',
                        icon: currentCategory == 'all'
                            ? Icons.menu_book
                            : currentCategory == 'makanan'
                                ? Icons.food_bank
                                : currentCategory == 'minuman'
                                    ? Icons.local_drink
                                    : Icons.fastfood,
                      ),
                    );
                  },
                ),
                GetX<BerandaController>(
                  builder: (controller) {
                    final selected = controller.selectedcategory.value;
                    late final filteredMenu;
                    if (selected == 'all') {
                      filteredMenu = List.from(
                          controller.pisahMenu(controller.filteredList));
                    } else {
                      filteredMenu = List.from(controller.seleectedMenu);
                    }
                    return filteredMenu.isEmpty
                        ? Center(
                            child: Text(
                              'No menu available',
                              style:
                                  TextStyle(fontSize: 16.sp, color: Colors.grey),
                            ),
                          )
                        : selected == "all"
                            ? AllSectionComponent(filteredMenu: filteredMenu)
                            : FoodSectionComponent(filteredMenu: filteredMenu);
                  },
                ),
              ],
            ),
          ),
        ),

      ),
    );
  }
}
