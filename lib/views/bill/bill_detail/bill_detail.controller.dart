import 'package:get/get.dart';
import 'package:hai_nguyen/@share/utils/utils.dart';
import 'package:hai_nguyen/model/bill.model.dart';

class BillDetailController extends GetxController {
  var bill = Bill().obs;

  @override
  void onInit() {
    bill.value = getArgument() as Bill;
    super.onInit();
  }
}
