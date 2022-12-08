import 'package:flutter/material.dart';

Widget filterButton() {
    return Container(
      width: 45,
      height: 45,
      child: FloatingActionButton(
        elevation: 1,
        highlightElevation: 0,
        backgroundColor: Colors.redAccent,
        child: Icon(
          Icons.filter_list,
          color: Colors.white,
        ),
        onPressed: () {},
        shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.all(Radius.elliptical(5, 5))),
      ),
  );
}
