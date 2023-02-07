import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hai_nguyen/@share/constants/value.constant.dart';
import 'package:hai_nguyen/@share/styles/color.dart';
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
          SizedBox(height: responsiveHeight(20)),
          Container(
            padding: EdgeInsets.symmetric(horizontal: responsiveWidth(24)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(),
                Text(
                  'Danh sách nhà hàng',
                  style: TextStyle(
                    color: AppColor.black,
                    fontSize: responsiveFont(42),
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Inter',
                  ),
                ),
                ElevatedButton(
                  onPressed: () => openDialog(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.secondary,
                    fixedSize: Size(responsiveWidth(240), responsiveHeight(52)),
                  ),
                  child: Text(
                    'Thêm nhà hàng',
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
            () => controller.isLoading.value
                ? DataTable(
                    border: TableBorder.all(color: AppColor.border),
                    headingRowColor: MaterialStateProperty.resolveWith<Color>(
                        (states) => AppColor.header),
                    columnSpacing: responsiveWidth(74),
                    columns: const [
                      DataColumn(label: Text('Tên nhà hàng')),
                      DataColumn(label: Text('Loại')),
                      DataColumn(label: Text('Địa chỉ')),
                      DataColumn(label: Text('Danh mục')),
                      DataColumn(label: Text('Khoảng cách'), numeric: true),
                      DataColumn(
                          label: Text('Thời gian giao hàng'), numeric: true),
                      DataColumn(label: Text('Hình ảnh')),
                    ],
                    rows: [],
                  )
                : DataTable(
                    border: TableBorder.all(color: AppColor.border),
                    headingRowColor: MaterialStateProperty.resolveWith<Color>(
                        (states) => AppColor.header),
                    columnSpacing: responsiveWidth(74),
                    columns: const [
                      DataColumn(label: Text('Tên nhà hàng')),
                      DataColumn(label: Text('Loại')),
                      DataColumn(label: Text('Địa chỉ')),
                      DataColumn(label: Text('Danh mục')),
                      DataColumn(label: Text('Khoảng cách'), numeric: true),
                      DataColumn(
                          label: Text('Thời gian giao hàng'), numeric: true),
                      DataColumn(label: Text('Hình ảnh')),
                    ],
                    rows: List<DataRow>.generate(
                      controller.listRestaurant.length,
                      (index) => DataRow(
                        cells: [
                          DataCell(
                              Text(controller.listRestaurant[index].name!)),
                          DataCell(
                              Text(controller.listRestaurant[index].type!)),
                          DataCell(Text(index.toString())),
                          DataCell(Text(controller
                              .listRestaurant[index].distance
                              .toString())),
                          DataCell(Text(controller.listRestaurant[index].time
                              .toString())),
                        ],
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  openDialog() => Get.dialog(
        barrierDismissible: false,
        AlertDialog(
          title: Text(
            'Nhập thông tin của nhà hàng',
            style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                fontSize: responsiveFont(22),
                color: AppColor.black),
          ),
          content: Container(
            height: 500,
            width: 700,
            color: AppColor.white,
            child: ListView(
              children: [
                Text(
                  'Nhập tên nhà hàng',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: responsiveFont(16),
                      color: AppColor.black),
                ),
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
                Text(
                  'Nhập địa chỉ nhà hàng',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: responsiveFont(16),
                      color: AppColor.black),
                ),
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
                Text(
                  'Nhập khoảng cách nhà hàng',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: responsiveFont(16),
                      color: AppColor.black),
                ),
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
                Text(
                  'Thêm đường dẫn hình ảnh',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: responsiveFont(16),
                      color: AppColor.black),
                ),
                TextFormField(
                  controller: controller.pictureCtrl,
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
                Text(
                  'Chọn nhãn thẻ',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: responsiveFont(16),
                      color: AppColor.black),
                ),
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
                Text(
                  'Loại nhà hàng',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: responsiveFont(16),
                      color: AppColor.black),
                ),
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
        value: item,
        child: Text(item),
      );
}
