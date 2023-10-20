import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:iotdemoflutter/features/devices/provider/device_provider.dart';
import 'package:get/get.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wifi_iot/wifi_iot.dart';

import '../../../Core/Firebase/devices_list.dart';
import '../../../Core/common_ui/snackbar/snackbar.dart';
import '../../../Core/utils/common_string.dart';
class DeviceController extends GetxController {
  TextEditingController deviceNameController = TextEditingController();
  TextEditingController deviceIdController = TextEditingController();
  var deviceNameFocusNode = FocusNode().obs;
  var deviceIdFocusNode = FocusNode().obs;
  bool singleTap = false;
  DeviceProvider deviceProvider = DeviceProvider();
  RxBool isUpdate = false.obs;
  RxInt selectedIndex = 0.obs;

  RxList<DevicesList> deviceList = <DevicesList>[].obs;
  RxBool isShowLoader = false.obs;


  @override
  void onInit() {
    addFocusListeners();
    getDevices();
    super.onInit();
  }

  setShowLoader({required bool value}) {
    isShowLoader.value = value;
    isShowLoader.refresh();
  }

  void addDevice() async {
    setShowLoader(value: true);
    DocumentReference? response = await deviceProvider.addDeviceList(
        devicename: deviceNameController.text,
        deviceid: deviceIdController.text);
    setShowLoader(value: false);
    print("Here is response data $response");
    if (response != null) {
      emptyTextFieldsData();
      Get.back();
      getDevices();
    }
  }

  void updateDevice() async {
    setShowLoader(value: true);
    DocumentReference? response = await deviceProvider.updateDevice(
        devicename: deviceNameController.text,
        deviceid: deviceIdController.text,
        deviceUid: deviceList.value[selectedIndex.value].uid ?? "");
    setShowLoader(value: false);
    emptyTextFieldsData();
    Get.back();
    getDevices();
  }

  void getDevices() async {
    setShowLoader(value: true);
    QuerySnapshot? response = await deviceProvider.getAllDevices();
    setShowLoader(value: false);
    List<QueryDocumentSnapshot>? docs = await response?.docs;
    final data = docs?.map((doc) => DevicesList.fromJson(doc.data())).toList();
    deviceList.value = data ?? [];
  }



  deviceValidation() async {
    if (!singleTap) {
      if (deviceNameController.text.isEmpty) {
        snackbar(Validations.enterdevicename.tr);
      } else if (deviceIdController.text.isEmpty) {
        snackbar(Validations.enterdeviceid.tr);
      } else {
        if (isUpdate.value) {
          updateDevice();
        } else {
          addDevice();
        }
      }
      singleTap = true;
      Future.delayed(const Duration(seconds: 3))
          .then((value) => singleTap = false);
    }
  }

  emptyTextFieldsData() {
    deviceNameController.text = "";
    deviceIdController.text = "";
  }

  void addTextFieldData(int index) {
    isUpdate.value = true;
    selectedIndex.value = index;
    deviceNameController.text = deviceList[index].devicename ?? "";
    deviceIdController.text = deviceList[index].deviceid ?? "";
  }

  addFocusListeners() {
    deviceNameFocusNode.value.addListener(() {
      deviceNameFocusNode.refresh();
    });
    deviceIdFocusNode.value.addListener(() {
      deviceIdFocusNode.refresh();
    });
  }

  disposeFocusListeners() {
    deviceNameFocusNode.value.removeListener(() {});
    deviceIdFocusNode.value.removeListener(() {});
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


}
class WifiNetwork {
  final String ssid;
  final String bssid;
  final int level;
  final int frequency;
  final String capabilities;

  WifiNetwork({
    required this.ssid,
    required this.bssid,
    required this.level,
    required this.frequency,
    required this.capabilities,
  });

  bool get isOpenNetwork => capabilities.contains("WEP") || capabilities.contains("WPA");

  @override
  String toString() {
    return 'SSID: $ssid, BSSID: $bssid, Signal Strength: $level, Frequency: $frequency, Capabilities: $capabilities';
  }
}