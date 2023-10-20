import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iotdemoflutter/Core/appbar/common_appbar.dart';
import 'package:get/get.dart';
import '../../../../Core/common_ui/asset_widget/common_image_widget.dart';
import '../../../../Core/common_ui/common_button/common_button.dart';
import '../../../../Core/common_ui/text/app_text_widget.dart';
import '../../../../Core/theme/app_color_palette.dart';
import '../../../../Core/utils/common_string.dart';
import '../../../../Core/utils/image_resources.dart';
import '../../../Core/common_ui/common_loader/common_loader.dart';
import '../controller/profile_controller.dart';

class ProfileScreen extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: Colors.white,
          appBar: commonAppBarWidget(title: CommonString.profile),
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  children: [
                    SizedBox(height: 20.h),
                    userImageWidget(),
                    SizedBox(height: 20.h),
                    customTextWidget(
                        CommonString.username, controller.name.value),
                    SizedBox(height: 20.h),
                    customTextWidget(
                        CommonString.usersurname, controller.surname.value),
                    SizedBox(height: 20.h),
                    customTextWidget(
                        CommonString.email, controller.useremail.value),
                    SizedBox(height: 40.h),
                    bottomContainerWidget(),
                    SizedBox(height: 40.h),
                    deleteProfileButton()
                  ],
                ),
                CommonLoader(isLoading: controller.isShowLoader.value),
              ],
            ),
          ),
        ));
  }

  Widget userImageWidget() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50.r),
      child: Container(
        height: 100.h,
        width: 100.w,
        child: AssetWidget(
            asset: Asset(
                type: AssetType.png, path: ImageResource.userplaceholder)),
      ),
    );
  }

  Widget customTextWidget(String title, String subTitle) {
    return Container(
        decoration: categioryDecoration(isSelected: false),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              AppTextWidget(
                text: title,
                style: CustomTextTheme.categoryText(color: Colors.black),
              ).paddingOnly(left: 10.w),
              SizedBox(height: 5.h),
              AppTextWidget(
                      text: subTitle,
                      style: CustomTextTheme.normalText(
                          color: lightColorPalette.black))
                  .paddingOnly(left: 10.w, right: 10.w),
              SizedBox(height: 10.h),
            ],
          ),
        )).paddingSymmetric(horizontal: 16.w);
  }

  Widget bottomContainerWidget() {
    return Container(
      height: 1.h,
      color: lightColorPalette.greyBg,
    ).paddingOnly(left: 16.w, right: 16.w);
  }

  Widget deleteProfileButton() {
    return commonButtonWithBorder(
            commonButtonBottonText: CommonString.deleteAccount, onPress: () {})
        .paddingSymmetric(horizontal: 16.w);
  }
}
