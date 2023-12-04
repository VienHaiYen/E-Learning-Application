import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:elearning_app/widgets/avatar.dart';
import 'package:elearning_app/widgets/star_rating.dart';
import 'package:elearning_app/widgets/favorite_icon.dart';

class TutorBookingItem extends StatelessWidget {
  TutorBookingItem({super.key, this.bookingTime});

  final String? bookingTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      // margin: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 12),
                child: Avatar(
                    url:
                        "https://sandbox.api.elearning_app.com/avatar/4d54d3d7-d2a9-42e5-97a2-5ed38af5789aavatar1684484879187.jpg",
                    height: 20,
                    width: 20),
              ),
              Expanded(
                  child: Text(bookingTime ??
                      "Booking 01:00 - 01:25 | T6, 12 Thg 05 23")),
            ],
          ),
        ],
      ),
    );
  }
}
