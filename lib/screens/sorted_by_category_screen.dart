import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/widgets/common/grid_list.dart';
import 'package:ecommerce_app/widgets/homePageWidgets/item_list.dart';
import 'package:ecommerce_app/widgets/productScreenWidgets/fixed_bottom_bar.dart';
import 'package:flutter/material.dart';

class SortedScreen extends StatelessWidget {
  static const String routeName = '/Sorted';
  // final String name;
  final String name;

  const SortedScreen({super.key, required this.name});
  static Route route({required String name}) {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => SortedScreen(
              name: name,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("$name", style: Theme.of(context).textTheme.headline1),
        centerTitle: true,
        elevation: 0,
        toolbarHeight: 55,
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: Builder(builder: (context) {
        if (name != "All") {
          if (Product.products
              .where((product) => product.category == name.toLowerCase())
              .isNotEmpty) {
            return GridList(
                products: Product.products
                    .where((product) => product.category == name.toLowerCase())
                    .toList());
          } else {
            return Center(
              child: Text("No Products In This Category"),
            );
          }
        } else {
          return GridList(products: Product.products.toList());
        }
      }),

    );
  }
}
