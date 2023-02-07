import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hai_nguyen/@share/styles/color.dart';
import 'package:hai_nguyen/@share/utils/utils.dart';
import 'package:hai_nguyen/views/user/user.controller.dart';

class UserPage extends GetWidget<UserController> {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: responsiveHeight(20)),
          Text(
            'Danh sách khách hàng',
            style: TextStyle(
              color: AppColor.black,
              fontSize: responsiveFont(42),
              fontWeight: FontWeight.w600,
              fontFamily: 'Inter',
            ),
          ),
          SizedBox(height: responsiveHeight(20)),
          // Obx(
          //   () => controller.isLoading.value == true
          //       ? DataTable(
          //           border: TableBorder.all(color: AppColor.border),
          //           headingRowColor: MaterialStateProperty.resolveWith<Color>(
          //               (states) => AppColor.header),
          //           columnSpacing: responsiveWidth(74),
          //           columns: const [
          //             DataColumn(label: Text('Tên nhà hàng')),
          //             DataColumn(label: Text('Loại')),
          //             DataColumn(label: Text('Địa chỉ')),
          //             DataColumn(label: Text('Nhãn dán')),
          //             DataColumn(label: Text('Khoảng cách'), numeric: true),
          //             DataColumn(
          //                 label: Text('Thời gian giao hàng'), numeric: true),
          //             DataColumn(label: Text('Hình ảnh')),
          //           ],
          //           rows: [],
          //         )
          //       : Text(controller.listBill.length.toString()),
          // ),
        ],
      ),
    );
  }
}
