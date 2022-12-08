import 'package:ecommerce_app/pages/accountScreen.dart';
import 'package:ecommerce_app/pages/cartScreen.dart';
import 'package:ecommerce_app/pages/homeScreen.dart';
import 'package:ecommerce_app/pages/menuScreen.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
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
    int selectedIndex = 0;
    Icon? fabIcon = Icon(Icons.search, color: Colors.black,);
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

    // TestPageTwo(),
    // TestPageThree(),
  ];

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFD8D7DB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Ecommerce-App", style: TextStyle(color: Colors.black, fontFamily: 'monospace', fontWeight: FontWeight.bold),),
        centerTitle: true,
        elevation: 0,
        toolbarHeight: 55,
      ),
      body: pages[selectedIndex],

          bottomNavigationBar: AnimatedBottomNavigationBar(
          icons: iconList,
          inactiveColor: Colors.white,
          activeColor: Colors.redAccent,
          iconSize: 25,
          elevation: 0,
          borderColor: Colors.white,
          borderWidth: 2,
          backgroundColor: Color(0xFF1C1C1E),
          activeIndex: selectedIndex,
          gapLocation: GapLocation.none,
          notchSmoothness: NotchSmoothness.softEdge,
          leftCornerRadius: 20,
          rightCornerRadius: 20,
          onTap: (index) => setState(() {
            selectedIndex = index;
            // globals.changeColor(selectedIndex);
          } ),
       )
      // 
  
    );
  }
}
