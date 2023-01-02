import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/widgets/common/grid_list.dart';
import 'package:flutter/material.dart';

class PopularItems extends StatelessWidget {
  const PopularItems({Key? key}) : super(key: key);
  static const String routeName = '/Popular';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const PopularItems());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            "Popular",
            style: Theme.of(context)
                .textTheme
                .headline1
          ),
          centerTitle: true,
          elevation: 0,
          toolbarHeight: 55,
          leading: const BackButton(
            color: Colors.black,
          ),
        ),
        body: GridList(
            products: Product.products
                .where((product) => product.isPopular)
                .toList()));
  }
}
