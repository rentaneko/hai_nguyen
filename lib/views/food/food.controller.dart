import 'dart:convert';
import 'dart:developer';
import 'package:hai_nguyen/@share/constants/url.constant.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FoodController extends GetxController {
  late TextEditingController nameCtrl;
  late TextEditingController price;
  late TextEditingController category;
  late TextEditingController description;
  late TextEditingController ingredients;
  late SharedPreferences _pref;

  @override
  void onInit() {
    nameCtrl = TextEditingController();
    price = TextEditingController();
    category = TextEditingController();
    description = TextEditingController();
    ingredients = TextEditingController();

    super.onInit();
  }

  @override
  void onClose() {
    nameCtrl.dispose();
    price.dispose();
    category.dispose();
    description.dispose();
    ingredients.dispose();

    super.onClose();
  }

  Future<void> addFood() async {
    _pref = await SharedPreferences.getInstance();
    var url = Uri.parse('$BASE_URL/api/food/addFoodId');
    var response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        AUTHORIZATION: '$BEARER${_pref.getString(TOKEN)}',
      },
      body: jsonEncode(
        <String, dynamic>{
          "restaurantId": "63a73fa3fd177603e0f2f403",
          "name": nameCtrl.text.trim(),
          "price": int.parse(price.text.trim()),
          "image": "D5",
          "category": category.text.trim(),
          "description": description.text.trim(),
          "ingredients":
              ingredients.text.isEmpty ? '' : ingredients.text.trim(),
        },
      ),
    );
    if (response.statusCode == 200) {
      print('STATUS: ${jsonDecode(response.body)['message']}');
    } else {
      log('STATUS: ${response.statusCode}');
    }
  }
}
