import 'package:flutter/animation.dart';
import 'package:get/get.dart';
class BottomTabController extends GetxController {

  final currentIndex = 0.obs;

  void changeTabIndex(int index) {
    currentIndex.value = index;
  }
}
