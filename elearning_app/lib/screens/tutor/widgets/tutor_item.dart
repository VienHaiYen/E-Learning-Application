import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:lettutor/widgets/avatar.dart';
import 'package:lettutor/widgets/star_rating.dart';
import 'package:lettutor/widgets/favorite_icon.dart';

class TutorItem extends StatelessWidget {
  TutorItem({Key? key}) : super(key: key);

  final searchOptions = [
    "Tiếng Anh cho trẻ em",
    "Tiếng Anh cho công việc",
    "Giao tiếp",
    "FLYERS",
    "Toeic",
    "ETC"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
        children: [
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 12),
                child: Avatar(
                    url:
                        "https://sandbox.api.lettutor.com/avatar/4d54d3d7-d2a9-42e5-97a2-5ed38af5789aavatar1684484879187.jpg",
                    height: 100,
                    width: 100),
              ),
              Expanded(
                  child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Text("Keegan",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w700)),
                    // TODO: Add country image
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: StarRating(
                          rating: 4,
                          ratingCount: 123,
                        )),
                    Text(
                      "Tunisia",
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 16),
                    ),
                  ])),
              // FavoriteIcon(isInterested: true)
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 9),
            child: Text(
              "I am passionate about running and fitness, I often compete in trail/mountain running events and I love pushing myself. I am training to one day take part in ultra-endurance events. I also enjoy watching rugby on the weekends, reading and watching podcasts on Youtube. My most memorable life experience would be living in and traveling around Southeast Asia.",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 4),
                child: const Column(
                  children: [
                    Icon(
                      Icons.favorite_border,
                      color: Colors.blue,
                    ),
                    Text(
                      "Yêu thích",
                      style: TextStyle(color: Colors.blue),
                    )
                  ],
                ),
              ),
              const Expanded(
                child: Column(
                  children: [
                    Icon(
                      Icons.report_outlined,
                      color: Colors.blue,
                    ),
                    Text(
                      "Báo cáo",
                      style: TextStyle(color: Colors.blue),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
