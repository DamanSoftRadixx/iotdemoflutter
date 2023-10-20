
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iotdemoflutter/Core/Firebase/User.dart';
import 'package:get/get.dart';

import '../../../../Core/storage/local_storage.dart';
import '../../../../Core/utils/Routes.dart';
import '../provider/profile_provider.dart';


class ProfileController extends GetxController {
  ProfileProvider profileProvider = ProfileProvider();
  RxString name = "".obs;
  RxString surname = "".obs;
  RxString useremail = "".obs;
  RxBool isShowLoader = false.obs;

  setShowLoader({required bool value}) {
    isShowLoader.value = value;
    isShowLoader.refresh();
  }

  void onInit() {
    getProfile();
    super.onInit();
  }

  getProfile() async {
    setShowLoader(value: true);
    String email = await Prefs.read(Prefs.email)??'';
    QuerySnapshot? response = await profileProvider.getProfile(email);
    setShowLoader(value: false);
    if (response != null) {
      final data = User.fromJson(response?.docs.first.data());
      name.value = data.username ?? "";
      surname.value = data.surname ?? "";
      useremail.value = data.email ?? "";
    }
  }

}
