
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../controller/wifi_login_controller.dart';

class WifiLoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WifiLoginController>(() => WifiLoginController());
  }

}