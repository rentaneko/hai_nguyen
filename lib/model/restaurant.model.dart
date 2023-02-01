class Restaurant {
  String? id;
  String? name;
  String? type;
  String? location;

  List<String>? categories;
  List<String>? tags;

  Restaurant(
      {this.categories,
      this.id,
      this.location,
      this.name,
      this.tags,
      this.type});

  Restaurant.fromJson(dynamic json) {
    id = json['_id'] == null ? null : json['_id'] as String;
    name = json['name'] == null ? null : json['name'] as String;
    type = json['type'] == null ? null : json['type'] as String;
    location = json['location'] == null ? null : json['location'] as String;
    categories = json['categories'] == null
        ? null
        : List.from(json['categories'] as List)
            .map((e) => e.toString())
            .toList();
    tags = json['tags'] == null
        ? null
        : List.from(json['tags'] as List).map((e) => e.toString()).toList();
  }
}
