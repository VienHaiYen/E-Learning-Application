import 'package:flutter/material.dart';
import './tutor_item.dart';
import './lession_time.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CalendarItem extends StatelessWidget {
  const CalendarItem({super.key, this.date, this.numberLessons});

  final String? date;
  final int? numberLessons;

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
        Text('${numberLessons ?? 1} buổi học'),
        TutorItem(),
        const LessionTime(),
        Container(
          alignment: Alignment.bottomRight,
          margin: const EdgeInsets.all(16),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 29, 137, 225),
              ),
              onPressed: () {},
              child: Text(
                AppLocalizations.of(context)!.enter_lesson_room,
                style: const TextStyle(fontSize: 16),
              )),
        ),
      ]),
    );
  }
}
