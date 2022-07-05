import 'package:astrotest/blocs/bloc_export.dart';
import 'package:astrotest/model/fooddetails_model.dart';
import 'package:astrotest/services/api_services.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'itemdetails_event.dart';
part 'itemdetails_state.dart';

class ItemdetailsBloc extends Bloc<ItemdetailsEvent, ItemdetailsState> {
  String? id;
  ItemdetailsBloc({this.id}) : super(const ItemdetailsState()) {
    on<AddFoodDetails>(onAddFoodDetails);
    on<UpdateFoodDetails>(onUpdateFoodDetails);
    on<DeleteFoodDetails>(onDeleteFoodDetails);
    on<GetFoodDetails>(onGetFoodDetails);
  }

  void onGetFoodDetails(
      GetFoodDetails event, Emitter<ItemdetailsState> emit) async {
    try {
      emit(ItemDetailsLoading());
      var detailsItem1;
      var rawdata = await ApiService().getApiData(
          "https://www.themealdb.com/api/json/v1/1/lookup.php?i=${id}");
      var responseData = rawdata['meals'];
      detailsItem1 =
          responseData.map((e) => FoodDetailsModel.fromJson(e)).toList();
      var detailsItem = detailsItem1[0];

      emit(ItemDetailsLoaded(foodDetail: detailsItem));

      //add item to cache

    } catch (e) {
      print("error ${e.toString()}");
    }
  }

  void onAddFoodDetails(AddFoodDetails event, Emitter<ItemdetailsState> emit) {
    final state = this.state;
    emit(ItemdetailsState(
        allFoodDetail: List.from(state.allFoodDetail)..add(event.foodDetails)));
    emit(FinishAddnewData(foodDetail: event.foodDetails));
  }

  void onUpdateFoodDetails(
      UpdateFoodDetails event, Emitter<ItemdetailsState> emit) {}

  void onDeleteFoodDetails(
      DeleteFoodDetails event, Emitter<ItemdetailsState> emit) {}
}
