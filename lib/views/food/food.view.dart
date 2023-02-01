import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hai_nguyen/@share/utils/utils.dart';
import 'package:hai_nguyen/views/food/food.controller.dart';

class FoodPage extends GetWidget<FoodController> {
  const FoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Text('Danh sách món ăn'),
          Row(
            children: [
              Text('Nhà hàng'),
              Text('tên nhà hàng'),
              ElevatedButton(
                onPressed: () => openDialog(),
                child: Text('Thêm món ăn'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  openDialog() => Get.dialog(
        barrierDismissible: false,
        AlertDialog(
          title: Text('Thêm một món ăn mới'),
          content: Container(
            color: Colors.white,
            height: 500,
            width: 700,
            child: ListView(
              children: [
                Text('Nhập tên món ăn'),
                TextFormField(
                  controller: controller.nameCtrl,
                  // validator: (_) => controller.validateUsername(),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: responsiveHeight(2),
                      horizontal: responsiveWidth(8),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4)),
                  ),
                ),
                Text('Nhập loại'),
                TextFormField(
                  controller: controller.category,
                  // validator: (_) => controller.validateUsername(),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: responsiveHeight(2),
                      horizontal: responsiveWidth(8),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4)),
                  ),
                ),
                Text('Nhập miêu tả'),
                TextFormField(
                  controller: controller.description,
                  // validator: (_) => controller.validateUsername(),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: responsiveHeight(2),
                      horizontal: responsiveWidth(8),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4)),
                  ),
                ),
                Text('Nhập giá'),
                TextFormField(
                  controller: controller.price,
                  // validator: (_) => controller.validateUsername(),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: responsiveHeight(2),
                      horizontal: responsiveWidth(8),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4)),
                  ),
                ),
                Text('Nhập combo(nếu có)'),
                TextFormField(
                  controller: controller.ingredients,
                  // validator: (_) => controller.validateUsername(),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: responsiveHeight(2),
                      horizontal: responsiveWidth(8),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4)),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            ElevatedButton(onPressed: () => goBack(), child: Text('Huỷ bỏ')),
            ElevatedButton(
                onPressed: () => controller.addFood(), child: Text('Xác nhận')),
          ],
        ),
      );
}
