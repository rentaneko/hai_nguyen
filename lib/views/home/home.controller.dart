import 'package:get/get.dart';
import 'package:hai_nguyen/views/bill/bill.controller.dart';
import 'package:hai_nguyen/views/food/food.controller.dart';
import 'package:hai_nguyen/views/restaurant/restaurant.controller.dart';
import 'package:hai_nguyen/views/user/user.controller.dart';

class HomeController extends GetxController {
  var isLoading = true.obs;
  var pageIndex = 0.obs;

  void selectedIndex(int value) => pageIndex.value = value;

  final _foodController = Get.find<FoodController>();
  final _resController = Get.find<RestaurantController>();
  final _billController = Get.find<BillController>();
  final _userController = Get.find<UserController>();

  @override
  void onInit() {
    super.onInit();
  }
}
