import 'package:ecommerce_app/bloc/cart/cart_bloc.dart';
import 'package:ecommerce_app/bloc/test/test_bloc.dart';
import 'package:ecommerce_app/models/cart_model.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/widgets/cartScreenWidgets/cart_item.dart';
import 'package:ecommerce_app/widgets/cartScreenWidgets/cart_subtotak.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  static const String routeName = '/cart';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const CartScreen());
  }

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
      child: Container(
          
              height: 660,
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Column(
          children: [
           
            Container(
              height: 330,
              child: ListView.builder(
                itemCount: Cart.products.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: CartItem(
                      product: Cart.products[index],
                      refresh: refresh,
                    ),
                  );
                },
              ),
            ),
            const Divider(
              color: Colors.black,
              thickness: 2,
              indent: 40,
              endIndent: 40,
            ),
            CartTotal()
          ],
              ),
            ));
  }
}


