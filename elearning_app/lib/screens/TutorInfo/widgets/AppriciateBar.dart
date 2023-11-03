import 'package:flutter/material.dart';

class AppriciateBar extends StatelessWidget {
  const AppriciateBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      IconButton(
        iconSize: 30,
        color: Colors.blue,
        icon: const Icon(Icons.favorite_border),
        onPressed: () {
          // ...
        },
      ),
      IconButton(
        iconSize: 30,
        color: Colors.blue,
        icon: const Icon(Icons.error_outline),
        onPressed: () {
          // ...
        },
      ),
      IconButton(
        iconSize: 30,
        color: Colors.blue,
        icon: const Icon(Icons.star_border),
        onPressed: () {
          // ...
        },
      ),
    ]);
  }
}
