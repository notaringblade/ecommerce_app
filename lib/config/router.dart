import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/pages/homeScreen.dart';
import 'package:ecommerce_app/screens/popular_screen.dart';
import 'package:ecommerce_app/screens/product_screen.dart';
import 'package:ecommerce_app/screens/recommended_items.dart';
import 'package:flutter/material.dart';

class AppRouter{
  static Route onGenerateRoute(RouteSettings settings){
    print('This is Route ${settings.name}');
    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      // case HomeScreen.routeName:
      //   return HomeScreen.route();
      case ProductScreen.routeName:
        return ProductScreen.route(product: settings.arguments as Product);
      case RecommendedItems.routeName:
        return RecommendedItems.route();
      case PopularItems.routeName:
        return PopularItems.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute(){
    return MaterialPageRoute(
      settings: RouteSettings(name: '/error'),
      builder: (_)=> Scaffold(
        appBar: AppBar(title: Text("Error")),
      )
    );
  }
}