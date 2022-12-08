import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
const MenuScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        Container(
          child: Text("Menu Screen", style: TextStyle(color: Colors.white),),
        ),
      ],
    );
  }
}