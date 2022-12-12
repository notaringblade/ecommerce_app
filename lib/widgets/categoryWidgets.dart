import 'package:ecommerce_app/config/theme.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:flutter/material.dart';


Widget categoryWidget(String name, Icon icon) {
  return Builder(
    builder: (context) {
      return Container(
        height: 60,
        width: 120,
        // color: Colors.white54,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: InkWell(
          onTap: () {
            print("View ${name}");
                Navigator.pushNamed(
                  context,
                  '/Sorted',
                  arguments: name,
                );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
               icon,
              // Center(
                Center(
                  
                  child: Text(
                  name,
                  textAlign: TextAlign.right,
                  style: theme().textTheme.bodyText1,
              ),
                ),
            ],
          ),
        ),
      );
    }
  );
}
