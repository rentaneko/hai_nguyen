import 'package:hai_nguyen/model/cartItem.model.dart';

class Bill {
  String? id;
  String? username;
  double? itemsTotal;
  double? grandTotal;
  double? discount;
  List<CartItem>? cartItems;

  Bill({
    this.cartItems,
    this.discount,
    this.grandTotal,
    this.id,
    this.itemsTotal,
    this.username,
  });
}
