import 'package:ecommerce_app/widgets/common/default_input.dart';
import 'package:flutter/material.dart';

class Inputs extends StatelessWidget {
  const Inputs({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
         SizedBox(
          width: 300,
          height: 40,
          child:  DefaultInputField(
            isReadOnly: true,
            sectionname: "Name",
          ),
        ),
         SizedBox(
          height: 10,
        ),
         SizedBox(
          width: 300,
          height: 40,
          child: DefaultInputField(
            isReadOnly: true,
            sectionname: "Email",
          ),
        ),
         SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 300,
          height: 40,
          child: DefaultInputField(
            isReadOnly: true,
            sectionname: "username",
          ),
        ),
      ],
    );
  }
}
