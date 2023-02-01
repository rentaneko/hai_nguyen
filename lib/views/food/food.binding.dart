import 'package:get/instance_manager.dart';
import 'package:hai_nguyen/views/food/food.controller.dart';

class FoodBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FoodController());
  }
}
