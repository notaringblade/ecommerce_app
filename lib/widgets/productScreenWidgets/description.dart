import 'package:ecommerce_app/config/theme.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/widgets/homePageWidgets/categories.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/config/capitalize.dart';

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
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),

          // height: 400,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  "${product.name}".toCapitalized(),
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              Container(
                child: Text(
                  " ${product.category}",
                  style: Theme.of(context).textTheme.headline3,
                  // textAlign: TextAlign.start,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ExpansionTile(
                // flex: 1
                textColor: Colors.redAccent,
                iconColor: Colors.redAccent,
                title: Text(
                  "Quick Info",
                ),
                initiallyExpanded: true,
                children: [
                  Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),

                    alignment: Alignment.centerLeft,
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
                textColor: Colors.redAccent,
                iconColor: Colors.redAccent,
                title: Text("Description"),
                children: [
                  Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),

                    alignment: Alignment.centerLeft,
                    child: Text(
                      "${product.description}",
                      style: Theme.of(context).textTheme.headline4,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              ExpansionTile(
                // flex: 1
                textColor: Colors.redAccent,
                iconColor: Colors.redAccent,
                title: Text("Features"),
                
                children: [
                  Container(
                    // padding: EdgeInsets.symmetric(horizontal: 7, vertical: 14),
                    // height: 60,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                    
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: product.features!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          child: Text(" — ${product.features![index]}", style: Theme.of(context).textTheme.headline4,),
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
