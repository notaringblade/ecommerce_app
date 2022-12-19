import 'package:ecommerce_app/models/history_model.dart';
import 'package:ecommerce_app/widgets/common/item_widget.dart';
import 'package:flutter/material.dart';

class HistoryList extends StatelessWidget {
  const HistoryList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 260,
      child: ListView.builder(
        // reverse: true,
        // shrinkWrap: true,
        // reverse: true,
        itemCount: History.products.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 4.0, left: 0.0),
            child: ProductCard(product: History.products[index]),
          );
        },
      ),
    );
  }
}
