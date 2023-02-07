import 'package:flutter/material.dart';
import 'package:flutter_format_money_vietnam/flutter_format_money_vietnam.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hai_nguyen/@share/routes/routes.dart';
import 'package:hai_nguyen/@share/styles/color.dart';
import 'package:hai_nguyen/@share/utils/utils.dart';
import 'package:hai_nguyen/views/bill/bill.controller.dart';

class BillPage extends GetWidget<BillController> {
  const BillPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: responsiveHeight(20)),
          Text(
            'Danh sách hoá đơn',
            style: TextStyle(
              color: AppColor.black,
              fontSize: responsiveFont(42),
              fontWeight: FontWeight.w600,
              fontFamily: 'Inter',
            ),
          ),
          SizedBox(height: responsiveHeight(20)),
          Obx(
            () => controller.isLoading.value == true
                ? const Center(child: CircularProgressIndicator())
                : DataTable(
                    border: TableBorder.all(color: AppColor.border),
                    headingRowColor: MaterialStateProperty.resolveWith<Color>(
                        (states) => AppColor.header),
                    columnSpacing: responsiveWidth(74),
                    columns: const [
                      DataColumn(label: Text('Tên khách hàng')),
                      DataColumn(label: Text('Tổng giá trị đơn hàng')),
                      DataColumn(label: Text('Khuyến mãi được giảm')),
                      DataColumn(label: Text('Tổng giá trị cần thanh toán')),
                      DataColumn(label: Text('Quản lý')),
                    ],
                    rows: List<DataRow>.generate(
                      controller.listBill.length,
                      (index) => DataRow(
                        cells: [
                          DataCell(
                              Text('${controller.listBill[index].username}')),
                          DataCell(
                            Text(
                              controller.listBill[index].itemsTotal
                                  .toVND(unit: 'VNĐ'),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          DataCell(
                            Text(
                              controller.listBill[index].discount
                                  .toVND(unit: 'VNĐ'),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          DataCell(
                            Text(
                              controller.listBill[index].grandTotal
                                  .toVND(unit: 'VNĐ'),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          DataCell(
                            ElevatedButton(
                              onPressed: () => goTo(
                                  screen: ROUTE_BILL_DETAIL,
                                  argument: controller.listBill[index]),
                              child: Text(
                                'Xem chi tiết',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: responsiveFont(16),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
