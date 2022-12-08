import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
const CartScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        Container(
          child: Text("Cart Screen", style: TextStyle(color: Colors.white),),
        ),
      ],
    );
  }
}