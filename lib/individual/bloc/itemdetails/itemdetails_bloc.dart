import 'package:astrotest/individual/bloc/bloc_export.dart';
import 'package:astrotest/services/api_services.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../models/fooddetails_model.dart';
import '../../resources/api_repository.dart';

part 'itemdetails_event.dart';
part 'itemdetails_state.dart';

class ItemdetailsBloc extends Bloc<ItemdetailsEvent, ItemdetailsState> {
  ItemdetailsBloc() : super(const ItemdetailsState()) {
    final ApiRepository apiRepository = ApiRepository();

    on<GetFoodDetailsCache>((event, emit) async {
      final detailsItem =
          await apiRepository.fetchFoodDetailsCache(id: event.id);
      emit(ItemDetailshasCache(foodDetail: detailsItem));
      if (detailsItem == null) {
        emit(const ItemDetailsError(message: "error no cache"));
      }
    });

    on<GetFoodDetails>((event, emit) async {
      try {
        emit(ItemDetailsLoading());
        final detailsItem = await apiRepository.fetchFoodDetails(id: event.id);
        await apiRepository.saveFoodDetailsCache(
            id: event.id, data: detailsItem!);
        emit(ItemDetailsLoaded(foodDetail: detailsItem));
        if (detailsItem == null) {
          emit(
              const ItemDetailsError(message: "error fetch Selected category"));
        }
      } on NetworkError {
        emit(const ItemDetailsError(
            message: "Failed to fetch data. is your device online?"));
      } catch (e) {
        print("error ${e.toString()}");
      }
    });
  }
}
