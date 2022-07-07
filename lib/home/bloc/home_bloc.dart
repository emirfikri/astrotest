import 'package:astrotest/home/models/foodcategory_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/drinkcategory_model.dart';
import '../resources/api_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {
      // TODO: implement event handler
    });

    final ApiRepository apiRepository = ApiRepository();

    on<GetFoodCategory>((event, emit) async {
      try {
        emit(HomeLoading());
        final foodcategoryList = await apiRepository.fetchFoodCategory();
        emit(FoodCategoryLoaded(foodcategoryList));
        if (foodcategoryList == null) {
          emit(const HomeError("error fetchFoodCategory"));
        }
      } on NetworkError {
        emit(const HomeError("Failed to fetch data. is your device online?"));
      }
    });
  }
}
