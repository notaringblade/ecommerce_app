import 'package:flutter/material.dart';

class DefaultInputField extends StatelessWidget {
  final String sectionname;
  final bool isReadOnly;
  const DefaultInputField({
    Key? key,
    required this.sectionname,
    this.isReadOnly = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        readOnly: isReadOnly,
        autofocus: false,
        controller: TextEditingController(text: sectionname),
        decoration:  InputDecoration(
          filled: true,
          
          // label: Text("$sectionname"),
          labelStyle: TextStyle(color: Colors.black),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16)
          
        ),
        
      );
  }
}