import 'package:ecommerce_app/config/theme.dart';
import 'package:ecommerce_app/widgets/cartScreenWidgets/cart_item.dart';
import 'package:ecommerce_app/widgets/cartScreenWidgets/cart_subtotak.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cart/cart_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Column(
        children: [
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state is CartLoaded) {
                return  SizedBox(
                  height: 330,
                  child: ListView.builder(
                    itemCount: state.cart.products.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: CartItem(
                          product: state.cart.products[index],
                          refresh: refresh,
                        ),
                      );
                    },
                  ),
                );
              } else if (state is CartLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                );
              } else {
                return Center(
                  child: Text(
                    "Error",
                    style: theme().textTheme.displayMedium,
                  ),
                );
              }
            },
          ),
          const Divider(
            color: Colors.black,
            thickness: 2,
            indent: 40,
            endIndent: 40,
          ),
           const CartTotal()
        ],
      ),
    );
  }
}
