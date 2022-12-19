part of 'history_bloc.dart';

abstract class HistoryState extends Equatable {
  const HistoryState();
  
  @override
  List<Object> get props => [];
}

class HistoryLoading extends HistoryState {

}

class HistoryLoaded extends HistoryState {
  final List <Product> products;

  const HistoryLoaded({this.products = const <Product>[
    
  ]});

@override
  List<Object> get props => [products];

}
