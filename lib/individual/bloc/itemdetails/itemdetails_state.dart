part of 'itemdetails_bloc.dart';

@immutable
class ItemdetailsState extends Equatable {
  final List<FoodDetailsModel> allFoodDetail;

  const ItemdetailsState({this.allFoodDetail = const <FoodDetailsModel>[]});

  @override
  List<Object> get props => [allFoodDetail];
}

class ItemDetailsLoading extends ItemdetailsState {}

class ItemDetailshasCache extends ItemdetailsState {
  final FoodDetailsModel? foodDetail;
  const ItemDetailshasCache({this.foodDetail});
}

class ItemDetailsGetFromServer extends ItemdetailsState {}

class ItemDetailsLoaded extends ItemdetailsState {
  final FoodDetailsModel foodDetail;
  const ItemDetailsLoaded({required this.foodDetail});

  @override
  List<Object> get props => [foodDetail];
}

class AddItemDetails extends ItemdetailsState {
  final FoodDetailsModel foodDetail;
  const AddItemDetails({required this.foodDetail});

  @override
  List<Object> get props => [foodDetail];
}

class FinishAddnewData extends ItemdetailsState {
  final FoodDetailsModel foodDetail;
  const FinishAddnewData({required this.foodDetail});

  @override
  List<Object> get props => [foodDetail];
}

class ItemDetailsError extends ItemdetailsState {
  final String? message;
  const ItemDetailsError({this.message});
}
