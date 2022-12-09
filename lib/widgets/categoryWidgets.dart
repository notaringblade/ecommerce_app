import 'package:flutter/material.dart';

Widget categoryWidget(String name, Icon icon) {
  return Container(
    height: 60,
    width: 120,
    // color: Colors.white54,
    decoration: const BoxDecoration(
      color: Colors.white70,
      borderRadius: BorderRadius.all(Radius.circular(20))
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
         icon,
        // Center(
          Center(
            
            child: Text(
            name,
            textAlign: TextAlign.right,
            style: TextStyle(color: Colors.black87),
        ),
          ),
      ],
    ),
  );
}
