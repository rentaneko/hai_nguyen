import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hai_nguyen/@share/utils/utils.dart';
import 'package:hai_nguyen/views/bill/bill.view.dart';
import 'package:hai_nguyen/views/food/food.view.dart';
import 'package:hai_nguyen/views/home/home.controller.dart';
import 'package:hai_nguyen/views/restaurant/restaurant.view.dart';

class HomePage extends GetWidget<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  SizedBox(height: responsiveHeight(30)),
                  Text('MENU'),
                  SizedBox(height: responsiveHeight(50)),
                  InkWell(
                    onTap: () => controller.selectedIndex(0),
                    child: Container(
                      width: double.infinity,
                      color: controller.pageIndex.value == 0
                          ? Colors.green.shade900
                          : Colors.white,
                      padding: EdgeInsets.all(responsiveWidth(12)),
                      child: Text(
                        'Danh sách nhà hàng',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(height: responsiveHeight(20)),
                  InkWell(
                    onTap: () => controller.selectedIndex(1),
                    child: Container(
                      width: double.infinity,
                      color: controller.pageIndex.value == 1
                          ? Colors.green.shade900
                          : Colors.white,
                      padding: EdgeInsets.all(responsiveWidth(12)),
                      child: Text(
                        'Danh sách món ăn',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(height: responsiveHeight(20)),
                  InkWell(
                    onTap: () => controller.selectedIndex(2),
                    child: Container(
                      width: double.infinity,
                      color: controller.pageIndex.value == 2
                          ? Colors.green.shade900
                          : Colors.white,
                      padding: EdgeInsets.all(responsiveWidth(12)),
                      child: Text(
                        'Danh sách hoá đơn',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: IndexedStack(
                index: controller.pageIndex.value,
                children: const [
                  RestaurantPage(),
                  FoodPage(),
                  BillPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
