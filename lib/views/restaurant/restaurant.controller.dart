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
  late TextEditingController pictureCtrl;

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
          "images": {
            "logo": pictureCtrl.text.trim(),
            "poster": pictureCtrl.text.trim(),
            "cover": pictureCtrl.text.trim(),
          },
          "categories": category.toList(),
        },
      ),
    );
    if (response.statusCode == 200) {
      hideLoading();
      listRestaurant.clear();
      getAllRestaurant();
      goBack();
      showToast('Thêm nhà hàng thành công');
    } else {
      hideLoading();
      log('STATUS: ${response.statusCode}');
    }
  }

  Future<void> getAllRestaurant() async {
    _preferences = await SharedPreferences.getInstance();
    var url = Uri.parse('$BASE_URL/api/restaurant');

    var res = await http.post(
      url,
      headers: {
        'Content-type': CONTENT_TYPE,
        AUTHORIZATION: '$BEARER${_preferences.getString(TOKEN)}',
      },
    );

    if (res.statusCode == 200) {
      var tmp = jsonDecode(res.body)['data'] as List;
      for (var i = 0; i < tmp.length; i++) {
        Restaurant restaurant = Restaurant();
        restaurant.id = tmp[i]['_id'];
        restaurant.name = tmp[i]['name'];
        restaurant.type = tmp[i]['type'];
        restaurant.tags =
            List.from(tmp[i]['tags'] as List).map((e) => e.toString()).toList();
        restaurant.distance = double.parse(tmp[i]['distance'].toString());
        restaurant.time = int.parse(tmp[i]['time'].toString());
        restaurant.categories = List.from(tmp[i]['categories'] as List)
            .map((e) => e.toString())
            .toList();
        listRestaurant.add(restaurant);
      }
      isLoading.value = false;
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
    pictureCtrl = TextEditingController();
    getAllRestaurant();
    super.onInit();
  }

  @override
  void onClose() {
    nameResCtrl.dispose();
    locationCtrl.dispose();
    distanceCtrl.dispose();
    pictureCtrl.dispose();
    super.onClose();
  }
}
