import 'dart:convert';
import 'dart:developer';
import 'package:hai_nguyen/@share/constants/url.constant.dart';
import 'package:hai_nguyen/@share/constants/value.constant.dart';
import 'package:hai_nguyen/@share/utils/utils.dart';
import 'package:hai_nguyen/model/food.model.dart';
import 'package:hai_nguyen/model/restaurant.model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FoodController extends GetxController {
  late TextEditingController nameCtrl;
  late TextEditingController price;
  late TextEditingController description;
  late TextEditingController ingredients;
  late TextEditingController image;
  late SharedPreferences _pref;

  var listRestaurant = <Restaurant>[].obs;
  var listFood = <Food>[].obs;
  var selectedCategory = ''.obs;
  var selectedRestaurant = Restaurant().obs;

  var isLoading = true.obs;
  var isLoadingFood = true.obs;

  @override
  void onInit() {
    nameCtrl = TextEditingController();
    price = TextEditingController();
    selectedCategory.value = categories[0];
    description = TextEditingController();
    ingredients = TextEditingController();
    image = TextEditingController();

    Future.wait(
      [
        getAllRestaurant(),
      ],
    ).then((_) {
      isLoading.value = false;
      getFoodOfRestaurant().then((_) => isLoadingFood.value = false);
    });
    super.onInit();
  }

  @override
  void onClose() {
    nameCtrl.dispose();
    price.dispose();
    description.dispose();
    ingredients.dispose();
    image.dispose();

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
          "restaurantId": selectedRestaurant.value.id,
          "name": nameCtrl.text.trim(),
          "price": int.parse(price.text.trim()),
          "image": image.text.trim(),
          "category": selectedCategory.value.trim(),
          "description": description.text.trim(),
          "ingredients":
              ingredients.text.isEmpty ? '' : ingredients.text.trim(),
        },
      ),
    );
    if (response.statusCode == 200) {
      getFoodOfRestaurant();
      goBack();
    } else {
      log('STATUS: ${response.statusCode}');
    }
  }

  Future<void> getAllRestaurant() async {
    _pref = await SharedPreferences.getInstance();
    var url = Uri.parse('$BASE_URL/api/restaurant');

    var res = await http.post(
      url,
      headers: {
        'Content-type': CONTENT_TYPE,
        AUTHORIZATION: '$BEARER${_pref.getString(TOKEN)}',
      },
    );

    if (res.statusCode == 200) {
      if (jsonDecode(res.body)['data'] != null) {
        var tmp = jsonDecode(res.body)['data'] as List;
        for (var i = 0; i < tmp.length; i++) {
          Restaurant restaurant = Restaurant();
          restaurant.id = tmp[i]['_id'];
          restaurant.name = tmp[i]['name'];
          restaurant.type = tmp[i]['type'];
          restaurant.tags = List.from(tmp[i]['tags'] as List)
              .map((e) => e.toString())
              .toList();
          restaurant.distance = double.parse(tmp[i]['distance'].toString());
          restaurant.time = int.parse(tmp[i]['time'].toString());
          restaurant.categories = List.from(tmp[i]['categories'] as List)
              .map((e) => e.toString())
              .toList();
          listRestaurant.add(restaurant);
        }
        selectedRestaurant.value = listRestaurant[0];
      }
    }
  }

  Future<void> getFoodOfRestaurant() async {
    _pref = await SharedPreferences.getInstance();

    var url =
        Uri.parse('$BASE_URL/api/restaurant/${selectedRestaurant.value.id}');

    var res = await http.post(
      url,
      headers: {
        'Content-type': CONTENT_TYPE,
        AUTHORIZATION: '$BEARER${_pref.getString(TOKEN)}',
      },
    );

    if (res.statusCode == 200) {
      listFood.clear();
      var tmp = jsonDecode(res.body)['data'] as List;
      for (var i = 0; i < tmp.length; i++) {
        Food food = Food(
          id: tmp[i]['_id'],
          category: tmp[i]['category'],
          description: tmp[i]['description'],
          ingredient: tmp[i]['ingredients'],
          name: tmp[i]['name'],
          restaurantId: tmp[i]['restaurantId'],
          image: tmp[i]['image'],
          price: double.parse(tmp[i]['price'].toString()),
        );
        listFood.add(food);
      }
    }
  }

  Future<void> deleteFood(String? foodId) async {
    _pref = await SharedPreferences.getInstance();
    var url = Uri.parse('$BASE_URL/api/food/deleteFood');

    var res = await http.delete(
      url,
      headers: {
        'Content-type': CONTENT_TYPE,
        AUTHORIZATION: '$BEARER${_pref.getString(TOKEN)}',
      },
      body: jsonEncode(<String, String>{
        "foodId": foodId.toString(),
        "restaurantId": selectedRestaurant.value.id.toString(),
      }),
    );

    if (res.statusCode == 200) {
      showToast('Xoá món ăn thành công');
    }
  }
}
