import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iotdemoflutter/Core/utils/Routes.dart';
import 'package:iotdemoflutter/features/Settings/controller/setting_controller.dart';
import 'package:get/get.dart';
import '../../../Core/common_ui/asset_widget/common_image_widget.dart';
import '../../../Core/common_ui/common_button/common_button.dart';
import '../../../Core/common_ui/text/app_text_widget.dart';
import '../../../Core/theme/app_color_palette.dart';
import '../../../Core/utils/common_string.dart';
import '../../../Core/utils/image_resources.dart';

class SettingScreen extends StatelessWidget {
  SettingController settingController = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          settingTextWidget(),
          customGridView(),
        ],
      )),
    );
  }

  Widget customGridView() {
    return Padding(
      padding: EdgeInsets.all(10.0.w),
      child: GridView(
        shrinkWrap: true,
        physics: RangeMaintainingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        scrollDirection: Axis.vertical,
        children: [
          InkWell(
            onTap: () {
              settingController.goToProfileScreen();
            },
            child: gridTileView(
              title: CommonString.profile,
              icon: ImageResource.icnuser,
            ),
          ),
          InkWell(
            onTap: (){
Get.toNamed(MyRoutes.wifiloginscreen);
            },
            child: gridTileView(
                title: CommonString.wifiSetting, icon: ImageResource.wifi),
          ),
          InkWell(
              onTap: () {
                settingController.gotoChangePasswordScreen();
              },
              child: gridTileView(
                title: CommonString.changePassword,
                icon: ImageResource.icnlock,
              )),
          InkWell(
            onTap: () => logoutPopup(),
            child: gridTileView(
                title: CommonString.logout, icon: ImageResource.icnlogout),
          ),
        ],
      ),
    );
  }

  Widget settingTextWidget() {
    return Align(
      alignment: Alignment.topLeft,
      child: AppTextWidget(
        text: CommonString.settings.tr,
        style: CustomTextTheme.heading1WithLetterSpacing(
          color: lightColorPalette.black,
        ),
      ).paddingOnly(left: 16.w),
    );
  }

  Widget gridTileView({required String title, required String icon}) {
    return Card(
      child: GridTile(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AssetWidget(
            asset: Asset(type: AssetType.png, path: icon),
            height: 70.h,
            width: 70.w,
          ),
          SizedBox(
            height: 10.h,
          ),
          AppTextWidget(
            text: title,
            style: CustomTextTheme.heading2(
              color: lightColorPalette.black,
            ),
          ),
        ],
      )),
    );
  }

  Widget logoutTextWidget() {
    return AppTextWidget(
      text: CommonString.logout.tr,
      style: CustomTextTheme.heading3(color: lightColorPalette.black),
    );
  }

  Widget logoutMsgTextWidget() {
    return AppTextWidget(
      text: CommonString.logoutmsg,
      style: CustomTextTheme.normalText(color: lightColorPalette.black),
    );
  }

  Widget noButtonWidget() {
    return commonButtonWithBorder(
        onPress: () {
          Get.back();
        },
        commonButtonBottonText: CommonString.no.tr,
        bgColor: lightColorPalette.transparentColor,
        textColor: lightColorPalette.black);
  }

  Widget yesButtonWidget() {
    return commonButtonWithBorder(
        onPress: () {
          settingController.logout();
        },
        commonButtonBottonText: CommonString.yes.tr);
  }

  logoutPopup() {
    Get.dialog(
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Material(
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        logoutTextWidget(),
                        const SizedBox(height: 15),
                        logoutMsgTextWidget(),
                        SizedBox(height: 20.h),
                        //Buttons
                        Row(
                          children: [
                            Expanded(
                              child: noButtonWidget(),
                            ),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: yesButtonWidget(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
