import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iotdemoflutter/Core/Firebase/User.dart';
import 'package:iotdemoflutter/Core/Firebase/firebase.dart';
import 'package:iotdemoflutter/Core/common_ui/snackbar/snackbar.dart';
import 'package:get/get.dart';
import 'package:iotdemoflutter/Core/utils/Extension.dart';
import 'package:iotdemoflutter/Core/utils/Routes.dart';

import '../../../../Core/storage/local_storage.dart';
import '../../../../Core/utils/common_string.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iotdemoflutter/Core/Firebase/User.dart' as UserData;
class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var emailFocusNode = FocusNode().obs;
  var passwordFocusNode = FocusNode().obs;
  bool singleTap = false;
  RxBool isShowLoader = false.obs;
  RxBool passwordVisibility = false.obs;

  addFocusListeners() {
    emailFocusNode.value.addListener(() {
      emailFocusNode.refresh();
    });
    passwordFocusNode.value.addListener(() {
      passwordFocusNode.refresh();
    });
  }

  disposeFocusListeners() {
    emailFocusNode.value.removeListener(() {});
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
    super.onInit();
  }

  @override
  void onReady()async{
    super.onReady();
  }

  setShowLoader({required bool value}) {
    isShowLoader.value = value;
    isShowLoader.refresh();
  }

  passwordShowHide() {
    passwordVisibility.value = !passwordVisibility.value;
  }

  validation() async {
    if (!singleTap) {
      if (emailController.text.isEmpty) {
        snackbar(Validations.enteremail.tr);
      } else if (!EmailValidator.validate(emailController.text)) {
        snackbar(Validations.entervaildemail.tr);
      } else if (passwordController.text.isEmpty) {
        snackbar(Validations.enterpassword.tr);
      } else if (passwordController.text.length < 8) {
        snackbar(Validations.msgminpasswordatleast.tr);
      } else if (!passwordController.text.isValidPassword()) {
        snackbar(Validations.kMsgPasswordAtleast.tr);
      } else {
        setShowLoader(value: true);
        UserCredential? response = await AuthenticationHelper().login(
            email: emailController.text, password: passwordController.text);
        setShowLoader(value: false);
        if (response?.user?.uid != null) {
          String? token = response?.user?.uid;
          String? email = response?.user?.email;
          AuthenticationHelper().getProfile(userEmail: response?.user?.email??'').then((value)async {
            final data = UserData.User.fromJson(value?.docs.first.data());
            await Prefs.write(Prefs.tuyaToken,data.tuyaToken ?? '');
            await Prefs.write(Prefs.tuyaRefreshedToken,data.tuyaRefreshedToken ?? '');
            await Prefs.write(Prefs.password,data.password);
            await Prefs.write(Prefs.surname,data.surname);
            await Prefs.write(Prefs.username,data.username);
            await Prefs.write(Prefs.email,email);
            await Prefs.write(Prefs.token,token);
            await Prefs.write(Prefs.tuyaUid,data.tuyaToken);
            print('login user detail ${data}');
            emptyTextFieldsData();
            goToBottomTabScreen();
          }).onError((error, stackTrace){
            snackbar(error.toString());
          });
        }
      }
      singleTap = true;
      Future.delayed(const Duration(seconds: 3))
          .then((value) => singleTap = false);
    }
  }

  emptyTextFieldsData() {
    emailController.text = "";
    passwordController.text = "";
  }

  gotoSignupScreen() {
    Get.toNamed(MyRoutes.signUpscreen);
  }

  goToBottomTabScreen() {
    Get.offAllNamed(MyRoutes.bottomtabscreen);
  }
}
