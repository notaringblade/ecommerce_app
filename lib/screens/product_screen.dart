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

  const ProductScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          product.name.toCapitalized(),
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
        child: Column(
          children: [
            SizedBox(
                height: 200,
                // width: 280,
                child: ProductCarousel(product: product)),
      
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 3, vertical: 4),
            ),
            SizedBox(
              child: ProductDescription(product: product),
            ),
            // SizedBox(height: 10,)
          ],
        ),
      ),
      bottomNavigationBar: FixedBottomBar(product: product,)
      );

  }
}
