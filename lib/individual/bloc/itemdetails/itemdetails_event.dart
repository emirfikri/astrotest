part of 'itemdetails_bloc.dart';

@immutable
abstract class ItemdetailsEvent extends Equatable {
  const ItemdetailsEvent();

  @override
  List<Object> get props => [];
}

class GetFoodDetailsCache extends ItemdetailsEvent {
  final String id;
  const GetFoodDetailsCache({required this.id});
}

class GetFoodDetails extends ItemdetailsEvent {
  final String id;
  const GetFoodDetails({required this.id});
}

class FoodDetailsErrorState extends ItemdetailsEvent {
  final String message;
  const FoodDetailsErrorState({required this.message});
}
