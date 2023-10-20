import 'package:iotdemoflutter/features/change_password/controller/change_password_controller.dart';
import 'package:get/get.dart';

class ChangePasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChangePasswordController>(() => ChangePasswordController());
  }
}
