// ignore_for_file: must_be_immutable

import 'package:elearning_app/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:elearning_app/widgets/group_fixed_button.dart';
import './widgets/calendar_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Calendar extends StatelessWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(),
        body: Stack(children: [
          CalendarBody(),
          const Positioned(bottom: 20, right: 20, child: GroupFixedButton())
        ]));
  }
}

class CalendarBody extends StatelessWidget {
  CalendarBody({super.key});

  TextEditingController nameC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: ListView(children: [
          Container(
            padding: const EdgeInsets.only(top: 8),
            alignment: Alignment.topLeft,
            child: const Icon(
              Icons.calendar_month,
              size: 120,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              AppLocalizations.of(context)!.booked_schedule,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
          ),
          // TODO:

          Container(
            margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.only(top: 4, bottom: 8, left: 16),
            decoration: const BoxDecoration(
                border: Border(
                    left: BorderSide(
                        width: 4, color: Color.fromARGB(255, 87, 86, 86)))),
            // TODO: Làm thanh dọc đoạn văn bản trên
            child: Text(
              AppLocalizations.of(context)!.booked_time_frame,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 9),
            child: const Text(
              "Latest Book",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
          ),
          // Lastest book not start
          Container(),
          // TODO: Dropdown of lession item
          const CalendarItem()
        ]));
  }
}
