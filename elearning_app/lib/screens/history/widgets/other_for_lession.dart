import 'package:flutter/material.dart';

class Other extends StatelessWidget {
  const Other(
      {super.key,
      this.date,
      this.lastTime,
      this.requiedForLession,
      this.evaluation});

  final String? date;
  final String? lastTime;
  final String? requiedForLession;
  final String? evaluation;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ListTile(
          title: Text(
            requiedForLession ?? "Không có yêu cầu cho buổi học",
            style: const TextStyle(color: Colors.grey),
          ),
        ),
        const Divider(
          height: 20,
          thickness: 1,
          endIndent: 0,
          color: Color.fromARGB(255, 194, 193, 193),
        ),
        ListTile(
          title: Text(
            evaluation ?? "Gia sư chưa có đánh giá",
            style: const TextStyle(color: Colors.grey),
          ),
        ),
        const Divider(
          height: 20,
          thickness: 1,
          endIndent: 0,
          color: Color.fromARGB(255, 194, 193, 193),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                onPressed: () {},
                child: const Text("Đánh giá",
                    style: TextStyle(color: Colors.blue, fontSize: 16))),
            TextButton(
                onPressed: () {},
                child: const Text("Báo cáo",
                    style: TextStyle(color: Colors.blue, fontSize: 16)))
          ],
        )
      ]),
    );
  }
}
