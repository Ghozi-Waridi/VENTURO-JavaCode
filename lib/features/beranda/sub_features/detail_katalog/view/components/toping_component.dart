import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:venturo_java_code/shared/styles/color_style.dart';

import '../../controllers/beranda_detail_katalog_controller.dart';

class TopingComponent extends StatelessWidget {
  const TopingComponent({
    super.key,
  });

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
            "Pilih Topping",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 16.0),
          Obx(() {
            if (BerandaDetailKatalogController.to.detailMenu == null) {
              return Center(child: Text("Tidak memiliki Topping"));
            }
            return SizedBox(
              height: 50.h,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: NeverScrollableScrollPhysics(),
                itemCount: BerandaDetailKatalogController
                        .to.detailMenu?.topping.length ??
                    0,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: ChoiceChip(
                      label: Text(
                        BerandaDetailKatalogController
                            .to.detailMenu!.topping[index].keterangan!,
                        style: TextStyle(
                          color:
                              BerandaDetailKatalogController.to.topping.value ==
                                      BerandaDetailKatalogController
                                          .to
                                          .detailMenu!
                                          .topping[index]
                                          .keterangan!
                                  ? Colors.white
                                  : Colors.black,
                        ),
                      ),
                      selected:
                          BerandaDetailKatalogController.to.topping.value ==
                              BerandaDetailKatalogController
                                  .to.detailMenu!.topping[index].keterangan!,
                      onSelected: (bool selected) {
                        if (selected) {
                          BerandaDetailKatalogController.to.topping(
                              BerandaDetailKatalogController
                                  .to.detailMenu!.topping[index].keterangan!);
                        }
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide(
                          color:
                              BerandaDetailKatalogController.to.topping.value ==
                                      BerandaDetailKatalogController
                                          .to
                                          .detailMenu!
                                          .topping[index]
                                          .keterangan!
                                  ? ColorStyle.primary
                                  : Colors.grey,
                          width: 1.0,
                        ),
                      ),
                      backgroundColor:
                          Colors.white, // Warna latar belakang saat unselected
                      selectedColor: ColorStyle.primary.withOpacity(
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
