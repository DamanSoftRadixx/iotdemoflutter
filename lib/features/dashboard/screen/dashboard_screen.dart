import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iotdemoflutter/Core/appbar/common_appbar.dart';
import 'package:iotdemoflutter/Core/utils/common_string.dart';
import 'package:iotdemoflutter/Core/common_ui/text/app_text_widget.dart';
import 'package:iotdemoflutter/Core/theme/app_color_palette.dart';
import 'package:iotdemoflutter/features/dashboard/controller/dashboard_controller.dart';
import 'package:get/get.dart';

import '../../../Core/common_ui/common_button/animated_toggle_button.dart';
import '../../../Core/theme/theme_color.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      backgroundColor: controller.isDarkMode.value
          ? lightMode.backgroundColor
          : darkMode.backgroundColor,
      appBar: commonAppBarWidget(title: CommonString.appName,isBack: true),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 80.h),
            customAnimationContainerWidget(),
            SizedBox(height: 20.h),
            titleTextWidget(),
            SizedBox(height: 20.h),
            customToggleButtonWidget(),
            SizedBox(height: 50.h),
          ],
        ),
      ),
    ));
  }

  Widget titleTextWidget() {
    return AppTextWidget(
      text: controller.devicename.value,
      style: CustomTextTheme.heading1(
        color: controller.isDarkMode.value
            ? darkMode.backgroundColor
            : lightMode.backgroundColor,
      ),
    );
  }

  customToggleButtonWidget() {
    return AnimatedToggle(
      values: [CommonString.on, CommonString.off],
      textColor: controller.isDarkMode.value
          ? lightMode.textColor
          : darkMode.textColor,
      backgroundColor: controller.isDarkMode.value
          ? lightMode.toggleBackgroundColor
          : darkMode.toggleBackgroundColor,
      buttonColor: controller.isDarkMode.value
          ? lightMode.toggleButtonColor
          : darkMode.toggleButtonColor,
      shadows: controller.isDarkMode.value ? lightMode.shadow : darkMode.shadow,
      onToggleCallback: (index) {
        controller.changeThemeMode();
      }, initialPosition: controller.isDarkMode.value,
    );
  }

  Widget customAnimationContainerWidget() {
    double width = MediaQuery.of(Get.context!).size.width;
    double height = MediaQuery.of(Get.context!).size.height;
    return Stack(
      children: <Widget>[
        Container(
          width: width * 0.35,
          height: width * 0.35,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: controller.isDarkMode.value
                  ? lightMode.gradient
                  : darkMode.gradient,
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(40, 0),
          child: ScaleTransition(
            scale: controller.animationController.drive(
              Tween<double>(begin: 0.0, end: 1.0).chain(
                CurveTween(curve: Curves.decelerate),
              ),
            ),
            alignment: Alignment.topRight,
            child: Container(
              width: width * 0.26,
              height: width * 0.26,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: controller.isDarkMode.value
                    ? lightMode.backgroundColor
                    : darkMode.backgroundColor,
              ),
            ),
          ),
        ),
      ],
    );
  }

}
