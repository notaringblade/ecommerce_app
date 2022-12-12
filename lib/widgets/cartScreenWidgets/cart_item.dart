import 'package:cart_stepper/cart_stepper.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/widgets/cartScreenWidgets/cart_item_info.dart';
import 'package:flutter/material.dart';
import 'package:counter_button/counter_button.dart';

class CartItem extends StatefulWidget {
  final Product product;
  final Function refresh;
  const CartItem({Key? key, required this.product, required this.refresh}) : super(key: key);

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/productScreen', arguments: widget.product);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white,
            ),
            height: 80,
            child: Container(
              child: CartItemInfo(product: widget.product, refresh: widget.refresh,),
            )),
      ),
    );
  }
}
