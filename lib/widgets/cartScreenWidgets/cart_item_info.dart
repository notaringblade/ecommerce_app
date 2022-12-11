import 'package:cart_stepper/cart_stepper.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/widgets/cartScreenWidgets/counter.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/config/capitalize.dart';

class CartItemInfo extends StatefulWidget {
  final Product product;
  const CartItemInfo({Key? key, required this.product}) : super(key: key);

  @override
  State<CartItemInfo> createState() => _CartItemInfoState();
}

class _CartItemInfoState extends State<CartItemInfo> {
  int _counterLimit = 1;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            "${widget.product.imageUrl}",
            fit: BoxFit.fill,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  child: Text(
                widget.product.name.toCapitalized(),
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
              )),
              // SizedBox(
              //   height: 10,
              // ),
              Container(
                child: Text(
                  widget.product.category,
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.grey[600]),
                ),
              ),
              // SizedBox(
              //   height: 10,
              // ),
              Container(
                child: Text(
                  "\$${widget.product.price}",
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ],
          ),
          Counter(),
        ],
      ),
    );
  }
}


