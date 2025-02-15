import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:venturo_java_code/constants/Icons/Icon_constants.dart';
import 'package:venturo_java_code/constants/Image/Image_constant.dart';
import 'package:venturo_java_code/features/log_in/constants/log_in_assets_constant.dart';
import 'package:venturo_java_code/features/log_in/controllers/log_in_controller.dart';
import 'package:venturo_java_code/features/log_in/view/components/form_login_component.dart';
import 'package:venturo_java_code/shared/styles/color_style.dart';
import 'package:venturo_java_code/shared/styles/google_text_style.dart';
import 'package:venturo_java_code/shared/widgets/custom_Button_widget.dart';
import 'package:venturo_java_code/shared/widgets/primary_button_widget.dart';


class LogInScreen extends StatelessWidget {
  LogInScreen({Key? key}) : super(key: key);

  final assetsConstant = LogInAssetsConstant();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(45),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 100.h,
              ),
              GestureDetector(
                onDoubleTap: () => LogInController.to.flavorSettings(),
                child: Image.asset(
                  ImageConstant.logo,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: 121.h,
              ),
              Text(
                "Masuk untuk melanjutkan!",
                style: GoogleTextStyle.fw600.copyWith(
                  fontSize: 24.sp,
                  color: ColorStyle.dark,
                ),
                // textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30.h,
              ),
              const FormLoginComponent(),
              SizedBox(
                height: 40.h,
              ),
              PrimaryButtonWidget(
                label: "Masuk",
                onPressed: () => LogInController.to.validateForm(context),
              ),
              SizedBox(
                height: 40.h,
              ),
              Row(
                children: [
                  const Expanded(child: Divider(thickness: 1)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Text(
                      'atau',
                      style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                    ),
                  ),
                  const Expanded(child: Divider(thickness: 1)),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomButtonWidget(
                label: "Masuk dengan Google",
                onPressed: () {},
                color: Colors.white,
                rounded: 20,
                textColor: Colors.black,
              ),
              CustomButtonWidget(
                label: "Masuk dengan Apple",
                onPressed: () {},
                color: Colors.black,
                rounded: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
