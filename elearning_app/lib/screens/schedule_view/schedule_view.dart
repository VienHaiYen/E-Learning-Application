// ignore_for_file: must_be_immutable

import 'package:elearning_app/screens/history/history.dart';
import 'package:elearning_app/screens/schedule_view/widgets/upcoming_view.dart';
import 'package:elearning_app/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:elearning_app/widgets/group_fixed_button.dart';
import './widgets/schedule_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ScheduleView extends StatefulWidget {
  const ScheduleView({Key? key, this.page}) : super(key: key);

  final int? page;

  @override
  State<ScheduleView> createState() => _ScheduleViewState();
}

class _ScheduleViewState extends State<ScheduleView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Stack(
        children: [
          const Positioned(bottom: 20, right: 20, child: GroupFixedButton()),
          Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(children: [
                    Container(
                      padding: const EdgeInsets.only(top: 8),
                      alignment: Alignment.topLeft,
                      child: const Icon(
                        Icons.calendar_month,
                        size: 120,
                      ),
                    ),
                    Flexible(
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              AppLocalizations.of(context)!.booked_schedule,
                              style: const TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w600),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 8),
                            padding: const EdgeInsets.only(
                                top: 4, bottom: 8, left: 16),
                            decoration: const BoxDecoration(
                                border: Border(
                                    left: BorderSide(
                                        width: 4,
                                        color:
                                            Color.fromARGB(255, 87, 86, 86)))),
                            child: Text(
                              AppLocalizations.of(context)!.booked_time_frame,
                              style: const TextStyle(fontSize: 16),
                            ),
                          )
                        ],
                      ),
                    )
                  ])),

              Flexible(
                child: DefaultTabController(
                  initialIndex: widget.page ?? 0,
                  length: 2,
                  child: const Column(
                    children: [
                      TabBar(
                        tabs: [
                          Tab(
                            icon: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.timer_outlined,
                                  color: Colors.blue,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Upcoming',
                                  style: TextStyle(color: Colors.blue),
                                )
                              ],
                            ),
                          ),
                          Tab(
                            icon: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.history_outlined,
                                  color: Colors.blue,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'History',
                                  style: TextStyle(color: Colors.blue),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            UpcomingView(),
                            HistoryView(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              // const scheduleItem()
            ],
          ),
        ],
      ),
    );
  }
}
