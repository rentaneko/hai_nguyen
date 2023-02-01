import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hai_nguyen/@share/constants/value.constant.dart';
import 'package:hai_nguyen/@share/utils/utils.dart';
import 'package:hai_nguyen/views/restaurant/restaurant.controller.dart';

class RestaurantPage extends GetWidget<RestaurantController> {
  const RestaurantPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              Text('Thêm một nhà hàng mới'),
              ElevatedButton(
                // onPressed: () => controller.addRestaurant(),
                onPressed: () => openDialog(),
                child: Text('Thêm nhà hàng'),
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
          title: Text('Thêm một nhà hàng mới'),
          content: Container(
            color: Colors.white,
            height: 500,
            width: 700,
            child: ListView(
              children: [
                Text('Nhập tên nhà hàng'),
                TextFormField(
                  controller: controller.nameResCtrl,
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
                Text('Nhập địa chỉ nhà hàng'),
                TextFormField(
                  controller: controller.locationCtrl,
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
                Text('Nhập khoảng cách nhà hàng'),
                TextFormField(
                  controller: controller.distanceCtrl,
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
                Text('Chọn nhãn thẻ'),
                GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    mainAxisExtent: 40,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: tags.length,
                  itemBuilder: (context, index) {
                    return Obx(
                      () => InkWell(
                        onTap: () => controller.checkTag(tags[index]) == false
                            ? controller.addTag(tags[index])
                            : controller.removeTag(tags[index]),
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: controller.checkTag(tags[index]) == true
                                ? Colors.amber
                                : Colors.blue,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(tags[index]),
                        ),
                      ),
                    );
                  },
                ),
                Text('Loại nhà hàng'),
                GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    mainAxisExtent: 40,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Obx(
                      () => InkWell(
                        onTap: () =>
                            controller.checkCate(categories[index]) == false
                                ? controller.addCate(categories[index])
                                : controller.removeCate(categories[index]),
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color:
                                controller.checkCate(categories[index]) == true
                                    ? Colors.amber
                                    : Colors.blue,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(categories[index]),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          actions: [
            ElevatedButton(onPressed: () => goBack(), child: Text('Huỷ bỏ')),
            ElevatedButton(
                onPressed: () => controller.addRestaurant(),
                child: Text('Xác nhận')),
          ],
        ),
      );

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        child: Text(item),
        value: item,
      );
}
