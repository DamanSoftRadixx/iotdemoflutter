import 'package:flutter/material.dart';
import 'package:iotdemoflutter/Core/common_ui/text/app_text_widget.dart';
import 'package:iotdemoflutter/Core/theme/app_color_palette.dart';
import 'package:get/get.dart';

snackbar(String message) {
  return Get.snackbar(
    "",
    message,
    titleText: Container(),
    messageText: AppTextWidget(
      style: CustomTextTheme.normalText(
          color: lightColorPalette.whiteColorPrimary.shade900),
      text: message,
    ),
    backgroundColor: lightColorPalette.black,
    borderRadius: 10,
    margin: const EdgeInsets.all(10),
    duration: const Duration(seconds: 3),
    isDismissible: true,
    snackPosition: SnackPosition.BOTTOM,
    dismissDirection: DismissDirection.endToStart,
    forwardAnimationCurve: Curves.linearToEaseOut,
  );
}
