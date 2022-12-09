import 'package:ecommerce_app/models/product_model.dart';
import 'package:flutter/material.dart';

class FixedBottomBar extends StatelessWidget {
  const FixedBottomBar({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.transparent,
      elevation: 0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4),
        child: Container(
          height: 80, //set your height here
          width: double.maxFinite, //set your width here
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadius.vertical(top: Radius.circular(20.0))),
          child: Row(
            // mainAxisSize: MainAxisSize.max,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: Text(
                  "\$ ${product.price}",
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              FloatingActionButton.extended(
                onPressed: () {},
                label: Text("Add To Cart"),
                icon: Icon(Icons.shopping_cart),
                backgroundColor: Colors.black,
              )
            ],

            //add as many tabs as you want here
          ),
        ),
      ),
    );
  }
}