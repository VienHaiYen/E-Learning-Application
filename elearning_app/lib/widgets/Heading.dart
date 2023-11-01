import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  final String title;
  const Heading(this.title);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(title,
            style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 30)));
  }
}
