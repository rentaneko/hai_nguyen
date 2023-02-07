import 'package:get/get.dart';
import 'package:hai_nguyen/views/restaurant/restaurant_detail/restaurant_detail.controller.dart';

class RestaurantDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RestaurantDetailController());
  }
}
