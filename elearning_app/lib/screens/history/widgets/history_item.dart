import 'package:flutter/material.dart';
import './tutor_item.dart';
import './lession_time.dart';
import './other_for_lession.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem({super.key, this.date, this.lastTime});

  final String? date;
  final String? lastTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 240, 234, 234),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          date ?? "CN, 03 Thg 12 23",
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        Text(lastTime ?? "7giờ trước"),
        TutorItem(),
        const LessionTime(),
        const Other()
      ]),
    );
  }
}
