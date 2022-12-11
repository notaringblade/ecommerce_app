import 'package:ecommerce_app/models/product_model.dart';
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
          style: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(color: Colors.black, fontSize: 24),
        ),
        InkWell(
          onTap: () {
            print("View ${sectionname}");
            Navigator.pushNamed(
              context,
              '/${sectionname}',
              arguments: Product.products,
            );
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
