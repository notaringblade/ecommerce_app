import 'package:ecommerce_app/models/product_model.dart';
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
    return SizedBox(
      // flex: 1,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 14),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white,
          ),
          // height: 470,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),

          // height: 400,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                child: Text(
                  product.name.toCapitalized(),
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              InkWell(
                onTap: () {
                  // print("View ${product.category}");
                Navigator.pushNamed(
                  context,
                  '/Sorted',
                  arguments: product.category,
                );
                },
                child: SizedBox(
                  child: Text(
                    " ${product.category}",
                    style: Theme.of(context).textTheme.headline3,
                    // textAlign: TextAlign.start,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ExpansionTile(
                // flex: 1
                textColor: Colors.redAccent,
                iconColor: Colors.redAccent,
                title: const Text(
                  "Quick Info",
                ),
                initiallyExpanded: true,
                children: [
                  Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),

                    alignment: Alignment.centerLeft,
                    child: Text(
                      product.description,
                      
                      style: Theme.of(context).textTheme.headline4,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 5,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ExpansionTile(
                // flex: 1
                textColor: Colors.redAccent,
                iconColor: Colors.redAccent,
                title: const Text("Description"),
                children: [
                  Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),

                    alignment: Alignment.centerLeft,
                    child: Text(
                      product.description,
                      style: Theme.of(context).textTheme.headline4,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ExpansionTile(
                // flex: 1
                textColor: Colors.redAccent,
                iconColor: Colors.redAccent,
                title: const Text("Features"),
                
                children: [
                  Container(
                    // padding: EdgeInsets.symmetric(horizontal: 7, vertical: 14),
                    // height: 60,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                    
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: product.features.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          child: Text(" — ${product.features[index]}", style: Theme.of(context).textTheme.headline4,),
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
