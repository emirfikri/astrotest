part of 'allcategory_bloc.dart';

abstract class AllcategoryState extends Equatable {
  const AllcategoryState();

  @override
  List<Object> get props => [];
}

class AllcategoryInitial extends AllcategoryState {}

class AllcategoryLoading extends AllcategoryState {}

class FoodCategoryLoaded extends AllcategoryState {
  final List<FoodCategory>? foodCategory;
  const FoodCategoryLoaded(this.foodCategory);
}

class CategoryError extends AllcategoryState {
  final String? message;
  const CategoryError(this.message);
}

class DrinkCategoryLoaded extends AllcategoryState {
  final List<DrinkCategory>? drinkCategory;
  const DrinkCategoryLoaded(this.drinkCategory);
}
