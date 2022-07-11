part of 'foodselectedcat_bloc.dart';

abstract class FoodselectedcatEvent extends Equatable {
  const FoodselectedcatEvent();

  @override
  List<Object> get props => [];
}

class GetFoodSelectedcat extends FoodselectedcatEvent {
  final String selectedCat;

  const GetFoodSelectedcat({required this.selectedCat});
}

class GetNullcat extends FoodselectedcatEvent {}
