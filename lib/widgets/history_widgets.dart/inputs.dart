import 'package:ecommerce_app/bloc/login/login_bloc.dart';
import 'package:ecommerce_app/widgets/common/default_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Inputs extends StatelessWidget {
  final String value;
  final String sectionName;
  const Inputs({Key? key, required this.value, required this.sectionName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                width: 300,
                height: 40,
                child: TextFormField(
                  
                  controller: TextEditingController(text: value, ),
                   decoration:  decoration(),
                   
                  
                )),
            SizedBox(
              height: 10,
            ),
          ],
        );
      },
    );
  }

  InputDecoration decoration() {
    return InputDecoration(
        filled: true,
        
        // label: Text("$sectionname"),
        labelText: sectionName,
        labelStyle: const TextStyle(color: Colors.black),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16)
        
      );
  }
}
