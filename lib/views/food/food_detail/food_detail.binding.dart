import 'package:get/get.dart';
import 'package:hai_nguyen/views/food/food_detail/food_detail.controller.dart';

class FoodDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FoodDetailController());
  }
}
