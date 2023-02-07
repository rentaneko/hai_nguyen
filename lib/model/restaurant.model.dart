class Restaurant {
  String? id;
  String? name;
  String? type;
  String? location;
  String? image;
  String? logo;
  String? poster;

  double? distance;
  int? time;

  List<String>? categories;
  List<String>? tags;

  Restaurant({
    this.categories,
    this.id,
    this.location,
    this.name,
    this.tags,
    this.type,
    this.distance,
    this.time,
    this.image,
    this.logo,
    this.poster,
  });
}
