import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hai_nguyen/views/bill/bill.controller.dart';

class BillPage extends GetWidget<BillController> {
  const BillPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Obx(
            () => controller.isLoading.value == true
                ? const Center(child: CircularProgressIndicator())
                : Text(controller.listBill.length.toString()),
          ),
          ElevatedButton(
            onPressed: () => controller.getAllBill(),
            child: Text('Test'),
          ),
        ],
      ),
    );
  }
}
