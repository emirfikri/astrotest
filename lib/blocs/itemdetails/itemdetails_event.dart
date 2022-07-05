part of 'itemdetails_bloc.dart';

@immutable
abstract class ItemdetailsEvent extends Equatable {
  const ItemdetailsEvent();

  @override
  List<Object> get props => [];
}

class AddFoodDetails extends ItemdetailsEvent {
  final FoodDetailsModel foodDetails;
  const AddFoodDetails({required this.foodDetails});

  @override
  List<Object> get props => [foodDetails];
}

class GetFoodDetails extends ItemdetailsEvent {}

class GetCacheFoodDetails extends ItemdetailsEvent {}

class FoodDetailsErrorState extends ItemdetailsEvent {
  final String message;
  const FoodDetailsErrorState({required this.message});
  @override
  List<Object> get props => [];
}

class UpdateFoodDetails extends ItemdetailsEvent {
  final FoodDetailsModel foodDetails;
  const UpdateFoodDetails({required this.foodDetails});

  @override
  List<Object> get props => [foodDetails];
}

class DeleteFoodDetails extends ItemdetailsEvent {
  final FoodDetailsModel foodDetails;
  const DeleteFoodDetails({required this.foodDetails});

  @override
  List<Object> get props => [foodDetails];
}
