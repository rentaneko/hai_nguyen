import 'package:get/get.dart';
import 'package:hai_nguyen/views/bill/bill_detail/bill_detail.controller.dart';

class BillDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BillDetailController());
  }
}
