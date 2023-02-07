import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_format_money_vietnam/flutter_format_money_vietnam.dart';
import 'package:get/get.dart';
import 'package:hai_nguyen/@share/styles/color.dart';
import 'package:hai_nguyen/@share/utils/utils.dart';
import 'package:hai_nguyen/views/bill/bill_detail/bill_detail.controller.dart';

class BillDetailPage extends GetWidget<BillDetailController> {
  const BillDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        automaticallyImplyLeading: false,
        title: Text(
          'Chi tiết hoá đơn',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: responsiveFont(36),
            fontWeight: FontWeight.w700,
            color: AppColor.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: responsiveWidth(48)),
        child: ListView(
          children: [
            SizedBox(height: responsiveHeight(16)),
            RichText(
              text: TextSpan(
                text: 'Mã định danh: ',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: responsiveFont(22),
                  fontWeight: FontWeight.w700,
                ),
                children: [
                  TextSpan(
                    text: '${controller.bill.value.id}',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: responsiveFont(22),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: responsiveHeight(16)),
            RichText(
              text: TextSpan(
                text: 'Tên khách hàng: ',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: responsiveFont(22),
                  fontWeight: FontWeight.w700,
                ),
                children: [
                  TextSpan(
                    text: '${controller.bill.value.username}',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: responsiveFont(22),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: responsiveHeight(16)),
            RichText(
              text: TextSpan(
                text: 'Tổng giá trị đơn hàng: ',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: responsiveFont(22),
                  fontWeight: FontWeight.w700,
                ),
                children: [
                  TextSpan(
                    text: '${controller.bill.value.itemsTotal}',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: responsiveFont(22),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: responsiveHeight(16)),
            RichText(
              text: TextSpan(
                text: 'Giảm giá: ',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: responsiveFont(22),
                  fontWeight: FontWeight.w700,
                ),
                children: [
                  TextSpan(
                    text: controller.bill.value.discount.toVND(unit: 'VNĐ'),
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: responsiveFont(22),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: responsiveHeight(16)),
            RichText(
              text: TextSpan(
                text: 'Tổng tiền sau giảm giá: ',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: responsiveFont(22),
                  fontWeight: FontWeight.w700,
                ),
                children: [
                  TextSpan(
                    text: controller.bill.value.grandTotal.toVND(unit: 'VNĐ'),
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: responsiveFont(22),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: responsiveHeight(16)),
            DataTable(
              border: TableBorder.all(color: AppColor.border),
              headingRowColor: MaterialStateProperty.resolveWith<Color>(
                  (states) => AppColor.header),
              columnSpacing: responsiveWidth(74),
              columns: const [
                DataColumn(label: Text('Hình ảnh')),
                DataColumn(label: Text('Tên món ăn')),
                DataColumn(label: Text('Giá tiền')),
                DataColumn(label: Text('Số lượng')),
                DataColumn(label: Text('Tổng tiền')),
              ],
              rows: List<DataRow>.generate(
                controller.bill.value.cartItems!.length,
                (index) => DataRow(
                  cells: [
                    DataCell(
                      SizedBox(
                        height: 75,
                        width: 75,
                        child: Center(
                            child: CachedNetworkImage(
                          imageUrl:
                              '${controller.bill.value.cartItems![index].detail!.image}',
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) => Image.network(
                              'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6c/No_image_3x4.svg/1200px-No_image_3x4.svg.png'),
                        )),
                      ),
                    ),
                    DataCell(Text(
                        '${controller.bill.value.cartItems![index].detail!.name}')),
                    DataCell(Text(controller
                        .bill.value.cartItems![index].detail!.price
                        .toVND(unit: 'VNĐ'))),
                    DataCell(Text(
                        '${controller.bill.value.cartItems![index].quantity}')),
                    DataCell(Text((controller
                                .bill.value.cartItems![index].detail!.price! *
                            controller.bill.value.cartItems![index].quantity!)
                        .toVND(unit: 'VNĐ'))),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
