import 'package:flutter/material.dart';

class LessionTime extends StatelessWidget {
  const LessionTime({super.key, this.time});

  final String? time;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          time ?? "01:30 - 01:55",
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        Container(
            child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Yêu cầu cho buổi học",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                // TODO: chưa làm dropdown xuống
                TextButton(
                    onPressed: () {},
                    child: const Text("Chỉnh sửa yêu cầu",
                        style: TextStyle(color: Colors.blue)))
              ],
            )
          ],
        ))
      ]),
    );
  }
}
