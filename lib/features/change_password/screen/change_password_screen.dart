import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iotdemoflutter/Core/appbar/common_appbar.dart';
import 'package:iotdemoflutter/Core/utils/common_string.dart';
import 'package:iotdemoflutter/features/change_password/controller/change_password_controller.dart';
import 'package:get/get.dart';

import '../../../Core/common_ui/common_button/common_button.dart';
import '../../../Core/common_ui/textfields/app_common_text_form_field.dart';
import '../../../Core/theme/app_color_palette.dart';

class ChangePasswordScreen extends GetView<ChangePasswordController> {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: commonAppBarWidget(title: CommonString.changePassword),
          body: Column(
            children: [
              SizedBox(height: 30.h),
              oldpasswordTextFieldWidget(),
              SizedBox(height: 20.h),
              newpasswordTextFieldWidget(),
              SizedBox(height: 20.h),
              confirmpasswordTextFieldWidget(),
              SizedBox(height: 40.h),
              changePasswordButtonWidget(),
            ],
          ),
        ));
  }

  Widget oldpasswordTextFieldWidget() {
    return commonPasswordText(
        title: CommonString.oldpassword.tr,
        passwordVisible: controller.oldpasswordVisibility.value,
        hint: CommonString.oldpasswordplaceholder.tr,
        controller: controller.oldpasswordController,
        focusNode: controller.oldpasswordFocusNode(),
        onPress: () {
          controller.oldPasswordShowHide();
        }).paddingOnly(left: 16.w, right: 16.w);
  }

  Widget newpasswordTextFieldWidget() {
    return commonPasswordText(
        title: CommonString.newpassword.tr,
        passwordVisible: controller.newpasswordVisibility.value,
        hint: CommonString.newpasswordplaceholder.tr,
        controller: controller.oldpasswordController,
        focusNode: controller.newpasswordFocusNode(),
        onPress: () {
          controller.newPasswordShowHide();
        }).paddingOnly(left: 16.w, right: 16.w);
  }

  Widget confirmpasswordTextFieldWidget() {
    return commonPasswordText(
            title: CommonString.confirmpassword.tr,
            passwordVisible: controller.confirmpasswordVisibility.value,
            hint: CommonString.confirmpasswordplaceholder.tr,
            controller: controller.confirmpasswordController,
            focusNode: controller.confirmpasswordFocusNode(),
            onPress: () {
              controller.confirmPasswordShowHide();
            })
        .paddingOnly(left: 16.w, right: 16.w);
  }

  Widget changePasswordButtonWidget() {
    return commonButtonWithBorder(
      onPress: () {
      },
      commonButtonBottonText: CommonString.changePassword.tr,
    ).paddingSymmetric(horizontal: 16.w);
  }
}
