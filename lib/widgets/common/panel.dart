import 'package:flutter/material.dart';

class Panel extends StatelessWidget {
  final Widget child;
  final double height;
  const Panel({
    Key? key,
    required this.child,
    this.height = 200
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          width: 400,                
          height: height,
          color: Colors.white,
          child: child,
        ),
      ),
    );
  }
}
