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
      backgroundColor: AppColor.background,
      body: Container(
        color: AppColor.white,
        padding: EdgeInsets.symmetric(horizontal: responsiveWidth(32)),
        child: ListView(
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
            Obx(
              () => controller.isLoading.value == false
                  ? DataTable(
                      border: TableBorder.all(color: AppColor.border),
                      headingRowColor: MaterialStateProperty.resolveWith<Color>(
                          (states) => AppColor.header),
                      columnSpacing: responsiveWidth(74),
                      columns: const [
                        DataColumn(label: Text('Mã định danh')),
                        DataColumn(label: Text('Tên khách hàng')),
                        DataColumn(label: Text('Email')),
                      ],
                      rows: List<DataRow>.generate(
                        controller.listAccount.length,
                        (index) => DataRow(
                          cells: [
                            DataCell(
                                Text('${controller.listAccount[index].id}')),
                            DataCell(Text(controller.listAccount[index].username
                                .toString())),
                            DataCell(Text(controller.listAccount[index].email
                                .toString())),
                          ],
                        ),
                      ),
                    )
                  : const Center(child: CircularProgressIndicator()),
            ),
          ],
        ),
      ),
    );
  }
}
