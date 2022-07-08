import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/food_model.dart';
import '../../resources/api_repository.dart';

part 'foodselectedcat_event.dart';
part 'foodselectedcat_state.dart';

class FoodselectedcatBloc
    extends Bloc<FoodselectedcatEvent, FoodselectedcatState> {
  FoodselectedcatBloc() : super(FoodselectedcatInitial()) {
    on<FoodselectedcatEvent>((event, emit) {
      // TODO: implement event handler
    });

    final ApiRepository apiRepository = ApiRepository();

    on<GetFoodSelectedcat>((event, emit) async {
      try {
        emit(FoodselectedcatLoading());
        final foodModelList = await apiRepository
            .fetchFoodModelSelectedCategory(category: event.selectedCat);
        emit(FoodSelectedCatLoaded(foodModelList));
        if (foodModelList == null) {
          emit(const FoodSelectedCatError("error fetch Selected category"));
        }
      } on NetworkError {
        emit(const FoodSelectedCatError(
            "Failed to fetch data. is your device online?"));
      }
    });
  }
}
