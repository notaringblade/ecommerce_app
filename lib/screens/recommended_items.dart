import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/widgets/grid_list.dart';
import 'package:ecommerce_app/widgets/homePageWidgets/popular_items_widget.dart';
import 'package:ecommerce_app/widgets/item_widget.dart';
import 'package:flutter/material.dart';

class RecommendedItems extends StatelessWidget {
  
  const RecommendedItems({
    Key? key,
  }) : super(key: key);

  static const String routeName = '/Recommended';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const RecommendedItems());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title:  Text(
          "Recommended",
        style: Theme.of(context).textTheme.headline1,

        ),
        centerTitle: true,
        elevation: 0,
        toolbarHeight: 55,
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: GridList(products: Product.products.where((product) => product.isRecommended).toList()),
    );
  }
}


