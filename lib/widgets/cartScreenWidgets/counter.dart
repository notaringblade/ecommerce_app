import 'package:ecommerce_app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/cart/cart_bloc.dart';

class Counter extends StatefulWidget {
  final Product product;
  final Function refresh;
  const Counter({Key? key, required this.product, required this.refresh})
      : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<CartBloc, CartState>(
      listener: (context, state) {
      },
      child: SizedBox(
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                context.read<CartBloc>().add(RemoveProduct(widget.product));
                widget.refresh();
              },
              icon: const Icon(Icons.delete_forever_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
