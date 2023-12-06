import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:elearning_app/widgets/avatar.dart';

class TutorItem extends StatelessWidget {
  TutorItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 12),
                child: Avatar(
                    url:
                        "https://sandbox.api.lettutor.com/avatar/4d54d3d7-d2a9-42e5-97a2-5ed38af5789aavatar1684484879187.jpg",
                    height: 60,
                    width: 60),
              ),
              Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    const Text("Keeganss",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                    // TODO: Add country image
                    const Text(
                      "Tunisia",
                      textAlign: TextAlign.start,
                    ),

                    Container(
                      child: const GFButton(
                        padding: EdgeInsets.all(0),
                        onPressed: null,
                        icon: Icon(
                          Icons.message_outlined,
                          size: 14,
                        ),
                        text: "Nhắn tin",
                        textStyle: TextStyle(color: Colors.blue, fontSize: 14),
                      ),
                    )
                  ])),
            ],
          ),
        ],
      ),
    );
  }
}
