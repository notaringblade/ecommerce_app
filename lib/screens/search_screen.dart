import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/widgets/common/grid_list.dart';
import 'package:ecommerce_app/widgets/history_widgets.dart/label.dart';
import 'package:ecommerce_app/widgets/homePageWidgets/item_list.dart';
import 'package:ecommerce_app/widgets/homePageWidgets/searchBar.dart';
import 'package:ecommerce_app/widgets/homePageWidgets/section_widget.dart';
import 'package:flutter/material.dart';
import '../config/capitalize.dart';
import '../config/ignore_sensitivity.dart';

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
          title: Text("${name.toCapitalized()}", style: Theme.of(context).textTheme.headline1),
          centerTitle: true,
          elevation: 0,
          toolbarHeight: 55,
          leading: const BackButton(
            color: Colors.black,
          ),
        ),
        body: Builder(builder: (context) {
          if (Product.products
              .where((product) => product.name == name.toLowerCase())
              .isNotEmpty) {
            Product _foundProduct = Product.products.firstWhere(
              (product) => product.name == name.toLowerCase(),
            
            );
            print(_foundProduct.category);

            return Column(
              
              children: [
                // Search(),
                Expanded(
                  child: GridList(
                    products: Product.products
                        .where((product) => product.name == name.toLowerCase())
                        .toList(),

                  ),
                ),
                LabelText(labelText: "Other Products found in " "(${_foundProduct.category.toCapitalized()})" " Category:"),
                Expanded(
                  child: GridList(
                      products: Product.products
                          .where((product) => product.category == _foundProduct.category && product.name != name.toLowerCase())
                          .toList()),
                ),
              ],
            );
          } else {
            return Center(
              child: Text("No Product that meets this description"),
            );
          }
        }));
  }
}
