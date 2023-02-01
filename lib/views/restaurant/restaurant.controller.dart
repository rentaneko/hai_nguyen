import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hai_nguyen/@share/constants/url.constant.dart';
import 'package:hai_nguyen/@share/utils/utils.dart';
import 'package:hai_nguyen/model/restaurant.model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class RestaurantController extends GetxController {
  var isLoading = true.obs;

  var listRestaurant = <Restaurant>[].obs;

  var tags = <String>[].obs;
  var category = <String>[].obs;

  late SharedPreferences _preferences;

  late TextEditingController nameResCtrl;
  late TextEditingController locationCtrl;
  late TextEditingController distanceCtrl;

  Future<void> addFoodToRestaurant() async {
    _preferences = await SharedPreferences.getInstance();
    var url = Uri.https(BASE_URL, '/api/food/addFoodId');
    var response = await http.post(
      url,
      headers: {AUTHORIZATION: '$BEARER${_preferences.getString(TOKEN)}'},
      body: jsonEncode(
        <String, dynamic>{
          "restaurantId": "63a73fa3fd177603e0f2f403",
          "name": "Combo Burger",
          "price": 87000,
          "image": "D5",
          "category": "Combo Burger",
          "description": "Combo Cơm Gà Rán",
          "ingredients":
              "1 Burger Zinger/Burger Gà Quay Flava/Burger Tôm + 1 Miếng Gà Rán + 1 Lon Pepsi"
        },
      ),
    );
    if (response.statusCode == 200) {
      print('STATUS: ${jsonDecode(response.body)['message']}');
    } else {
      log('STATUS: ${response.statusCode}');
      print(response.request);
      print(
        jsonEncode(
          <String, dynamic>{
            "restaurantId": "63a73fa3fd177603e0f2f403",
            "name": "Combo Burger",
            "price": 87000,
            "image": "D5",
            "category": "Combo Burger",
            "description": "Combo Cơm Gà Rán",
            "ingredients":
                "1 Burger Zinger/Burger Gà Quay Flava/Burger Tôm + 1 Miếng Gà Rán + 1 Lon Pepsi"
          },
        ),
      );
    }
  }

  Future<void> addRestaurant() async {
    showLoading('Đang thêm vào hệ thống');
    _preferences = await SharedPreferences.getInstance();
    var url = Uri.parse('$BASE_URL/api/restaurant/addRestaurantId');

    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        AUTHORIZATION: '$BEARER${_preferences.getString(TOKEN)}'
      },
      body: jsonEncode(
        <String, dynamic>{
          "name": nameResCtrl.text.trim(),
          "type": "Restaurant",
          "tags": tags.toList(),
          "location": locationCtrl.text.trim(),
          "distance": distanceCtrl.text.trim(),
          "time": 30,
          "images": {"logo": "kfc", "poster": "kfc", "cover": "kfc"},
          "categories": category.toList(),
        },
      ),
    );
    if (response.statusCode == 200) {
      hideLoading();
      goBack();
      showToast('Thêm nhà hàng thành công');
    } else {
      hideLoading();
      log('STATUS: ${response.statusCode}');
    }
  }

  void addTag(String value) {
    if (tags.isEmpty) {
      tags.add(value);
    } else {
      for (var tag in tags) {
        if (value != tag) {
          tags.add(value);
          break;
        }
      }
    }
  }

  void removeTag(String value) {
    if (tags.isNotEmpty) {
      for (var i = 0; i < tags.length; i++) {
        if (tags[i] == value) {
          tags.removeAt(i);
          break;
        }
      }
    }
  }

  bool checkTag(String value) {
    var check = false.obs;
    for (var tag in tags) {
      if (value == tag) {
        check.value = true;
        break;
      }
    }
    return check.value;
  }

  void addCate(String value) {
    if (category.isEmpty) {
      category.add(value);
    } else {
      for (var cate in category) {
        if (value != cate) {
          category.add(value);
          break;
        }
      }
    }
  }

  void removeCate(String value) {
    if (category.isNotEmpty) {
      for (var i = 0; i < category.length; i++) {
        if (category[i] == value) {
          category.removeAt(i);
          break;
        }
      }
    }
  }

  bool checkCate(String value) {
    var check = false.obs;
    for (var cate in category) {
      if (value == cate) {
        check.value = true;
        break;
      }
    }
    return check.value;
  }

  @override
  void onInit() {
    nameResCtrl = TextEditingController();
    locationCtrl = TextEditingController();
    distanceCtrl = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    nameResCtrl.dispose();
    locationCtrl.dispose();
    distanceCtrl.dispose();
    super.onClose();
  }
}
