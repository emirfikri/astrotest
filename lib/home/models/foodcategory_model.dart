class FoodCategory {
  final String? id;
  final String? image;
  final String? name;
  final String? description;
  FoodCategory(this.id, this.image, this.name, this.description);

  String withError(String errorMessage) => errorMessage;

  FoodCategory.fromJson(Map<String, dynamic> json)
      : id = json['idCategory'] ?? '',
        image = json['strCategoryThumb'] ?? '',
        name = json['strCategory'] ?? '',
        description = json['strCategoryDescription'] ?? '';

  dynamic toJson() =>
      {'id': id, 'name': name, 'image': image, 'description': description};

  @override
  String toString() {
    return toJson().toString();
  }
}
