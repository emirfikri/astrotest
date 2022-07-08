part of 'itemdetails_bloc.dart';

@immutable
class ItemdetailsState extends Equatable {
  final List<FoodDetailsModel> allFoodDetail;

  const ItemdetailsState({this.allFoodDetail = const <FoodDetailsModel>[]});

  @override
  List<Object> get props => [allFoodDetail];
}

class ItemdetailsInitial extends ItemdetailsState {}

class ItemDetailsLoading extends ItemdetailsState {}

class ItemDetailshasCache extends ItemdetailsState {
  final String id;
  const ItemDetailshasCache(this.id);

  get currentid => id;
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

// class CovidLoaded extends CovidState {
  // final CovidModel covidModel;
  // const CovidLoaded(this.covidModel);
// }