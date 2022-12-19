part of 'history_bloc.dart';

abstract class HistoryEvent extends Equatable {
  const HistoryEvent();

  @override
  List<Object> get props => [];
}

class LoadHistory extends HistoryEvent{
final List <Product> products;

  const LoadHistory({this.products = const <Product>[]});

  @override
  List<Object> get props => [products];
}

class AddHistory extends HistoryEvent{
  final Product product;

  const AddHistory({required this.product});


  @override
  List<Object> get props => [product];

}


