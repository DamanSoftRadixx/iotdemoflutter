import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iotdemoflutter/Core/appbar/common_appbar.dart';
import 'package:iotdemoflutter/Core/common_ui/common_loader/common_loader.dart';
import 'package:iotdemoflutter/Core/utils/common_string.dart';
import 'package:iotdemoflutter/Core/common_ui/textfields/app_common_text_form_field.dart';
import 'package:iotdemoflutter/Core/theme/app_color_palette.dart';
import 'package:iotdemoflutter/Core/utils/Routes.dart';
import 'package:iotdemoflutter/features/devices/controller/device_controller.dart';
import 'package:get/get.dart';

import '../../../Core/common_ui/asset_widget/common_image_widget.dart';
import '../../../Core/common_ui/common_button/common_button.dart';
import '../../../Core/common_ui/text/app_text_widget.dart';
import '../../../Core/utils/image_resources.dart';

class DeviceScreen extends StatelessWidget {
  var controller = Get.put(DeviceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          commonAppBarWidget(title: CommonString.devices, isShowBacIcon: false),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: lightColorPalette.black,
        onPressed: () {
          controller.isUpdate.value = false;
          controller.emptyTextFieldsData();
          addDeviceNetwork(title: CommonString.addDevice);
        },
      ),
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 10.h),
              noOfDeviceTextWidget(),
              SizedBox(height: 10.h),
              deviceListViewWidget(),
            ],
          ),
          CommonLoader(isLoading: controller.isShowLoader.value),
        ],
      ),
    );
  }

  Widget deviceListViewWidget() {
    return Expanded(
      child: ListView.builder(
          padding: EdgeInsets.zero,
          physics: const RangeMaintainingScrollPhysics(),
          itemCount: controller.deviceList.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Get.toNamed(MyRoutes.dashboardscreen, arguments: {
                  "uid": controller.deviceList[index].uid,
                  "status": controller.deviceList[index].status,
                  "devicename": controller.deviceList[index].devicename,
                });
              },
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 12.h),
                        child: Card(
                          color: Colors.grey[200],
                          margin: EdgeInsets.zero,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0.r),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 6.h, horizontal: 6.w),
                            child: leftImageWidget(),
                          ),
                        ),
                      ),
                      SizedBox(width: 18.w),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 13.h),
                              child: titleTextWidget(
                                  title:
                                      controller.deviceList[index].devicename ??
                                          ""),
                            ),
                            SizedBox(height: 4.h),
                            subTitleTextWidget(
                                subTitle:
                                    controller.deviceList[index].deviceid ??
                                        ""),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),
                      rightImageWidget(selectedIndex: index),
                    ],
                  ).paddingOnly(left: 17.w, right: 17.w),
                  SizedBox(height: 10.h),
                  bottomViewWidget(color: Colors.grey[300])
                      .paddingOnly(left: 17.w, right: 17.w),
                ],
              ),
            );
          }),
    );
  }

  Widget leftImageWidget() {
    return AssetWidget(
      asset: Asset(type: AssetType.png, path: ImageResource.icnbulb),
      height: 34.h,
      width: 34.w,
    );
  }

  Widget rightImageWidget({required int selectedIndex}) {
    return Center(
      child: InkWell(
        onTap: () {
          controller.addTextFieldData(selectedIndex);
          addDeviceNetwork(title: CommonString.editDevice);
        },
        child: AssetWidget(
          asset: Asset(type: AssetType.png, path: ImageResource.icnedit),
          height: 20.h,
          width: 20.w,
        ),
      ),
    );
  }

  Widget noOfDeviceTextWidget() {
    return Align(
      alignment: Alignment.topLeft,
      child: AppTextWidget(
        text: CommonString.noOfDevice,
        style: CustomTextTheme.heading1(color: lightColorPalette.black),
      ),
    ).paddingOnly(left: 16.w);
  }

  Widget titleTextWidget({required String title}) {
    return AppTextWidget(
      text: title,
      style: CustomTextTheme.normalTextWithWeight600(
          color: lightColorPalette.black),
    );
  }

  Widget subTitleTextWidget({required String subTitle}) {
    return AppTextWidget(
      text: subTitle,
      style: CustomTextTheme.bottomTabs(color: lightColorPalette.grey),
    );
  }

  Widget bottomViewWidget({required Color? color}) {
    return Container(
      height: 1,
      width: 1.sw,
      color: color,
    );
  }

  Widget deviceNameTextFieldWidget() {
    return commonTextFieldWidget(
      controller: controller.deviceNameController,
      title: CommonString.deviceName.tr,
      hint: CommonString.devicenameplaceholder,
      focusNode: controller.deviceNameFocusNode.value,
    );
  }

  Widget deviceIdTextFieldWidget() {
    return commonTextFieldWidget(
      controller: controller.deviceIdController,
      title: CommonString.deviceId.tr,
      hint: CommonString.deviceidplaceholder,
      focusNode: controller.deviceIdFocusNode.value,
    );
  }

  Widget cancelButtonWidget() {
    return commonButtonWithBorder(
        onPress: () {
          Get.back();
        },
        commonButtonBottonText: CommonString.cancel.tr,
        bgColor: lightColorPalette.transparentColor,
        textColor: lightColorPalette.black);
  }

  Widget addButtonWidget() {
    return commonButtonWithBorder(
        onPress: () {
          controller.deviceValidation();
        },
        commonButtonBottonText: CommonString.save.tr);
  }

  Widget addDeviceTextWidget(String title) {
    return AppTextWidget(
      text: title,
      style: CustomTextTheme.heading2(color: lightColorPalette.black),
    );
  }

  addDeviceNetwork({required String title}) {
    Get.dialog(Obx(
      () => Stack(
        children: [
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
                            addDeviceTextWidget(title),
                            const SizedBox(height: 15),
                            deviceNameTextFieldWidget(),
                            const SizedBox(height: 15),
                            deviceIdTextFieldWidget(),
                            SizedBox(height: 20.h),
                            //Buttons
                            Row(
                              children: [
                                Expanded(
                                  child: cancelButtonWidget(),
                                ),
                                SizedBox(width: 10.w),
                                Expanded(
                                  child: addButtonWidget(),
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
          CommonLoader(isLoading: controller.isShowLoader.value),
        ],
      ),
    ));
  }
}
