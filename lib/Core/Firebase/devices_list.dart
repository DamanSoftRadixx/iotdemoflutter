import 'dart:ffi';

import 'package:flutter/material.dart';

class DevicesList {
  DevicesList({
      this.status, 
      this.deviceid, 
      this.devicename,this.uid});

  List<DevicesList>? devicesList;

  DevicesList.fromJson(dynamic json) {
    status = json['status'];
    deviceid = json['deviceid'];
    devicename = json['devicename'];
    uid = json['uid'];

  }
  bool? status;
  String? deviceid;
  String? devicename;
  String? uid;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['deviceid'] = deviceid;
    map['devicename'] = devicename;
    map['uid'] = uid;

    return map;
  }

}
