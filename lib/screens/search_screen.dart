import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/widgets/common/grid_list.dart';
import 'package:ecommerce_app/widgets/history_widgets.dart/label.dart';
import 'package:ecommerce_app/widgets/homePageWidgets/item_list.dart';
import 'package:flutter/material.dart';
import '../config/capitalize.dart';

class SearchedScreen extends StatelessWidget {
  static const String routeName = '/searched';
  // final String name;
  final String name;

  const SearchedScreen({super.key, required this.name});
  static Route route({required String name}) {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => SearchedScreen(
              name: name,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(name.toCapitalized(), style: Theme.of(context).textTheme.headline1),
          centerTitle: true,
          elevation: 0,
          toolbarHeight: 55,
          leading: const BackButton(
            color: Colors.black,
          ),
        ),
        body: Builder(builder: (context) {
          if (Product.products
              .where((product) => product.name.toLowerCase() == name.toLowerCase())
              .isNotEmpty) {
            Product foundProduct = Product.products.firstWhere(
              (product) => product.name.toLowerCase() == name.toLowerCase(),
            
            );
            // print(foundProduct.category);

            return Column(
              
              children: [
                // Search(),
                Expanded(
                  child: GridList(
                    products: Product.products
                        .where((product) => product.name.toLowerCase().contains(name.toLowerCase()))
                        .toList(),

                  ),
                ),
                const LabelText(labelText: "Similar Products"),
                SizedBox(
                  height: 260,
                  child: ItemList(
                      products: Product.products
                          .where((product) => product.category == foundProduct.category.toLowerCase())
                          .toList()),
                ),
              ],
            );
          } 
          else if (Product.products
              .where((product) => product.category.toLowerCase() == name.toLowerCase())
              .isNotEmpty) {
                return  Column(
              
              children: [
                // Search(),
                Expanded(
                  child: GridList(
                    products: Product.products
                        .where((product) => product.category.toLowerCase().contains(name.toLowerCase()))
                        .toList(),

                  ),
                ),
              ],
            );

          }
          else {
            return const Center(
              child: Text("No Product that meets this description"),
            );
          }
        }));
  }
}
