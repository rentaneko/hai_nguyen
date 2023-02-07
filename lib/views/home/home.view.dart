import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hai_nguyen/@share/styles/color.dart';
import 'package:hai_nguyen/@share/utils/utils.dart';
import 'package:hai_nguyen/views/bill/bill.view.dart';
import 'package:hai_nguyen/views/food/food.view.dart';
import 'package:hai_nguyen/views/home/home.controller.dart';
import 'package:hai_nguyen/views/restaurant/restaurant.view.dart';
import 'package:hai_nguyen/views/user/user.view.dart';

class HomePage extends GetWidget<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Obx(
        () => Column(
          children: [
            Container(
              color: AppColor.primary,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    'assets/icons/delivery.png',
                    height: responsiveHeight(230),
                    width: responsiveWidth(265),
                  ),
                  Text(
                    'Quản lý đặt thức ăn trực tuyến',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: responsiveFont(48),
                      fontWeight: FontWeight.w800,
                      color: AppColor.white,
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: null,
                    icon: Image.asset(
                      'assets/icons/user-1.png',
                      height: responsiveHeight(130),
                      width: responsiveWidth(130),
                    ),
                    label: Text(
                      'Admin',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        fontSize: responsiveFont(40),
                        color: AppColor.white,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (states) => AppColor.primary),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: AppColor.container,
                      child: Column(
                        children: [
                          SizedBox(height: responsiveHeight(30)),
                          Text(
                            'Quản lý chung',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: responsiveFont(32),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: responsiveHeight(50)),
                          InkWell(
                            onTap: () => controller.selectedIndex(0),
                            child: Container(
                              width: double.infinity,
                              color: controller.pageIndex.value == 0
                                  ? AppColor.background
                                  : AppColor.container,
                              padding: EdgeInsets.all(responsiveWidth(12)),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Image.asset(
                                      'assets/icons/restaurant.png',
                                      height: responsiveHeight(80),
                                      width: responsiveWidth(80),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Nhà hàng',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: responsiveFont(32),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  const Expanded(child: SizedBox()),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: responsiveHeight(20)),
                          InkWell(
                            onTap: () => controller.selectedIndex(1),
                            child: Container(
                              width: double.infinity,
                              color: controller.pageIndex.value == 1
                                  ? AppColor.background
                                  : AppColor.container,
                              padding: EdgeInsets.all(responsiveWidth(12)),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Image.asset(
                                      'assets/icons/food.png',
                                      height: responsiveHeight(80),
                                      width: responsiveWidth(80),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Thức ăn',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: responsiveFont(32),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  const Expanded(child: SizedBox()),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: responsiveHeight(20)),
                          InkWell(
                            onTap: () => controller.selectedIndex(2),
                            child: Container(
                              width: double.infinity,
                              color: controller.pageIndex.value == 2
                                  ? AppColor.background
                                  : AppColor.container,
                              padding: EdgeInsets.all(responsiveWidth(12)),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Image.asset(
                                      'assets/icons/bill.png',
                                      height: responsiveHeight(80),
                                      width: responsiveWidth(80),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Hóa đơn',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: responsiveFont(32),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  const Expanded(child: SizedBox()),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: responsiveHeight(20)),
                          InkWell(
                            onTap: () => controller.selectedIndex(3),
                            child: Container(
                              width: double.infinity,
                              color: controller.pageIndex.value == 3
                                  ? AppColor.background
                                  : AppColor.container,
                              padding: EdgeInsets.all(responsiveWidth(12)),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Image.asset(
                                      'assets/icons/user-2.png',
                                      height: responsiveHeight(80),
                                      width: responsiveWidth(80),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Khách hàng',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: responsiveFont(32),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  const Expanded(child: SizedBox()),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: IndexedStack(
                      index: controller.pageIndex.value,
                      children: const [
                        RestaurantPage(),
                        FoodPage(),
                        BillPage(),
                        UserPage(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
