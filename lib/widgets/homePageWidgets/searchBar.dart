import 'package:flutter/material.dart';

Widget searchBar() {
  return Container(
    // height: 40,
    child: TextFormField(
      decoration: const InputDecoration(
        iconColor: Colors.grey,
        suffixIconColor: Colors.grey,
        suffixIcon: Icon(Icons.search),
        filled: true,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        fillColor: Colors.white70,
        
      ),
    ),
  );
}
