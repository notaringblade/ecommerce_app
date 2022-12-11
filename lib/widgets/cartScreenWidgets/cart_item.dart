import 'package:cart_stepper/cart_stepper.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/widgets/cartScreenWidgets/cart_item_info.dart';
import 'package:flutter/material.dart';
import 'package:counter_button/counter_button.dart';

class CartItem extends StatelessWidget {
  final Product product;
  CartItem({Key? key, required this.product}) : super(key: key);

  int _counterLimit = 1;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/productScreen', arguments: product);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white,
            ),
            height: 100,
            child: Container(
              child: CartItemInfo(product: product),
            )),
      ),
    );
  }
}
