import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import '../../controllers/beranda_detail_katalog_controller.dart';
import '../../../../../../shared/styles/color_style.dart';

class LevelComponent extends StatelessWidget {
  const LevelComponent({super.key});

  //final MenuDetailModel? menuModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            "Pilih Level",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 16.0),
          Obx(() {
            if (BerandaDetailKatalogController.to.detailMenu == null) {
              return Center(child: Text("Tidak memiliki Level"));
            }
            return SizedBox(
              height: 50.h,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: NeverScrollableScrollPhysics(),
                itemCount: BerandaDetailKatalogController
                        .to.detailMenu.value?.level.length ??
                    0,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: ChoiceChip(
                      label: Text(
                        BerandaDetailKatalogController
                            .to.detailMenu.value!.level[index].keterangan!,
                        style: TextStyle(
                          color:
                              BerandaDetailKatalogController.to.level.value ==
                                      BerandaDetailKatalogController.to
                                          .detailMenu.value!.level[index].keterangan!
                                  ? Colors.white
                                  : Colors.black,
                        ),
                      ),
                      selected: BerandaDetailKatalogController.to.level.value ==
                          BerandaDetailKatalogController
                              .to.detailMenu.value!.level[index].keterangan!,
                      onSelected: (bool selected) {
                        if (selected) {
                          BerandaDetailKatalogController.to.level(
                              BerandaDetailKatalogController
                                  .to.detailMenu.value!.level[index].keterangan!);
                        }
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(20.0),
                        side: BorderSide(
                          color: BerandaDetailKatalogController
                                      .to.level.value ==
                                  BerandaDetailKatalogController
                                      .to.detailMenu.value!.level[index].keterangan!
                              ? ColorStyle.primary 
                              : Colors.grey,
                          width: 1.0,
                        ),
                      ),
                      backgroundColor:
                          Colors.white, // Warna latar belakang saat unselected
                      selectedColor: Colors.blue.withOpacity(
                          0.5), // Warna latar belakang saat selected (transparan)
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0), // Padding di dalam chip
                      materialTapTargetSize: MaterialTapTargetSize
                          .shrinkWrap, // Agar ukuran tap area sesuai dengan chip
                    ),
                  );
                },
              ),
            );
          })
        ],
      ),
    );
  }
}
