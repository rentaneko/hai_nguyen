import 'dart:convert';

import 'package:get/get.dart';
import 'package:hai_nguyen/@share/constants/url.constant.dart';
import 'package:hai_nguyen/model/account.model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController {
  var listAccount = <Account>[].obs;
  var isLoading = true.obs;

  late SharedPreferences _preferences;

  @override
  void onInit() {
    getAllAccount().then((_) => isLoading.value = false);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getAllAccount() async {
    var url = Uri.parse('$BASE_URL/api/all-user');
    _preferences = await SharedPreferences.getInstance();
    var response = await http.post(
      url,
      headers: {
        'Content-type': CONTENT_TYPE,
        AUTHORIZATION: '$BEARER${_preferences.getString(TOKEN)}',
      },
    );

    if (response.statusCode == 200) {
      var tmp = jsonDecode(response.body)['data'] as List;
      listAccount.clear();
      for (var i = 0; i < tmp.length; i++) {
        Account account = Account();
        account.id = tmp[i]['_id'];
        account.username = tmp[i]['username'];
        account.email = tmp[i]['email'];
        listAccount.add(account);
      }
    }
  }
}
