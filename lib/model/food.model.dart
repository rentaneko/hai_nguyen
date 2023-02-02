class Food {
  String? id;
  String? restaurantId;
  String? name;
  String? image;
  String? category;
  String? description;
  String? ingredient;
  double? price;

  Food({
    this.category,
    this.description,
    this.id,
    this.image,
    this.ingredient,
    this.name,
    this.price,
    this.restaurantId,
  });

  Food.fromJson(dynamic json) {
    id = json['_id'] as String;
    restaurantId = json['restaurantId'] as String;
    name = json['name'] as String;
    image = json['image'] as String;
    category = json['category'] as String;
    description = json['description'] as String;
    ingredient = json['ingredients'] as String;
    price = double.parse(json['price'].toString());
  }
}
