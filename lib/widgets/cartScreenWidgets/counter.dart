import 'package:ecommerce_app/models/cart_model.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/pages/cartScreen.dart';
import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  final Product product;
  final Function refresh;
  const Counter({
    Key? key,
    required this.product,
    required this.refresh
  }) : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Cart.products.remove(widget.product);
                widget.refresh();
              },
              icon: const Icon(Icons.delete_forever_outlined),
            ),
          ],
        ),
      );
  }
}