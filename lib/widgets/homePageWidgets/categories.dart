import 'package:ecommerce_app/widgets/categoryWidgets.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';
Widget categories(){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
    height: 50,
    width: 400,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: [
        categoryWidget("All", Icon(Icons.category)),
        const SizedBox(width: 12, ),
        categoryWidget("Watches", Icon(Icons.watch)),
        const SizedBox(width: 12,),
        categoryWidget("Electronics", Icon(Icons.headphones)),
        const SizedBox(width: 12,),
        categoryWidget("Shoes", Icon(RpgAwesome.shoe_prints)),
        const SizedBox(width: 12,),
        categoryWidget("Phones", Icon(Icons.phone_iphone_sharp)),
        const SizedBox(width: 12,),
        categoryWidget("Computers", Icon(Icons.computer_outlined)),
      ],
    ),
  );
}

