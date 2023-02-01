import 'package:get/route_manager.dart';
import 'package:hai_nguyen/@share/routes/routes.dart';
import 'package:hai_nguyen/views/bill/bill.binding.dart';
import 'package:hai_nguyen/views/bill/bill.view.dart';
import 'package:hai_nguyen/views/food/food.binding.dart';
import 'package:hai_nguyen/views/food/food.view.dart';
import 'package:hai_nguyen/views/home/home.binding.dart';
import 'package:hai_nguyen/views/home/home.view.dart';
import 'package:hai_nguyen/views/login/login.binding.dart';
import 'package:hai_nguyen/views/login/login.view.dart';
import 'package:hai_nguyen/views/restaurant/restaurant.binding.dart';
import 'package:hai_nguyen/views/restaurant/restaurant.view.dart';

class RoutesApp {
  static final route = [
    GetPage(
      name: ROUTE_LOGIN,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: ROUTE_HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: ROUTE_BILL,
      page: () => const BillPage(),
      binding: BillBinding(),
    ),
    GetPage(
      name: ROUTE_FOOD,
      page: () => const FoodPage(),
      binding: FoodBinding(),
    ),
    GetPage(
      name: ROUTE_RESTAURANT,
      page: () => const RestaurantPage(),
      binding: RestaurantBinding(),
    ),
  ];
}
