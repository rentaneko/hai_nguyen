import 'dart:convert';
import 'dart:developer';
import 'dart:math';

import 'package:get/get.dart';
import 'package:hai_nguyen/@share/constants/url.constant.dart';
import 'package:hai_nguyen/model/bill.model.dart';
import 'package:hai_nguyen/model/cartItem.model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BillController extends GetxController {
  var listBill = <Bill>[].obs;
  var isLoading = true.obs;

  late SharedPreferences _pref;

  @override
  void onInit() {
    getAllBill();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getAllBill() async {
    var url = Uri.parse('$BASE_URL/api/bill/getBill');
    _pref = await SharedPreferences.getInstance();
    var res = await http.post(
      url,
      headers: {
        'Content-type': CONTENT_TYPE,
        AUTHORIZATION: '$BEARER${_pref.getString(TOKEN)}',
      },
    );

    if (res.statusCode == 200) {
      if (jsonDecode(res.body)['status'].toString().toLowerCase() == 'failed') {
        print('bug');
      } else {
        var tmp = jsonDecode(res.body)['data'] as List;
        listBill.clear();
        for (var i = 0; i < tmp.length; i++) {
          Bill item = Bill();
          item.id = tmp[i]['_id'];
          item.itemsTotal = tmp[i]['itemsTotal'];
          item.grandTotal = tmp[i]['grandTotal'];
          item.discount = tmp[i]['discount'];
          item.username = tmp[i]['username'];
          item.cartItems = List.from(tmp[i]['cartItems'] as List)
              .map((e) => CartItem.fromJson(e))
              .toList();
          listBill.add(item);
        }
        isLoading.value = false;
      }
    }
  }
}
