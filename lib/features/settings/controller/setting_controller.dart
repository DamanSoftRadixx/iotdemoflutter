import 'package:iotdemoflutter/Core/utils/Routes.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../Core/storage/local_storage.dart';
import '../../profile/provider/profile_provider.dart';

class SettingController extends GetxController {
  ProfileProvider profileProvider = ProfileProvider();

   goToProfileScreen() {
    Get.toNamed(MyRoutes.profilescreen);
  }
   logout() async {
     await Prefs.erase();
     await profileProvider.signOut();
     Get.offAllNamed(MyRoutes.root);
   }
   gotoChangePasswordScreen(){
     Get.toNamed(MyRoutes.changePassword);
   }


  void gotoWifiScreen() {
    Get.toNamed(MyRoutes.wifiloginscreen);

  }

}
