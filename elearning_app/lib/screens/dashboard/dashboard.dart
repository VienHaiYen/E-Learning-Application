// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:elearning_app/widgets/group_fixed_button.dart';
import './widgets/tutor_item.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Sign Up Screen",
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.black,
                primary: const Color.fromARGB(255, 250, 210, 8),
                brightness: Brightness.light)),
        home: Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.white,
                title: const Text(
                  "elearning_app",
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 26,
                      fontWeight: FontWeight.w600),
                )),
            body: Stack(children: [
              DashboardBody(),
              const Positioned(bottom: 20, right: 20, child: GroupFixedButton())
            ])));
  }
}

class DashboardBody extends StatelessWidget {
  final searchOptions = [
    "Tất cả",
    "Tiếng Anh cho trẻ em",
    "Tiếng Anh cho công việc",
    "Giao tiếp",
    "FLYERS"
  ];

  DashboardBody({super.key});

  TextEditingController nameC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
          margin: const EdgeInsets.only(bottom: 12),
          width: double.infinity,
          color: const Color.fromARGB(255, 0, 75, 187),
          child: const Column(children: [
            Text("Buổi học sắp diễn ra",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.w500))
            // TODO: Add time to next class
          ]),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          // alignment: Alignment.topLeft,
          child: Column(children: [
            Container(
                alignment: Alignment.topLeft,
                child: const Text("Tìm kiếm gia sư",
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.w700))),
            Row(
              children: <Widget>[
                Container(
                    width: 150,
                    child: const TextField(
                      decoration: InputDecoration(
                          hintText: "Nhập tên gia sư",
                          hintStyle:
                              TextStyle(fontSize: 14, color: Colors.grey)),
                    )),
                const SizedBox(width: 20),
                // TODO: Droplist Down
                Container(
                    width: 120,
                    child: const TextField(
                      decoration: InputDecoration(
                          hintText: "Quốc tịch gia sư",
                          hintStyle:
                              TextStyle(fontSize: 14, color: Colors.grey)),
                    )),
              ],
            ),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                alignment: Alignment.topLeft,
                child: const Text("Nhập thời gian có lịch trống",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500))),
            Row(
              children: <Widget>[
                // TODO: DatePicker
                Container(
                    width: 100,
                    child: const TextField(
                      decoration: InputDecoration(
                          hintText: "Chọn một ngày",
                          hintStyle:
                              TextStyle(fontSize: 14, color: Colors.grey)),
                    )),
                const SizedBox(width: 20),
                // TODO: TimePicker
                const Flexible(
                    child: TextField(
                  decoration: InputDecoration(
                      hintText: "Chọn giờ bắt đầu - giờ kết thúc",
                      hintStyle: TextStyle(fontSize: 14, color: Colors.grey)),
                )),
              ],
            ),
            // TODO: Add Data, render click
            Container(
              alignment: Alignment.topLeft,
              child: Wrap(
                spacing: 4,
                runSpacing: -20,
                children: [
                  ...searchOptions.map((option) {
                    return GFButton(
                      onPressed: null,
                      text: option,
                      color: Colors.grey,
                      shape: GFButtonShape.pills,
                      size: 20,
                    );
                  }).toList()
                ],
              ),
            ),
            Container(
                alignment: Alignment.topLeft,
                child: const GFButton(
                  onPressed: null,
                  text: "Đặt lại bộ tìm kiếm",
                  textStyle: TextStyle(color: Colors.blue),
                  color: Colors.white,
                  textColor: Colors.yellow,
                  borderSide: BorderSide(width: 1, color: Colors.blue),
                  shape: GFButtonShape.pills,
                )),
            Container(
                margin: const EdgeInsets.only(bottom: 16, top: 10),
                alignment: Alignment.topLeft,
                child: const Text("Gia sư được để xuất",
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.w700))),
            TutorItem()
          ]),
        )
        // TODO: Add panigation
      ],
    );
  }
}
