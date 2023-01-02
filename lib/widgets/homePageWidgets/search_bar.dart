import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  Search({
    Key? key,
  }) : super(key: key);

    final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
    // height: 40,
            child: TextFormField(
              autofocus: false,
              
              controller: _textController,
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
                fillColor: Colors.white,
                
              ),
              onFieldSubmitted: (value) {
                        if (_textController.text != "") {
                          Navigator.pushNamed(context, "/searched", arguments: _textController.text);
                        }
                      },
                      textInputAction: TextInputAction.search,
            ),
          );
  }
}