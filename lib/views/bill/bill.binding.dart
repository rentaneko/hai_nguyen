import 'package:get/instance_manager.dart';
import 'package:hai_nguyen/views/bill/bill.controller.dart';

class BillBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BillController());
  }
}
