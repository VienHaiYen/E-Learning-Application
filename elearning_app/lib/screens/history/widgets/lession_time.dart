import 'package:flutter/material.dart';

class LessionTime extends StatelessWidget {
  const LessionTime({super.key, this.time});

  final String? time;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          time ?? "Thời gian bài học: 01:30 - 01:55",
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ]),
    );
  }
}
