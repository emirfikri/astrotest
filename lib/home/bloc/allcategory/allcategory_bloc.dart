import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/drinkcategory_model.dart';
import '../../models/foodcategory_model.dart';
import '../../resources/api_repository.dart';

part 'allcategory_event.dart';
part 'allcategory_state.dart';

class AllcategoryBloc extends Bloc<AllcategoryEvent, AllcategoryState> {
  AllcategoryBloc() : super(AllcategoryInitial()) {
    on<AllcategoryEvent>((event, emit) {
      // TODO: implement event handler
    });

    final ApiRepository apiRepository = ApiRepository();

    on<GetFoodCategory>((event, emit) async {
      try {
        emit(AllcategoryLoading());
        final foodcategoryList = await apiRepository.fetchFoodCategory();
        emit(FoodCategoryLoaded(foodcategoryList));
        if (foodcategoryList == null) {
          emit(const CategoryError("error fetchFoodCategory"));
        }
      } on NetworkError {
        emit(const CategoryError(
            "Failed to fetch data. is your device online?"));
      }
    });

    on<GetDrinkCategory>((event, emit) async {
      try {
        emit(AllcategoryLoading());
        final drinkcategoryList = await apiRepository.fetchDrinkCategory();
        emit(DrinkCategoryLoaded(drinkcategoryList));
        if (drinkcategoryList == null) {
          emit(const CategoryError("error fetchDrinkCategory"));
        }
      } on NetworkError {
        emit(const CategoryError(
            "Failed to fetch data. is your device online?"));
      }
    });
  }
}
