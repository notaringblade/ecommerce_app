import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/pages/home_screen.dart';
import 'package:ecommerce_app/screens/checkout_screen.dart';
import 'package:ecommerce_app/screens/landing_screen.dart';
import 'package:ecommerce_app/screens/popular_screen.dart';
import 'package:ecommerce_app/screens/product_screen.dart';
import 'package:ecommerce_app/screens/recommended_items.dart';
import 'package:ecommerce_app/screens/search_screen.dart';
import 'package:ecommerce_app/screens/sorted_by_category_screen.dart';
import 'package:flutter/material.dart';

class AppRouter{
  static Route onGenerateRoute(RouteSettings settings){
    // print('This is Route ${settings.name}');
    switch (settings.name) {
      case '/':
        return HomeScreen.route();
        case LandingScreen.routeName:
        return LandingScreen.route();
      case ProductScreen.routeName:
        return ProductScreen.route(product: settings.arguments as Product);
      case RecommendedItems.routeName:
        return RecommendedItems.route();
      case PopularItems.routeName:
        return PopularItems.route();
      case SortedScreen.routeName:
        return SortedScreen.route(name: settings.arguments as String);
      case SearchedScreen.routeName:
        return SearchedScreen.route(name: settings.arguments as String);
      case CheckoutScreen.routeName:
        return CheckoutScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute(){
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_)=> Scaffold(
        appBar: AppBar(title: const Text("Error")),
      )
    );
  }
}