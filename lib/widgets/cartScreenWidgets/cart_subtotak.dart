import 'package:ecommerce_app/config/theme.dart';
import 'package:ecommerce_app/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/cart/cart_bloc.dart';

class CartTotal extends StatelessWidget {
  const CartTotal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if(state is CartLoaded){
return Expanded(
          child: Container(
            
            height: 240,
            // color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Subtotal: ",
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(fontSize: 20),
                    ),
                    Text(
                      "\$ ${state.cart.subTotalString}",
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(fontSize: 20),
                    )
                  ],
                ),
                const Divider(
                  color: Colors.white,
                  thickness: 2,
                  indent: 0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Shipping: ",
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(fontSize: 20),
                    ),
                    Text(
                      "\$ ${state.cart.shippingFeeString}",
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(fontSize: 20),
                    )
                  ],
                ),
                const Divider(
                  color: Colors.white,
                  thickness: 2,
                  indent: 0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Grand Total: ",
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(fontSize: 20),
                    ),
                    Text(
                      "\$ ${state.cart.grandTotalString}",
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(fontSize: 20),
                    )
                  ],
                ),
                SizedBox(height: 59,),
                Container(
                  // alignment: Alignment.bottomCenter,
                  child: FloatingActionButton.extended(
                    backgroundColor: Colors.redAccent,
                    onPressed: () {},
                    label: Text("Proceed To Checkout"),
                    icon: Icon(Icons.shopping_cart_checkout),
                    highlightElevation: 0,
                  ),
                )
              ],
            ),
          ),
        );
        }else{
          return Center(child: Text("Error", style: theme().textTheme.displayLarge,),);
        }
      
      },
    );
  }
}