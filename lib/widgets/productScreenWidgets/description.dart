import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/widgets/homePageWidgets/categories.dart';
import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  const Description({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      // flex: 1,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 7, vertical: 14),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white,
          ),
          // height: 470,
          padding: EdgeInsets.symmetric(horizontal: 7, vertical: 14),

          // height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                  Container(
                    child: Text(
                      "${product.name}",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
              Container(
                child: Text(
                  " ${product.category}",
                  style: Theme.of(context).textTheme.headline4,
                  // textAlign: TextAlign.start,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // height: 240,
              Row(
                children: [categories(360)],
              ),
              SizedBox(
                height: 10,
              ),
              ExpansionTile(
                // flex: 1

                title: Text("Quick Info"),
                children: [
                  Container(
                    child: Text(
                      "${product.description}",
                      style: Theme.of(context).textTheme.headline4,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 5,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              ExpansionTile(
                // flex: 1
                title: Text("Description"),
                children: [
                  Container(
                    child: Text(
                      "${product.description}",
                      style: Theme.of(context).textTheme.headline4,
                      overflow: TextOverflow.visible,
                      // maxLines: 8,
                    ),
                  ),
                ],
              ),

              // SizedBox(height: 100,),
            ],
          ),
        ),
      ),
    );
  }
}