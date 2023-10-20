import 'dart:io';

import 'package:dio/dio.dart';
import 'package:esp_smartconfig/esp_smartconfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:iotdemoflutter/Core/common_ui/snackbar/snackbar.dart';
import 'package:get/get.dart';
import 'package:iotdemoflutter/Core/utils/Routes.dart';

import 'package:loggerx/loggerx.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../Core/utils/common_string.dart';
import 'package:http/http.dart' as http;
class WifiLoginController extends GetxController {
  RxBool isLoginViewHiden = true.obs;
  TextEditingController wifiNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var wifiNameFocusNode = FocusNode().obs;
  var passwordFocusNode = FocusNode().obs;
  bool singleTap = false;
  RxBool passwordVisibility = false.obs;
  RxList wifiNetwork = [].obs;

  RxString wifiSsid = 'N/A'.obs;
  RxString bssid = 'N/A'.obs;
  var client = HttpClient();
  final flutterBlue = FlutterBlue.instance;
  BluetoothDevice? selectedDevice;


  passwordShowHide() {
    passwordVisibility.value = !passwordVisibility.value;
  }

  addFocusListeners() {
    wifiNameFocusNode.value.addListener(() {
      wifiNameFocusNode.refresh();
    });
    passwordFocusNode.value.addListener(() {
      passwordFocusNode.refresh();
    });
  }

  disposeFocusListeners() {
    wifiNameFocusNode.value.removeListener(() {});
    passwordFocusNode.value.removeListener(() {});
  }

  @override
  void onClose() {
    disposeFocusListeners();
    super.onClose();
  }

  @override
  void dispose() {
    disposeFocusListeners();
    super.dispose();
  }

  @override
  void onInit() {
    addFocusListeners();
    setNetwork();
    super.onInit();
  }

  Future<void> setNetwork() async {
    final info = NetworkInfo();
    var wifiName = await info.getWifiName();
    print('wifiName $wifiName');
    wifiNameController.text = wifiName!;
    var wifiBssid = await info.getWifiBSSID();
    print('wifiBssid $wifiBssid');
    bssid.value = wifiBssid!;
    var wifiIp = await info.getWifiIP();
    print('wifiIp $wifiIp');
  }

  getNearbyWifi() async {
    var locationStatus = await Permission.location.status;
    if (locationStatus.isDenied) {
      await Permission.locationWhenInUse.request();
      print("Here is qwwwer");
    } else if (await Permission.location.isRestricted) {
      openAppSettings();
    } else {
      setNetwork();
    }
  }

  validation() async {
    if (!singleTap) {
      if (wifiNameController.text.isEmpty) {
        snackbar(Validations.enterwifiname.tr);
      } else if (passwordController.text.isEmpty) {
        snackbar(Validations.enterwifipassword.tr);
      } else if (passwordController.text.length < 8) {
        snackbar(Validations.msgminwifipasswordatleast.tr);
      } else {

      }
      singleTap = true;
      Future.delayed(const Duration(seconds: 3))
          .then((value) => singleTap = false);
    }
  }

  gotoSignupScreen() {
    Get.toNamed(MyRoutes.signUpscreen);
  }

  gotoDashboardScreen() {
    Get.toNamed(MyRoutes.bottomtabscreen);
  }

}
