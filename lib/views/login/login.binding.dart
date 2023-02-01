import 'package:get/instance_manager.dart';
import 'package:hai_nguyen/views/login/login.controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}
