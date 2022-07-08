part of 'foodselectedcat_bloc.dart';

abstract class FoodselectedcatState extends Equatable {
  const FoodselectedcatState();

  @override
  List<Object> get props => [];
}

class FoodselectedcatInitial extends FoodselectedcatState {}

class FoodselectedcatLoading extends FoodselectedcatState {}

class FoodSelectedCatLoaded extends FoodselectedcatState {
  final List<FoodModel>? foodModel;
  const FoodSelectedCatLoaded(this.foodModel);
}

class FoodSelectedCatError extends FoodselectedcatState {
  final String? message;
  const FoodSelectedCatError(this.message);
}
