part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class FoodCategoryLoaded extends HomeState {
  final List<FoodCategory>? foodCategory;
  const FoodCategoryLoaded(this.foodCategory);
}

class DrinkCategoryLoaded extends HomeState {
  final List<DrinkCategory>? drinkCategory;
  const DrinkCategoryLoaded(this.drinkCategory);
}

class HomeError extends HomeState {
  final String? message;
  const HomeError(this.message);
}
