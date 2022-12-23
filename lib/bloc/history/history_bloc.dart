import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:equatable/equatable.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc() : super(HistoryLoading()) {
    on<LoadHistory>(_onLoadHistory);
    on<AddHistory>(_onAddHistory);
  }

  void _onLoadHistory(LoadHistory event, Emitter<HistoryState> emit) {
    emit(
      HistoryLoaded(products: event.products),
    );
  }

  void _onAddHistory(AddHistory event, Emitter<HistoryState> emit) {
    final state = this.state;

    if (state is HistoryLoaded) {
      if(!state.products.contains(event.product)){
        
      emit(HistoryLoaded(
        products: List.from(state.products)..insert(0,event.product),
      ));
      }
      // print("${event.product.name}");
      // print("${state.products}");
    }
  }
}
