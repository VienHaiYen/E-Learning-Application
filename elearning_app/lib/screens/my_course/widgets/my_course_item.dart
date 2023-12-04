import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:elearning_app/screens/my_course/widgets/tutor_booking_item.dart';

class MyCourseItem extends StatelessWidget {
  MyCourseItem({super.key, this.status, this.color});
  bool isHovering = false;

  final String? status;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: InkWell(
          onTapDown: null,
          onHover: (hovering) {
            // setState(() => isHovering = hovering);
          },
          onTap: null,
          child: Card(
            elevation: 8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    color: color ?? Colors.grey,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.school,
                          color: Colors.white,
                          size: 15,
                        ),
                        Text(
                          "  BÀI HỌC 1",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    )),
                Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 12),
                    child: const Row(
                      children: [
                        Text(
                          "Greetings and Introductions",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        )
                      ],
                    )),
                SizedBox(
                  height: 100,
                  child: ListView(children: [
                    TutorBookingItem(),
                    TutorBookingItem(),
                    TutorBookingItem(),
                    TutorBookingItem(),
                    TutorBookingItem(),
                    TutorBookingItem(),
                    TutorBookingItem(),
                  ]),
                ),
                Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 16),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 200,
                            child: Row(
                              children: [
                                Text(
                                  status ?? "Hoàn thành",
                                  style: TextStyle(
                                      color: color,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Icon(
                                  Icons.done,
                                  color: color,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 100,
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: null,
                                    icon: Icon(
                                      Icons.note,
                                      color: color,
                                    )),
                                IconButton(
                                    onPressed: null,
                                    icon: Icon(
                                      CupertinoIcons.eye,
                                      color: color,
                                    )),
                              ],
                            ),
                          )
                        ]))
              ],
            ),
          ),
        ));
  }
}
