import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:venturo_java_code/configs/routes/route.dart';
import 'package:venturo_java_code/features/log_in/repositories/log_in_repository.dart';
import 'package:venturo_java_code/shared/controllers/Global_Controller.dart';

import '../../../constants/Cores/API/api_constant.dart';
import '../../../shared/styles/color_style.dart';
import '../../../shared/styles/google_text_style.dart';

class LogInController extends GetxController {
  static LogInController get to => Get.find();

  final formKey = GlobalKey<FormState>();
  RxBool isObscure = true.obs;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  late final LogInRepository _repository;
  var isLoggedIn = false.obs;

  @override
  void onInit() {
    super.onInit();
    _repository = LogInRepository();
  }

  void showPasword() {
    isObscure.value = !isObscure.value;
  }

  void validateForm(context) async {
    //print("Validating Form");

    await GlobalController.to.checkConnection();
    final isValid = formKey.currentState!.validate();
    Get.focusScope!.unfocus();

    if (isValid && GlobalController.to.isConnect.value) {
      EasyLoading.show(
        status: "Sedang Diproses...",
        maskType: EasyLoadingMaskType.black,
        dismissOnTap: false,
      );

      try {
        final response = await _repository.login(
          email: emailController.text,
          password: passwordController.text,
        );

        //print('Response User: ${response.nama}');

        if (response != null) {
          EasyLoading.dismiss();
          _showErrorDialog(context,"Berhasil Login");
          isLoggedIn.value = true;
          Get.offAllNamed(Routes.bottomNavigationRoute);
        } else {
          EasyLoading.dismiss();
          //print("Login Gagal");
          _showErrorDialog(context, "sandi salah");
        }
      } catch (e) {
        EasyLoading.dismiss();
        //print("Login Gagal: $e");
        _showErrorDialog(context, "Login Gagal");
      }
    } else if (GlobalController.to.isConnect.value == false) {
      Get.offAllNamed(Routes.noConnection);
    }
  }

  void logout() {
    isLoggedIn.value = false; 
  }

  void _showErrorDialog(BuildContext context, String message) {
    PanaraInfoDialog.show(
      context,
      title: "Warning",
      message: message,
      buttonText: "Coba Lagi",
      onTapDismiss: () {
        Get.back();
      },
      panaraDialogType: PanaraDialogType.warning,
      barrierDismissible: false,
    );
  }

  void flavorSettings() {
    Get.bottomSheet(Obx(() => Wrap(
          children: [
            Container(
              width: double.infinity.w,
              padding: EdgeInsets.symmetric(
                horizontal: 5.w,
                vertical: 5.h,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: ColorStyle.white,
              ),
              child: Column(
                children: [
                  ListTile(
                    onTap: () {
                      GlobalController.to.isStaging.value = false;
                      GlobalController.to.baseUrl = ApiConstant.production;
                    },
                    title: Text(
                      "Production",
                      style: GoogleTextStyle.fw400.copyWith(
                          color: GlobalController.to.isStaging.value
                              ? ColorStyle.dark2
                              : ColorStyle.primary,
                          fontSize: 14.sp),
                    ),
                    trailing: GlobalController.to.isStaging == true
                        ? null
                        : Icon(
                            Icons.check,
                            color: ColorStyle.primary,
                            size: 14.sp,
                          ),
                  ),
                  Divider(
                    height: 1.h,
                  ),
                  ListTile(
                      onTap: () {
                        GlobalController.to.isStaging.value == true;
                        GlobalController.to.baseUrl = ApiConstant.staging;
                      },
                      title: Text("Staging",
                          style: GoogleTextStyle.fw400.copyWith(
                            color: GlobalController.to.isStaging == true
                                ? ColorStyle.primary
                                : ColorStyle.dark2,
                            fontSize: 14.sp,
                          )),
                      trailing: GlobalController.to.isStaging == true
                          ? Icon(
                              Icons.check,
                              color: ColorStyle.primary,
                              size: 14.sp,
                            )
                          : null)
                ],
              ),
            )
          ],
        )));
  }
}
