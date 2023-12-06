import 'package:elearning_app/routers/routers.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:elearning_app/widgets/avatar.dart';
import 'package:elearning_app/widgets/star_rating.dart';
import 'package:elearning_app/widgets/favorite_icon.dart';

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
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRouter.tutor);
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        decoration: BoxDecoration(
            // color: Colors.black,
            border: Border.all(color: Colors.grey),
            borderRadius: const BorderRadius.all(Radius.circular(20))),
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
                      height: 50,
                      width: 50),
                ),
                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Text("Keeganss",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600)),
                      // TODO: Add country image
                      Text(
                        "Tunisia",
                        textAlign: TextAlign.start,
                      ),
                      StarRating(
                        rating: 4,
                      ),
                    ])),
                FavoriteIcon(isInterested: true)
              ],
            ),
            Wrap(
              spacing: 4,
              runSpacing: -20,
              children: [
                ...searchOptions.map((option) {
                  return GFButton(
                    onPressed: null,
                    text: option,
                    color: const Color.fromARGB(255, 64, 135, 194),
                    shape: GFButtonShape.pills,
                    size: 20,
                  );
                }).toList()
              ],
            ),
            const Text(
              "I am passionate about running and fitness, I often compete in trail/mountain running events and I love pushing myself. I am training to one day take part in ultra-endurance events. I also enjoy watching rugby on the weekends, reading and watching podcasts on Youtube. My most memorable life experience would be living in and traveling around Southeast Asia.",
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            Container(
                margin: const EdgeInsets.all(16),
                alignment: Alignment.topRight,
                child: GFButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRouter.booking);
                  },
                  icon: const Icon(Icons.calendar_month),
                  text: "Đặt lịch",
                  textStyle: TextStyle(color: Colors.blue),
                  color: Colors.white,
                  textColor: Colors.yellow,
                  borderSide: BorderSide(width: 1, color: Colors.blue),
                  shape: GFButtonShape.pills,
                ))
          ],
        ),
      ),
    );
  }
}
