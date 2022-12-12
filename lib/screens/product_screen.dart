import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/widgets/productScreenWidgets/fixed_bottom_bar.dart';
import 'package:ecommerce_app/widgets/productScreenWidgets/product_description.dart';
import 'package:ecommerce_app/widgets/productScreenWidgets/product_image.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/config/capitalize.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = '/productScreen';
  final Product product;

  static Route route({required Product product}) {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => ProductScreen(product: product));
  }

  const ProductScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title:  Text(
          "${product.name}".toCapitalized(),
          style: Theme.of(context).textTheme.headline1,
        ),
        centerTitle: true,
        elevation: 0,
        toolbarHeight: 55,
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        child: Column(
          children: [
            Container(
                height: 220,
                // width: 280,
                child: ProductCarousel(product: product)),
            SizedBox(
              // height: 350,
              child: ProductDescription(product: product),
            ),
            // SizedBox(height: 10,)
          ],
        ),
      ),
      bottomNavigationBar: Container(child: FixedBottomBar(product: product)),
    );
  }
}


