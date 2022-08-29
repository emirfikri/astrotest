import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'itemdetailsingredient_event.dart';
part 'itemdetailsingredient_state.dart';

class ItemdetailsingredientBloc extends Bloc<ItemdetailsingredientEvent, ItemdetailsingredientState> {
  ItemdetailsingredientBloc() : super(ItemdetailsingredientInitial()) {
    on<ItemdetailsingredientEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
