import 'package:ecommerce_app/widgets/homePageWidgets/carousel_widget.dart';
import 'package:ecommerce_app/widgets/homePageWidgets/categories.dart';
import 'package:ecommerce_app/widgets/homePageWidgets/filterButton.dart';
import 'package:ecommerce_app/widgets/homePageWidgets/searchBar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 320,
                height: 40,
                child: searchBar(),
              ),
              Container(
                // height: 50,
                child: filterButton() 
              ),
              
            ],
          ),
        ),
        SizedBox(
          // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          // height: 100,
          child: categories(),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
          height: 140,
          child: carousel(),
        )
      ],
    );
  }
}

