import 'package:hai_nguyen/model/food.model.dart';

class CartItem {
  String? id;
  String? username;
  int? quantity;
  Food? detail;

  CartItem({this.detail, this.id, this.quantity, this.username});

  CartItem.fromJson(dynamic json) {
    id = json['_id'] as String;
    username = json['username'] as String;
    quantity = int.parse(json['quantity'].toString());
    detail = Food.fromJson(json['food']);
  }
}
