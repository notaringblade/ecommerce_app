import 'package:flutter/material.dart';

class DefaultInputField extends StatelessWidget {
  final String sectionname;
  final bool isReadOnly;
  final bool secret;
  final TextEditingController controller;
  const DefaultInputField({
    Key? key,
    required this.sectionname,
    this.isReadOnly = false,
    required this.controller,
    this.secret = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        readOnly: isReadOnly,
        autofocus: false,
        controller: controller,
        obscureText: secret,
        decoration:  InputDecoration(
          filled: true,
          
          // label: Text("$sectionname"),
          labelText: sectionname,
          labelStyle: const TextStyle(color: Colors.black),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16)
          
        ),
        
      );
  }
}