import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:venturo_java_code/features/log_in/controllers/log_in_controller.dart';
import 'package:venturo_java_code/shared/widgets/custom_text_field_widget.dart';

class FormLoginComponent extends StatelessWidget {
  const FormLoginComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        key: LogInController.to.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextFieldWidget(
              inputType: TextInputType.emailAddress,
              label: "Alamat Email",
              hint: "Masukkan Alamat Email",
              obscureText: false,
              controller: LogInController.to.emailController,
              errorMessage: "Email tidak boleh kosong",
            ),
            SizedBox(
              height: 40.h,
            ),
            Obx(
              () => CustomTextFieldWidget(
                inputType: TextInputType.visiblePassword,
                label: "Kata Sandi",
                hint: "Masukkan Kata Sandi",
                obscureText: LogInController.to.isObscure.value,
                controller: LogInController.to.passwordController,
                errorMessage: "Kata sandi tidak boleh kosong",
                suffixIcon: GestureDetector(
                  onTap: () => LogInController.to.showPasword(),
                  child: Align(
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: Icon(
                      LogInController.to.isObscure.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
