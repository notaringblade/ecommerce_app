import 'package:ecommerce_app/models/product_model.dart';
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 4),
      child: Card(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
        elevation: 4,
        child: Description(product: product),
      ),
    );
  }
}
