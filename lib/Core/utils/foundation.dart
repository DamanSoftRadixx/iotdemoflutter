import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart' as foundation;

bool get isIos => foundation.defaultTargetPlatform == TargetPlatform.iOS;
bool get isNeedSafeArea => MediaQuery.of(Get.context!).viewPadding.bottom > 0;