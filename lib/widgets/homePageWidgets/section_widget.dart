import 'package:flutter/material.dart';

class SectionWidget extends StatelessWidget {
  final String sectionname;
  const SectionWidget({
    required this.sectionname,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "${sectionname} Items",
          style: TextStyle(
              fontFamily: 'monospace',
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
        InkWell(
          onTap: () {
            print("View ${sectionname}");
          },
          child: Text(
            "View More>>",
            style: TextStyle(fontSize: 14),
          ),
        ),
      ],
    );
  }
}