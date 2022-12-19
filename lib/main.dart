import 'package:ecommerce_app/bloc/cart/cart_bloc.dart';
import 'package:ecommerce_app/bloc/history/history_bloc.dart';
import 'package:ecommerce_app/config/router.dart';
import 'package:ecommerce_app/config/theme.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/pages/accountScreen.dart';
import 'package:ecommerce_app/pages/cartScreen.dart';
import 'package:ecommerce_app/pages/homeScreen.dart';
import 'package:ecommerce_app/pages/menuScreen.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/globals.dart' as globals;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              HistoryBloc()..add(const LoadHistory(products: [])),
        ),
      ],
      child: MaterialApp(
        home: const Home(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: HomeScreen.routeName,
        theme: theme(),
        // title: "Ecommerce",
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //bottom bar
  int selectedIndex = globals.index!;
  Icon? fabIcon = const Icon(
    Icons.search,
    color: Colors.black,
  );
  final iconList = <IconData>[
    Icons.home,
    Icons.shopping_cart,
    Icons.person,
    Icons.menu_open,
  ];
  List<Widget> pages = const [
    HomeScreen(),
    CartScreen(),
    AccountScreen(),
    MenuScreen(),
  ];

  List<String> names = const [
    "Home",
    "Cart",
    "Account",
    "Menu",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        // extendBody: true,
        backgroundColor: const Color(0xFFD8D7DB),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            "${names[selectedIndex]}",
            style: Theme.of(context).textTheme.headline1,
          ),
          centerTitle: true,
          elevation: 0,
          toolbarHeight: 55,
        ),
        body: pages[selectedIndex],
        bottomNavigationBar: AnimatedBottomNavigationBar(
          icons: iconList,
          inactiveColor: Colors.black,
          activeColor: Colors.redAccent,
          iconSize: 25,
          elevation: 0,
          borderColor: Colors.black,
          borderWidth: 2,
          backgroundColor: Colors.white,
          activeIndex: selectedIndex,
          gapLocation: GapLocation.none,
          notchSmoothness: NotchSmoothness.softEdge,
          leftCornerRadius: 20,
          rightCornerRadius: 20,
          // height: 60,
          onTap: (index) => setState(() {
            selectedIndex = index;
            globals.index = index;
            // globals.changeColor(selectedIndex);
          }),
        )
        //

        );
  }
}
