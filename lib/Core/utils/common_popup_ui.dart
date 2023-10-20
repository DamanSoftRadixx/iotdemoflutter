import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../common_ui/common_button/custom_icon_button.dart';
import '../common_ui/text/app_text_widget.dart';
import '../theme/app_color_palette.dart';

Future<void> showCommonAlertWithTwoActionsDialog(
    {required String title,
    required String subHeader,
    String? leftButtonTitle,
    String? rightButtonTitle,
    required Function() noPressed,
    required Function() yesPressed}) async {
  // Get.back(closeOverlays: true);
  showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(10.0.r)), //this right here
                child: SizedBox(
                  width: 1.sw,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AppTextWidget(
                              textAlign: TextAlign.center,
                              style: CustomTextTheme.heading2(
                                  color: lightColorPalette.black),
                              text: title,
                            ).paddingOnly(bottom: 12.h, top: 10.h),
                            AppTextWidget(
                              textAlign: TextAlign.center,
                              style: CustomTextTheme.bottomTabs(
                                  height: 1.5, color: lightColorPalette.grey),
                              text: subHeader,
                            ).paddingOnly(bottom: 12.h),
                          ],
                        ).paddingOnly(left: 16.w, right: 16.w),
                      ),
                      Container(
                        width: 1.sw,
                        height: 0.6.h,
                        color: lightColorPalette.grey,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: CustomTapState(
                            onTap: noPressed,
                            child: Container(
                              child: Center(
                                child: AppTextWidget(
                                  style: CustomTextTheme.heading2(
                                      color: lightColorPalette.redDark),
                                  text: leftButtonTitle ?? "No",
                                ),
                              ),
                            ),
                          )),
                          Container(
                            width: 0.6.w,
                            height: 50.h,
                            color: lightColorPalette.grey,
                          ),
                          Expanded(
                              child: CustomTapState(
                            onTap: yesPressed,
                            child: Container(
                              child: Center(
                                child: AppTextWidget(
                                  style: CustomTextTheme.heading2(
                                      color: lightColorPalette.black),
                                  text: rightButtonTitle ?? "Yes",
                                ),
                              ),
                            ),
                          ))
                        ],
                      )
                    ],
                  ).paddingOnly(top: 12.h),
                ),
              ),
            ],
          ),
        );
      });
}
