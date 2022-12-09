import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/widgets/homePageWidgets/categories.dart';
import 'package:ecommerce_app/widgets/productScreenWidgets/description.dart';
import 'package:flutter/material.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Description(product: product);
  }
}


