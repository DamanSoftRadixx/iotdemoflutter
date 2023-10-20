import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController{
  TextEditingController oldpasswordController = TextEditingController();
  TextEditingController newpasswordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  var oldpasswordFocusNode = FocusNode().obs;
  var newpasswordFocusNode = FocusNode().obs;
  var confirmpasswordFocusNode = FocusNode().obs;

  bool singleTap = false;
  RxBool oldpasswordVisibility = false.obs;
  RxBool newpasswordVisibility = false.obs;
  RxBool confirmpasswordVisibility = false.obs;

  oldPasswordShowHide() {
    oldpasswordVisibility.value = !oldpasswordVisibility.value;
  }
  newPasswordShowHide() {
    newpasswordVisibility.value = !newpasswordVisibility.value;
  }
  confirmPasswordShowHide() {
    confirmpasswordVisibility.value = !confirmpasswordVisibility.value;
  }

  addFocusListeners() {
    oldpasswordFocusNode.value.addListener(() {
      oldpasswordFocusNode.refresh();
    });
    newpasswordFocusNode.value.addListener(() {
      newpasswordFocusNode.refresh();
    });
    confirmpasswordFocusNode.value.addListener(() {
      confirmpasswordFocusNode.refresh();
    });
  }

  disposeFocusListeners() {
    oldpasswordFocusNode.value.removeListener(() {});
    newpasswordFocusNode.value.removeListener(() {});
    confirmpasswordFocusNode.value.removeListener(() {});

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
    super.onInit();
  }

}