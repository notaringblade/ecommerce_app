import 'package:flutter/material.dart';

Widget filterButton() {
    return SizedBox(
      width: 45,
      height: 45,
      child: FloatingActionButton(
        elevation: 1,
        highlightElevation: 0,
        backgroundColor: Colors.redAccent,
        onPressed: () {},
        shape: const  BeveledRectangleBorder(
            borderRadius: BorderRadius.all(Radius.elliptical(5, 5))),
        child: const Icon(
          Icons.filter_list,
          color: Colors.white,
        ),
      ),
  );
}
