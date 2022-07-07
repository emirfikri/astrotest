class DrinkCategory {
  final String id;
  final String image;
  final String name;

  DrinkCategory(this.id, this.image, this.name);

  DrinkCategory.fromJson(Map<String, dynamic> json)
      : id = json['idDrink'] ?? '',
        image = json['strDrinkThumb'] ?? '',
        name = json['strCategory'] ?? '';

  dynamic toJson() => {'id': id, 'name': name, 'image': image};

  @override
  String toString() {
    return toJson().toString();
  }
}
