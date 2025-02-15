import 'package:flutter/material.dart';
import 'package:venturo_java_code/features/beranda/sub_features/detail_katalog/controllers/beranda_detail_katalog_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:venturo_java_code/shared/widgets/custom_text_field_widget.dart';

class CatatanComponent extends StatelessWidget {
  const CatatanComponent({super.key});

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
            "Catatan",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 16.0),
          SizedBox(
            height: 50.h,
            child: CustomTextFieldWidget(
              controller: BerandaDetailKatalogController.to.controller,
              label: "Catatan",
            ),
          )
        ],
      ),
    );
  }
}
