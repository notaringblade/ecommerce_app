import 'package:ecommerce_app/config/theme.dart';
import 'package:flutter/material.dart';

class DefaultBottomBar extends StatelessWidget {
  const DefaultBottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
          child: Container(
            height: 50, //set your height here
            width: double.maxFinite, //set your width here
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              children: [
                Icon(Icons.remove, size: 24),
                Text("Reviews",
                    style: theme().textTheme.headline4!.copyWith(fontSize: 18),
                    textAlign: TextAlign.center),
              ],
            ),
          ),
        ));
  }
}
