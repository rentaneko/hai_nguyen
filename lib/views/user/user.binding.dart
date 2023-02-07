import 'package:get/get.dart';
import 'package:hai_nguyen/views/user/user.controller.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UserController());
  }
}
