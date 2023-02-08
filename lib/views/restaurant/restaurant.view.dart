import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hai_nguyen/@share/constants/value.constant.dart';
import 'package:hai_nguyen/@share/routes/routes.dart';
import 'package:hai_nguyen/@share/styles/color.dart';
import 'package:hai_nguyen/@share/utils/utils.dart';
import 'package:hai_nguyen/views/restaurant/restaurant.controller.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
                ? const Center(child: CircularProgressIndicator())
                : (controller.listRestaurant.isEmpty
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: responsiveHeight(36)),
                          Image.asset(
                            'assets/icons/no-home.png',
                            height: responsiveHeight(375),
                            width: responsiveWidth(375),
                          ),
                          SizedBox(height: responsiveHeight(36)),
                          Text(
                              'Hiện chưa có nhà hàng nào trong dữ liệu hệ thống'),
                          SizedBox(height: responsiveHeight(16)),
                          Text('Vui lòng thêm dữ liệu vào hệ thống'),
                        ],
                      )
                    : Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: responsiveWidth(32)),
                          child: DataTable(
                            border: TableBorder.all(color: AppColor.border),
                            headingRowColor:
                                MaterialStateProperty.resolveWith<Color>(
                                    (states) => AppColor.header),
                            columns: const [
                              DataColumn(label: Text('Nhãn hiệu')),
                              DataColumn(label: Text('Tên nhà hàng')),
                              DataColumn(label: Text('Loại')),
                              DataColumn(label: Text('Địa chỉ')),
                              DataColumn(label: Text('Quản lý')),
                            ],
                            rows: List<DataRow>.generate(
                              controller.listRestaurant.length,
                              (index) => DataRow(
                                cells: [
                                  DataCell(
                                    SizedBox(
                                      height: responsiveHeight(75),
                                      width: responsiveWidth(75),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            '${controller.listRestaurant[index].logo}',
                                        placeholder: (context, url) =>
                                            const Center(
                                                child:
                                                    CircularProgressIndicator()),
                                        errorWidget: (context, url, error) =>
                                            Image.network(
                                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTO7xDFltiJ7FBTAkI6B4zQ3zC-nzvvPWtZ2WZiK8lNEXarDj8_avGsZPZpNPdPf_FX3-4&usqp=CAU'),
                                      ),
                                    ),
                                  ),
                                  DataCell(Text(controller
                                      .listRestaurant[index].name
                                      .toString())),
                                  DataCell(Text(controller
                                      .listRestaurant[index].type
                                      .toString())),
                                  DataCell(Text(controller
                                      .listRestaurant[index].location
                                      .toString())),
                                  DataCell(
                                    Row(
                                      children: [
                                        ElevatedButton(
                                          onPressed: () => goTo(
                                              screen: ROUTE_RES_DETAIL,
                                              argument: controller
                                                  .listRestaurant[index]),
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
                                              'Chắc chắn xoá nhà hàng này', () {
                                            controller.deleteRestaurant(
                                                controller
                                                    .listRestaurant[index].id!);
                                            controller.getAllRestaurant();
                                            goBack();
                                          }),
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
                SizedBox(height: responsiveHeight(24)),
                Text(
                  'Nhập tên nhà hàng',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: responsiveFont(16),
                      color: AppColor.black),
                ),
                SizedBox(height: responsiveHeight(16)),
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
                SizedBox(height: responsiveHeight(16)),
                Text(
                  'Nhập địa chỉ nhà hàng',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: responsiveFont(16),
                      color: AppColor.black),
                ),
                SizedBox(height: responsiveHeight(16)),
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
                SizedBox(height: responsiveHeight(16)),
                Text(
                  'Nhập khoảng cách nhà hàng',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: responsiveFont(16),
                      color: AppColor.black),
                ),
                SizedBox(height: responsiveHeight(16)),
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
                SizedBox(height: responsiveHeight(16)),
                Text(
                  'Thêm đường dẫn hình ảnh',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: responsiveFont(16),
                      color: AppColor.black),
                ),
                SizedBox(height: responsiveHeight(16)),
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
                SizedBox(height: responsiveHeight(16)),
                Text(
                  'Thêm đường dẫn nhãn hiệu',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: responsiveFont(16),
                      color: AppColor.black),
                ),
                SizedBox(height: responsiveHeight(16)),
                TextFormField(
                  controller: controller.logoCtrl,
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
                SizedBox(height: responsiveHeight(16)),
                Text(
                  'Thêm đường dẫn poster',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: responsiveFont(16),
                      color: AppColor.black),
                ),
                SizedBox(height: responsiveHeight(16)),
                TextFormField(
                  controller: controller.posterCtrl,
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
                SizedBox(height: responsiveHeight(16)),
                Text(
                  'Chọn nhãn thẻ',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: responsiveFont(16),
                      color: AppColor.black),
                ),
                SizedBox(height: responsiveHeight(16)),
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
                                ? AppColor.secondary
                                : AppColor.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: controller.checkTag(tags[index]) == true
                                  ? AppColor.secondary
                                  : AppColor.border,
                            ),
                          ),
                          child: Text(tags[index]),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: responsiveHeight(16)),
                Text(
                  'Loại nhà hàng',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: responsiveFont(16),
                      color: AppColor.black),
                ),
                SizedBox(height: responsiveHeight(16)),
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
                                    ? AppColor.secondary
                                    : AppColor.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: controller.checkTag(tags[index]) == true
                                  ? AppColor.secondary
                                  : AppColor.border,
                            ),
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
