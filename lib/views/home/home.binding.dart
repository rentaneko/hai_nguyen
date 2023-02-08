import 'package:get/instance_manager.dart';
import 'package:hai_nguyen/views/bill/bill.controller.dart';
import 'package:hai_nguyen/views/food/food.controller.dart';
import 'package:hai_nguyen/views/home/home.controller.dart';
import 'package:hai_nguyen/views/restaurant/restaurant.controller.dart';
import 'package:hai_nguyen/views/user/user.controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RestaurantController());
    Get.lazyPut(() => BillController());
    Get.lazyPut(() => FoodController());
    Get.lazyPut(() => UserController());
    Get.lazyPut(() => HomeController());
  }
}
