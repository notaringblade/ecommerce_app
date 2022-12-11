import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  const Counter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.remove_circle_outline),
            ),
            Text(
              "1",
              style: Theme.of(context).textTheme.headline3,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add_circle_outline),
            ),
          ],
        ),
      );
  }
}