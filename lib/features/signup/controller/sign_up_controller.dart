import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:iotdemoflutter/Core/utils/Extension.dart';
import 'package:get/get.dart';
import 'package:iotdemoflutter/models/tuya_register_model.dart';
import 'package:iotdemoflutter/repository/tuya_repository.dart';

import '../../../../Core/common_ui/snackbar/snackbar.dart';
import '../../../../Core/utils/common_string.dart';
import '../../../Core/storage/local_storage.dart';
import '../../../Core/utils/Routes.dart';
import '../../../models/token_model.dart';
import '../provider/signup_provider.dart';

class SignUpController extends GetxController {
  final TuyaRepository _tuyaRepository = TuyaRepository();
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var nameFocusNode = FocusNode().obs;
  var surNameFocusNode = FocusNode().obs;

  var emailFocusNode = FocusNode().obs;
  var passwordFocusNode = FocusNode().obs;
  SignUpProvider signUpProvider = SignUpProvider();
  Rx<String> pickedImageFile = "".obs;
  bool singleTap = false;
  RxBool isShowLoader = false.obs;
  RxBool passwordVisibility = false.obs;

  setShowLoader({required bool value}) {
    isShowLoader.value = value;
    isShowLoader.refresh();
  }

  passwordShowHide() {
    passwordVisibility.value = !passwordVisibility.value;
  }

  signUpValidation() async {
    if (!singleTap) {
      if (nameController.text.isEmpty) {
        snackbar(Validations.entername.tr);
      } else if (surnameController.text.isEmpty) {
        snackbar(Validations.entersurename.tr);
      } else if (emailController.text.isEmpty) {
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
        Map<String, dynamic> parameter = {"grant_type": "1"};
        setShowLoader(value: true);
        print('hinting get token tuya user api');
        TokenModel? response =
            await _tuyaRepository.getToken(parameter: parameter);
        if ((response.success ?? false) == true) {
          await Prefs.write(Prefs.tuyaToken,response.result?.accessToken ?? '');
          await Prefs.write(Prefs.tuyaRefreshedToken,response.result?.refreshToken ?? '');
          await Prefs.write(Prefs.tuyaTime,response.t.toString() ?? '');
          var body={
            "country_code":"91",
            "username":"${nameController.text.trim()} ${surnameController.text.trim()}",
            "password":passwordController.text.trim(),
            "nick_name":nameController.text.trim(),
            "username_type":"3",
            "email":emailController.text.trim()
          };
          print('hinting register user api');
          TuyaRegisterModel tuyaRegisterResponse = await _tuyaRepository.registerUser(body: body);
          if ((tuyaRegisterResponse.success ?? false) == true) {
            print('hinting save data to firebase');

            UserCredential? responsee = await signUpProvider.signUp(
                email: emailController.text.trim(),
                password: passwordController.text.trim(),
                username: nameController.text.trim(),
                surname: surnameController.text.trim(),
                tuyaToken: response.result?.accessToken ?? '',
                tuyaRefreshedToken: response.result?.refreshToken ?? '',
                tuyaUid: tuyaRegisterResponse.result?.uid ?? '');
            if (responsee?.user?.uid != null) {
              stopLoader();
              Get.offAllNamed(MyRoutes.bottomtabscreen);
            } else {
              stopLoader();
            }
          } else {
            stopLoader();
          }
        } else {
          stopLoader();
        }
      }
    }
  }

  stopLoader() {
    setShowLoader(value: false);
    singleTap = true;
    Future.delayed(const Duration(seconds: 3))
        .then((value) => singleTap = false);
  }

  addFocusListeners() {
    nameFocusNode.value.addListener(() {
      nameFocusNode.refresh();
    });

    surNameFocusNode.value.addListener(() {
      surNameFocusNode.refresh();
    });

    emailFocusNode.value.addListener(() {
      emailFocusNode.refresh();
    });

    passwordFocusNode.value.addListener(() {
      passwordFocusNode.refresh();
    });
  }

  disposeFocusListeners() {
    emailFocusNode.value.removeListener(() {});
    surNameFocusNode.value.removeListener(() {});

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
}
