part of 'allcategory_bloc.dart';

abstract class AllcategoryEvent extends Equatable {
  const AllcategoryEvent();

  @override
  List<Object> get props => [];
}

class GetFoodCategory extends AllcategoryEvent {}

class GetDrinkCategory extends AllcategoryEvent {}
