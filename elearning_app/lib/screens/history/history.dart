// ignore_for_file: must_be_immutable

import 'package:elearning_app/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:elearning_app/screens/tutor/widgets/comment_item.dart';
import 'package:elearning_app/widgets/group_fixed_button.dart';
import './widgets/history_item.dart';

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(),
        body: Stack(children: [
          HistoryBody(),
          const Positioned(bottom: 20, right: 20, child: GroupFixedButton())
        ]));
  }
}

class HistoryBody extends StatelessWidget {
  HistoryBody({super.key});

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
              Icons.call,
              size: 120,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: const Text(
              "Lịch đã đặt",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
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
            child: const Text(
              "Đây là danh sách các bài học bạn đã tham gia\nBạn có thể xem lại thông tin chi tiết về các buổi học đã tham gia đã tham gia",
              style: TextStyle(fontSize: 16),
            ),
          ),

          // Lastest book not start
          Container(),
          // TODO: Dropdown of
          const HistoryItem()
        ]));
  }
}
