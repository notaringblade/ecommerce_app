import 'package:ecommerce_app/models/product_model.dart';
import 'package:equatable/equatable.dart';

class History extends Equatable{
  const History();
  
  @override
  // TODO: implement props
  List<Object?> get props => [products];

  static List<Product> products = [];

}