import 'package:flutter/material.dart';
import 'package:flutter_format_money_vietnam/flutter_format_money_vietnam.dart';
import 'package:get/get.dart';
import 'package:hai_nguyen/@share/constants/value.constant.dart';
import 'package:hai_nguyen/@share/styles/color.dart';
import 'package:hai_nguyen/@share/utils/utils.dart';
import 'package:hai_nguyen/model/restaurant.model.dart';
import 'package:hai_nguyen/views/food/food.controller.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class FoodPage extends GetWidget<FoodController> {
  const FoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: responsiveHeight(20)),
          Container(
            padding: EdgeInsets.symmetric(horizontal: responsiveWidth(24)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Danh sách món ăn',
                  style: TextStyle(
                    color: AppColor.black,
                    fontSize: responsiveFont(42),
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Inter',
                  ),
                ),
                Obx(
                  () => controller.isLoading.value
                      ? DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            items:
                                tags.map((item) => buildWaiting(item)).toList(),
                            value: tags[0],
                            onChanged: (value) {},
                            buttonHeight: responsiveHeight(48),
                            buttonWidth: responsiveWidth(220),
                            itemHeight: responsiveHeight(48),
                            dropdownMaxHeight: responsiveHeight(300),
                            alignment: Alignment.center,
                            scrollbarAlwaysShow: true,
                            buttonDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: AppColor.border),
                            ),
                            dropdownWidth: responsiveWidth(220),
                          ),
                        )
                      : DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            items: controller.listRestaurant
                                .map((restaurant) => buildMenuItem(restaurant))
                                .toList(),
                            onChanged: (value) {
                              controller.selectedRestaurant.value = value!;
                              controller.getFoodOfRestaurant();
                            },
                            value: controller.selectedRestaurant.value,
                            buttonHeight: responsiveHeight(48),
                            buttonWidth: responsiveWidth(220),
                            itemHeight: responsiveHeight(48),
                            dropdownMaxHeight: responsiveHeight(300),
                            alignment: Alignment.center,
                            scrollbarAlwaysShow: true,
                            buttonDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: AppColor.border),
                            ),
                            dropdownWidth: responsiveWidth(220),
                          ),
                        ),
                ),
                ElevatedButton(
                  onPressed: () => openDialog(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.secondary,
                    fixedSize: Size(responsiveWidth(240), responsiveHeight(52)),
                  ),
                  child: Text(
                    'Thêm món ăn',
                    style: TextStyle(
                      color: AppColor.black,
                      fontSize: responsiveFont(24),
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Inter',
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: responsiveHeight(20)),
          Obx(
            () => controller.isLoadingFood.value == true
                ? DataTable(
                    border: TableBorder.all(color: AppColor.border),
                    headingRowColor: MaterialStateProperty.resolveWith<Color>(
                        (states) => AppColor.header),
                    columnSpacing: responsiveWidth(74),
                    columns: const [
                      DataColumn(label: Text('Tên nhà hàng')),
                      DataColumn(label: Text('Loại')),
                      DataColumn(label: Text('Địa chỉ')),
                      DataColumn(label: Text('Nhãn dán')),
                      DataColumn(label: Text('Khoảng cách'), numeric: true),
                      DataColumn(
                          label: Text('Thời gian giao hàng'), numeric: true),
                      DataColumn(label: Text('Hình ảnh')),
                    ],
                    rows: [],
                  )
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
  DropdownMenuItem<String> buildWaiting(String restaurant) => DropdownMenuItem(
        value: restaurant,
        child: Text(restaurant),
      );
}
