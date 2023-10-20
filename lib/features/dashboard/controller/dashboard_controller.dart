import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/animation.dart';
import 'package:iotdemoflutter/features/devices/provider/device_provider.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class DashboardController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxBool isDarkMode = false.obs;
  var deviceModel = Get.arguments;
  RxString devicename = "".obs;
  String lightStatus = "";

  final Duration duration = const Duration(milliseconds: 600);

  late AnimationController animationController;
  DeviceProvider deviceProvider = DeviceProvider();
  final dio = Dio();
  final String esp32IpAddress = '192.168.140.104';

  @override
  void onInit() {
    animationController = AnimationController(vsync: this, duration: duration);
    isDarkMode.value = deviceModel["status"];
    devicename.value = deviceModel["devicename"];
    print(isDarkMode.value);
    if (isDarkMode.value) {
      lightStatus = "on";
      animationController.reverse(from: 1.0);
    } else {
      lightStatus = "off";
      animationController.forward(from: 0.0);
    }
    toggleLight(lightStatus);
    super.onInit();
  }

  Future<void> toggleLight(String state) async {
    try {
      final response = await http.get(Uri.http(esp32IpAddress, '/toggle', {'state': state}));
      print("Here is response ${response.statusCode}");

      if (response.statusCode == 200) {
        print('Light is $state');
      } else {
        print('Failed to toggle light');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  updateLightStatus() async {
    await deviceProvider.updateDeviceStatus(
        status: isDarkMode.value, deviceUid: deviceModel["uid"]);
  }

  gobackDeviceScreen() {}

  changeThemeMode() {
    isDarkMode.value = !isDarkMode.value;
    if (isDarkMode.value) {
      animationController.reverse(from: 1.0);
      lightStatus = "on";
    } else {
      animationController.forward(from: 0.0);
      lightStatus = "off";
    }
    toggleLight(lightStatus);
    updateLightStatus();
  }
}

