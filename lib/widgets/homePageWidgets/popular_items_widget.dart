import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/widgets/item_widget.dart';
import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
  final List<Product> products;
  const ItemList({
    Key? key,
    required this.products
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      // children: [
      //   Text("Popular Items", style: TextStyle(color: Colors.black),),
        child: ListView.builder(
    // Create a grid with 2 columns. If you change the scrollDirection to
    // horizontal, this produces 2 rows.
    itemCount: products.length,
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index) {
      

      return Padding(
        // child: Text(
        //   'Item $index',
        //   style: TextStyle(color: Colors.black)
        // ),
        padding: EdgeInsets.only(right: 5.0, left: 5.0),
        child: ProductCard(product: products[index]),
        
      );
    },
    // Generate 100 widgets that display their index in the List.
    // children: List.generate(products.length, (index) {
    // }),
    )
      // ],
    );
  }
}