import 'package:get/instance_manager.dart';
import 'package:hai_nguyen/views/restaurant/restaurant.controller.dart';

class RestaurantBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RestaurantController());
  }
}
