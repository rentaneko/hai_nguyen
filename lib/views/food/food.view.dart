import 'package:flutter/material.dart';
import 'package:flutter_format_money_vietnam/flutter_format_money_vietnam.dart';
import 'package:get/get.dart';
import 'package:hai_nguyen/@share/utils/utils.dart';
import 'package:hai_nguyen/model/restaurant.model.dart';
import 'package:hai_nguyen/views/food/food.controller.dart';

class FoodPage extends GetWidget<FoodController> {
  const FoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Row(
            children: [
              Text('Nhà hàng'),
              Obx(
                () => controller.isLoading.value
                    ? const Center(child: CircularProgressIndicator())
                    : DropdownButtonHideUnderline(
                        child: DropdownButton(
                          items: controller.listRestaurant
                              .map((restaurant) => buildMenuItem(restaurant))
                              .toList(),
                          onChanged: (value) {
                            controller.selectedRestaurant.value = value!;
                            controller.getFoodOfRestaurant();
                          },
                          value: controller.selectedRestaurant.value,
                        ),
                      ),
              ),
              ElevatedButton(
                onPressed: () => openDialog(),
                child: Text('Thêm món ăn'),
              ),
            ],
          ),
          Text('Danh sách món ăn'),
          Obx(
            () => controller.isLoadingFood.value == true
                ? const Center(child: CircularProgressIndicator())
                : (controller.listFood.isEmpty
                    ? Text('No food')
                    : Container(
                        width: getWidthDevice(),
                        margin: EdgeInsets.symmetric(
                            horizontal: responsiveWidth(8)),
                        child: DataTable(
                          border: TableBorder.all(),
                          headingRowHeight: 80,
                          columnSpacing: 16,
                          headingTextStyle: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                          columns: const [
                            DataColumn(
                              label: SizedBox(
                                  width: 75,
                                  child: Text('Hình ảnh',
                                      textAlign: TextAlign.center)),
                            ),
                            DataColumn(
                              label: SizedBox(
                                width: 120,
                                child: Text('Tên món ăn',
                                    textAlign: TextAlign.center),
                              ),
                            ),
                            DataColumn(
                                label: SizedBox(
                                    width: 70, child: Text('Giá tiền')),
                                numeric: true),
                            DataColumn(
                              label: SizedBox(
                                  width: 90, child: Text('Thuộc loại')),
                            ),
                            DataColumn(
                                label: SizedBox(
                                    width: 150, child: Text('Miêu tả'))),
                            DataColumn(
                                label: SizedBox(
                                    width: 150, child: Text('Nguyên liệu'))),
                          ],
                          rows: List<DataRow>.generate(
                            controller.listFood.length,
                            (index) => DataRow(
                              cells: [
                                DataCell(
                                  SizedBox(
                                    height: 75,
                                    width: 75,
                                    child: Center(
                                        child: Image.network(
                                            'https://o.vdoc.vn/data/image/2022/08/25/avatar-cute-cho-co-nang-nghien-tra-sua.jpg')),
                                  ),
                                ),
                                DataCell(
                                  SizedBox(
                                    width: 120,
                                    height: 75,
                                    child: Center(
                                      child: Text(
                                        controller.listFood[index].name!,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  SizedBox(
                                    width: 75,
                                    child: Text(controller.listFood[index].price
                                        .toVND(unit: 'VNĐ')),
                                  ),
                                ),
                                DataCell(
                                  SizedBox(
                                    width: 90,
                                    child: Text(
                                      controller.listFood[index].category!,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                DataCell(SizedBox(
                                  width: 300,
                                  child: Text(
                                    controller.listFood[index].description!,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )),
                                DataCell(SizedBox(
                                  width: 300,
                                  child: Text(
                                    controller.listFood[index].ingredient!,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )),
                              ],
                            ),
                          ),
                        ),
                      )),
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

  DropdownMenuItem<Restaurant> buildMenuItem(Restaurant restaurant) =>
      DropdownMenuItem(
        value: restaurant,
        child: Text(restaurant.name!),
      );
}
