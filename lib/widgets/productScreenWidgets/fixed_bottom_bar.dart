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
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
        child: Container(
          height: 80, //set your height here
          width: double.maxFinite, //set your width here
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadius.all(Radius.circular(20.0))),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              // mainAxisSize: MainAxisSize.max,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Text(
                    "\$ ${product.price}",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                FloatingActionButton.extended(
                  onPressed: () {},
                  label: const Text("Add To Cart"),
                  icon: const Icon(Icons.shopping_cart),
                  backgroundColor: Colors.black,
                  elevation: 0,
                )
              ],

              //add as many tabs as you want here
            ),
          ),
        ),
      ),
    );
  }
}