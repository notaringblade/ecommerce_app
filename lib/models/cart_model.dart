import 'package:ecommerce_app/models/product_model.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable{
  final List<Product> products;
  const Cart({this.products = const <Product>[]});

  double get subTotal => products.fold(0, (total, current) => total + current.price);

  double get shippingFee => 20;

  double get grandTotal => subTotal + shippingFee;


  String get subTotalString => subTotal.toString();
  String get shippingFeeString => shippingFee.toString();
  String get grandTotalString => grandTotal.toString();


  @override
  // TODO: implement props
  List<Object?> get props => [products];


}

