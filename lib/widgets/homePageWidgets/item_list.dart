import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/widgets/common/item_widget.dart';
import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
  final List<Product> products;
  final int itemCount;
  const ItemList({
    Key? key,
    this.itemCount = 3,
    required this.products
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView.builder(
    itemCount: itemCount,
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index) {
      

      return Padding(
        padding: EdgeInsets.only(right: 4.0, left: 0.0),
        child: ProductCard(product: products[index]),
        
      );
    },
    )
      // ],
    );
  }
}