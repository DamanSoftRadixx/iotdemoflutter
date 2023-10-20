import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iotdemoflutter/Core/common_ui/common_loader/common_loader.dart';
import 'package:get/get.dart';
import 'package:iotdemoflutter/Core/utils/common_string.dart';
import 'package:iotdemoflutter/Core/common_ui/asset_widget/common_image_widget.dart';
import 'package:iotdemoflutter/Core/common_ui/common_button/common_button.dart';
import 'package:iotdemoflutter/Core/common_ui/text/app_text_widget.dart';
import 'package:iotdemoflutter/Core/common_ui/textfields/app_common_text_form_field.dart';
import 'package:iotdemoflutter/Core/utils/image_resources.dart';

import '../../../../Core/theme/app_color_palette.dart';
import '../controller/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(height: 70.h),
                    topImageWidget(),
                    SizedBox(height: 20.h),
                    welcometitleTextWidget(),
                    SizedBox(height: 5.h),
                    filldetailTextWidget(),
                    SizedBox(height: 20.h),
                    emailTextFieldWidget(),
                    SizedBox(height: 20.h),
                    passwordTextFieldWidget(),
                    SizedBox(height: 40.h),
                    loginButtonWidget(),
                    SizedBox(height: 10.h),
                    signUpButtonWidget(),
                  ],
                ),
              ),
              CommonLoader(isLoading: controller.isShowLoader.value),
            ],
          ),
        )
    )
    );
  }

  Widget topImageWidget() {
    return AssetWidget(
      asset: Asset(type: AssetType.png, path: ImageResource.imgsmarthome),
      height: 150.h,
    );
  }

  Widget welcometitleTextWidget() {
    return Align(
      alignment: Alignment.topLeft,
      child: AppTextWidget(
        text: CommonString.login.tr,
        style: CustomTextTheme.heading1WithLetterSpacing(
          color: lightColorPalette.black,
        ),
      ).paddingOnly(left: 16.w),
    );
  }

  Widget filldetailTextWidget() {
    return Align(
      alignment: Alignment.centerLeft,
      child: AppTextWidget(
        text: CommonString.fillbelowDetail.tr,
        style: CustomTextTheme.subtext(color: Colors.black),
      ).paddingOnly(left: 16.w),
    );
  }

  Widget logintitleTextWidget() {
    return Align(
      alignment: Alignment.centerLeft,
      child: AppTextWidget(
        text: CommonString.loginsuccess.tr,
        style: CustomTextTheme.heading1(
          color: lightColorPalette.black,
        ),
      ).paddingOnly(left: 16.w),
    );
  }

  Widget emailTextFieldWidget() {
    return commonEmailTextFieldWidget(
            controller: controller.emailController,
            hint: CommonString.emailplaceholder.tr,
            title: CommonString.email.tr,
            focusNode: controller.emailFocusNode(),
            isShowCrossIcon: true)
        .paddingSymmetric(horizontal: 16.w);
  }

  Widget passwordTextFieldWidget() {
    return commonPasswordText(
        title: CommonString.password.tr,
        passwordVisible: controller.passwordVisibility.value,
        hint: CommonString.passwordplaceholder.tr,
        controller: controller.passwordController,
        focusNode: controller.passwordFocusNode(),
        onPress: () {
          controller.passwordShowHide();
        }).paddingOnly(left: 16.w, right: 16.w);
  }

  Widget loginButtonWidget() {
    return commonButtonWithBorder(
            onPress: () {
              controller.validation();
            },
            commonButtonBottonText: CommonString.login.tr)
        .paddingOnly(left: 16.w, right: 16.w);
  }

  Widget signUpButtonWidget() {
    return Container(
        child: Align(
      alignment: Alignment.center,
      child: InkWell(
        onTap: () => controller.gotoSignupScreen(),
        child: RichText(
          text: TextSpan(
            text: CommonString.newuser.tr,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
            children: <TextSpan>[
              TextSpan(
                  text: CommonString.signup.tr,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500)),
            ],
          ),
        ),
      ),
    ));
  }
}
