class FoodModel {
  final String id;
  final String image;
  final String name;
  FoodModel(
    this.id,
    this.image,
    this.name,
  );

  FoodModel.fromJson(Map<String, dynamic> json)
      : id = json['idMeal'] ?? '',
        image = json['strMealThumb'] ?? '',
        name = json['strMeal'] ?? '';

  dynamic toJson() => {'id': id, 'name': name, 'image': image};

  @override
  String toString() {
    return toJson().toString();
  }
}
