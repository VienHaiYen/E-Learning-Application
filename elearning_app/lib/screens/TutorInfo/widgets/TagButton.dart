import 'package:flutter/material.dart';

class TagButton extends StatelessWidget {
  const TagButton({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: Colors.blue[100],
      ),
      child: Text(
        title,
        style: const TextStyle(color: Colors.blue),
      ),
    );
  }
}
