// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:equatable/equatable.dart';

class FoodDetailsModel extends Equatable {
  final String id;
  final String image;
  final String name;
  final String category;
  final String area;
  final String instructions;
  final String tags;
  final String youtubelink;
  final List ingredients;
  final List measure;
  final String source;
  final String imagesource;
  final String creativecommonsconfirmed;
  final String datemodified;
  FoodDetailsModel({
    required this.id,
    required this.image,
    required this.name,
    required this.category,
    required this.area,
    required this.instructions,
    required this.tags,
    required this.youtubelink,
    required this.ingredients,
    required this.measure,
    required this.source,
    required this.imagesource,
    required this.creativecommonsconfirmed,
    required this.datemodified,
  });

  factory FoodDetailsModel.fromJson(Map<String, dynamic> json) {
    final id = json['idMeal'] ?? '';
    final image = json['strMealThumb'] ?? '';
    final name = json['strMeal'] ?? '';
    final category = json['strCategory'] ?? '';
    final area = json['strArea'] ?? '';
    final instructions = json['strInstructions'] ?? '';
    final tags = json['strTags'] ?? '';
    final youtubelink = json['strYoutube'] ?? '';
    final ingredients = [];
    final measure = [];
    for (var i = 1; i < 21; i++) {
      ingredients.add(json['strIngredient$i']);
      measure.add(json['strMeasure$i']);
    }
    final source = json['strSource'] ?? '';
    final imagesource = json['strImageSource'] ?? '';
    final creativecommonsconfirmed = json['strCreativeCommonsConfirmed'] ?? '';
    final datemodified = json['dateModified'] ?? '';
    return FoodDetailsModel(
        id: id,
        name: name,
        image: image,
        category: category,
        area: area,
        instructions: instructions,
        tags: tags,
        youtubelink: youtubelink,
        ingredients: ingredients,
        measure: measure,
        source: source,
        imagesource: imagesource,
        creativecommonsconfirmed: creativecommonsconfirmed,
        datemodified: datemodified);
  }

  dynamic toJson() => {
        'id': id,
        'name': name,
        'image': image,
        'category': category,
        'area': area,
        'instructions': instructions,
        'tags': tags,
        'youtubelink': youtubelink,
        'ingredients': ingredients,
        'measure': measure,
        'source': source,
        'imagesource': imagesource,
        'creativecommonsconfirmed': creativecommonsconfirmed,
        'datemodified': datemodified
      };

  @override
  String toString() {
    return toJson().toString();
  }

  @override
  List<Object> get props => [
        id,
        image,
        name,
        category,
        area,
        instructions,
        tags,
        youtubelink,
        ingredients,
        measure,
        source,
        imagesource,
        creativecommonsconfirmed,
        datemodified
      ];
}
