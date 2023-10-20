
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iotdemoflutter/Core/utils/common_string.dart';
import 'package:iotdemoflutter/Core/theme/app_color_palette.dart';
import 'package:iotdemoflutter/features/Settings/screen/setting_screen.dart';
import 'package:iotdemoflutter/features/bottom_tabs/controller/bottom_tab_controller.dart';
import 'package:iotdemoflutter/features/devices/screen/device_screen.dart';
import 'package:get/get.dart';

import '../../profile/screen/profile_screen.dart';


class BottomTabScreen extends GetView<BottomTabController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        final currentIndex = controller.currentIndex.value;
        return IndexedStack(
          index: currentIndex,
          children: [
            DeviceScreen(),
            SettingScreen(),
          ],
        );
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: Obx(() {
        final currentIndex = controller.currentIndex.value;
        return BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 6.0,
          currentIndex: currentIndex,
          selectedItemColor: lightColorPalette.black,
          unselectedItemColor: lightColorPalette.grey,
          iconSize: 24.h,
          onTap: (index) => controller.changeTabIndex(index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.connected_tv,),
              label: CommonString.devices,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: CommonString.settings,
            ),
          ],
        );
      }),
    );
  }
}