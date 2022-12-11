import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/widgets/homePageWidgets/carousel_widget.dart';
import 'package:ecommerce_app/widgets/homePageWidgets/categories.dart';
import 'package:ecommerce_app/widgets/homePageWidgets/filterButton.dart';
import 'package:ecommerce_app/widgets/homePageWidgets/popular_items_widget.dart';
import 'package:ecommerce_app/widgets/homePageWidgets/searchBar.dart';
import 'package:ecommerce_app/widgets/homePageWidgets/section_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 320,
                    height: 40,
                    child: searchBar(),
                  ),
                  Container(
                      // height: 50,
                      child: filterButton()),
                ],
              ),
            ),
            SizedBox(
              // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              // height: 100,
              child: categories(400),
            ),
          ],
        ),
        Expanded(
          // flex: 1,
          child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
              child: Column(
                children: [
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        height: 160,
                        child: carousel(),
                      ),
                      const SectionWidget(
                        sectionname: "Recommended",
                      ),
                      const Divider(
                        thickness: 2,
                        color: Colors.black,
                      ),
                      Container(
                        height: 260,
                        child: ItemList(
                          products: Product.products
                              .where((product) => product.isRecommended)
                              .toList(),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20,),
                  Column(
                    children: [
                      SectionWidget(
                        sectionname: "Popular",
                      ),
                      const Divider(
                        thickness: 2,
                        color: Colors.black,
                      ),
                      Container(
                        // width: 200,
                        height: 260,
                        child: ItemList(
                          products: Product.products
                              .where((product) => product.isPopular)
                              .toList(),
                        ),
                      )
                    ],
                  )
                ],
              )),
        )
      ],
    );
  }
}
