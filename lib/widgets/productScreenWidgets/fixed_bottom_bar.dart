import 'package:ecommerce_app/models/cart_model.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/pages/cartScreen.dart';
import 'package:flutter/material.dart';
import '../../config/globals.dart' as globals;

class FixedBottomBar extends StatefulWidget {
  const FixedBottomBar({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;
  @override
  State<FixedBottomBar> createState() => _FixedBottomBarState();
}

class _FixedBottomBarState extends State<FixedBottomBar> {
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
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
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
                    "\$ ${widget.product.price}",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                
                Builder(
                  builder: (context) {
                    if(globals.index != 1){

                    return FloatingActionButton.extended(
                      onPressed: () {


                        Cart.products.add(widget.product);
                        const snackBar = SnackBar(
                          content: const Text('Added To Cart'),
                          backgroundColor: (Colors.redAccent),
                          dismissDirection: DismissDirection.horizontal,
                          duration: Duration(seconds: 1),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        Navigator.pop(context);


                      },
                      label: const Text("Add To Cart"),
                      icon: const Icon(Icons.shopping_cart),
                      backgroundColor: Colors.black,
                      elevation: 0,
                    );
                    }else{
                      return Container(child:Text("Already In Cart", style: Theme.of(context).textTheme.headline2!.copyWith(fontWeight: FontWeight.bold),));
                      // return Text("");
                    }
                  }
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
