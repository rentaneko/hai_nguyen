import 'package:get/get.dart';
import 'package:hai_nguyen/@share/utils/utils.dart';
import 'package:hai_nguyen/model/restaurant.model.dart';

class RestaurantDetailController extends GetxController {
  var restaurant = Restaurant().obs;

  @override
  void onInit() {
    restaurant.value = getArgument() as Restaurant;
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
