import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/widgets/common/item_widget.dart';
import 'package:flutter/material.dart';

class GridList extends StatelessWidget {
  final List<Product> products;
  const GridList({
    Key? key,
    required this.products
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 180,
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: .73
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Center(
            child: ProductCard(product: products[index]),
          );
        },
      ),
    );
  }
}