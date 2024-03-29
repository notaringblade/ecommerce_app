import 'package:ecommerce_app/widgets/common/category_widgets.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';

class Categories extends StatelessWidget {
  const Categories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      height: 50,
      width: 400,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          categoryWidget("All", const Icon(Icons.category)),
          const SizedBox(width: 12, ),
          categoryWidget("Watches", const Icon(Icons.watch)),
          const SizedBox(width: 12,),
          categoryWidget("Electronics", const Icon(Icons.headphones)),
          const SizedBox(width: 12,),
          categoryWidget("Shoes", const Icon(RpgAwesome.shoe_prints)),
          const SizedBox(width: 12,),
          categoryWidget("Phones", const Icon(Icons.phone_iphone_sharp)),
          const SizedBox(width: 12,),
          categoryWidget("Computers", const Icon(Icons.computer_outlined)),
        ],
      ),
    );
  }
}