import 'package:ecommerce_app/config/theme.dart';
import 'package:flutter/material.dart';

class LabelText extends StatelessWidget {
  final String labelText;
  const LabelText({
    Key? key,
    required this.labelText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      labelText,
      style: theme().textTheme.headline2!.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}