import 'package:get/get.dart';
import 'package:hai_nguyen/@share/utils/utils.dart';
import 'package:hai_nguyen/model/food.model.dart';

class FoodDetailController extends GetxController {
  var food = Food().obs;

  @override
  void onInit() {
    food.value = getArgument() as Food;
    super.onInit();
  }
}
