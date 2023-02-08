import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_format_money_vietnam/flutter_format_money_vietnam.dart';
import 'package:get/get.dart';
import 'package:hai_nguyen/@share/constants/value.constant.dart';
import 'package:hai_nguyen/@share/routes/routes.dart';
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
                  () => controller.isLoading.value == true
                      ? const Center(child: CircularProgressIndicator())
                      : (controller.listRestaurant.isEmpty
                          ? const SizedBox()
                          : DropdownButtonHideUnderline(
                              child: DropdownButton2(
                                items: controller.listRestaurant
                                    .map((restaurant) =>
                                        buildMenuItem(restaurant))
                                    .toList(),
                                onChanged: (value) {
                                  controller.selectedRestaurant.value = value!;
                                  controller.getFoodOfRestaurant();
                                },
                                value: controller.selectedRestaurant.value,
                                buttonHeight: responsiveHeight(48),
                                buttonWidth: responsiveWidth(400),
                                itemHeight: responsiveHeight(48),
                                dropdownMaxHeight: responsiveHeight(300),
                                alignment: Alignment.center,
                                scrollbarAlwaysShow: true,
                                buttonDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(color: AppColor.border),
                                ),
                                dropdownWidth: responsiveWidth(400),
                              ),
                            )),
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
                ? const Center(child: CircularProgressIndicator())
                : (controller.listFood.isEmpty
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: responsiveHeight(36)),
                          Image.asset(
                            'assets/icons/no-food.png',
                            height: responsiveHeight(375),
                            width: responsiveWidth(375),
                          ),
                          SizedBox(height: responsiveHeight(36)),
                          Text('Hiện chưa có món ăn nào trong nhà hàng này'),
                          SizedBox(height: responsiveHeight(16)),
                          Text('Vui lòng thêm món ăn vào nhà hàng'),
                        ],
                      )
                    : Container(
                        width: getWidthDevice(),
                        padding: EdgeInsets.symmetric(
                          horizontal: responsiveWidth(32),
                        ),
                        child: DataTable(
                          border: TableBorder.all(color: AppColor.border),
                          headingRowColor:
                              MaterialStateProperty.resolveWith<Color>(
                                  (states) => AppColor.header),
                          columnSpacing: responsiveWidth(74),
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
                              label:
                                  SizedBox(width: 150, child: Text('Miêu tả')),
                            ),
                            DataColumn(label: Text('Quản lý')),
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
                                        child: CachedNetworkImage(
                                      imageUrl:
                                          '${controller.listFood[index].image}',
                                      placeholder: (context, url) =>
                                          const Center(
                                              child:
                                                  CircularProgressIndicator()),
                                      errorWidget: (context, url, error) =>
                                          Image.network(
                                              'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6c/No_image_3x4.svg/1200px-No_image_3x4.svg.png'),
                                    )),
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
                                        textAlign: TextAlign.start,
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
                                DataCell(
                                  SizedBox(
                                    width: 300,
                                    child: Text(
                                      controller.listFood[index].description!,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Row(
                                    children: [
                                      ElevatedButton(
                                        onPressed: () => goTo(
                                            screen: ROUTE_FOOD_DETAIL,
                                            argument:
                                                controller.listFood[index]),
                                        child: Text(
                                          'Xem chi tiết',
                                          style: TextStyle(
                                            fontFamily: 'Inter',
                                            fontSize: responsiveFont(16),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () => openPopup(
                                          'Chắc chắn xoá món ăn này ?',
                                          () {
                                            controller.deleteFood(
                                                controller.listFood[index].id);
                                            controller.getFoodOfRestaurant();
                                            goBack();
                                          },
                                        ),
                                        icon: Image.asset(
                                            'assets/icons/remove.png'),
                                      ),
                                    ],
                                  ),
                                ),
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
          title: Text(
            'Nhập thông tin của món ăn',
            style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                fontSize: responsiveFont(22),
                color: AppColor.black),
          ),
          content: Container(
            color: Colors.white,
            height: responsiveHeight(500),
            width: responsiveWidth(700),
            child: ListView(
              children: [
                SizedBox(height: responsiveHeight(24)),
                Text(
                  'Nhập tên món ăn',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: responsiveFont(16),
                      color: AppColor.black),
                ),
                SizedBox(height: responsiveHeight(16)),
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
                SizedBox(height: responsiveHeight(24)),
                Text(
                  'Chọn thể loại',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: responsiveFont(16),
                      color: AppColor.black),
                ),
                SizedBox(height: responsiveHeight(16)),
                Obx(
                  () => DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      items:
                          categories.map((item) => buildWaiting(item)).toList(),
                      value: controller.selectedCategory.value,
                      onChanged: (value) {
                        controller.selectedCategory.value = value!;
                      },
                      buttonHeight: responsiveHeight(54),
                      buttonWidth: double.infinity,
                      itemHeight: responsiveHeight(54),
                      dropdownMaxHeight: responsiveHeight(300),
                      alignment: Alignment.center,
                      scrollbarAlwaysShow: true,
                      buttonDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: AppColor.border),
                      ),
                      dropdownWidth: responsiveWidth(700),
                    ),
                  ),
                ),
                SizedBox(height: responsiveHeight(16)),
                Text(
                  'Nhập giá tiền',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: responsiveFont(16),
                      color: AppColor.black),
                ),
                SizedBox(height: responsiveHeight(16)),
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
                SizedBox(height: responsiveHeight(24)),
                Text(
                  'Nhập miêu tả',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: responsiveFont(16),
                      color: AppColor.black),
                ),
                SizedBox(height: responsiveHeight(16)),
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
                SizedBox(height: responsiveHeight(24)),
                Text(
                  'Nhập combo (nếu có)',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: responsiveFont(16),
                      color: AppColor.black),
                ),
                SizedBox(height: responsiveHeight(16)),
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
                SizedBox(height: responsiveHeight(24)),
                Text(
                  'Nhập đường dẫn hình ảnh',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: responsiveFont(16),
                      color: AppColor.black),
                ),
                SizedBox(height: responsiveHeight(16)),
                TextFormField(
                  controller: controller.image,
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
