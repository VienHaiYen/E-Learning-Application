import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:elearning_app/widgets/avartar.dart';
import 'package:elearning_app/widgets/rating_star.dart';

class Previews extends StatelessWidget {
  const Previews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10, right: 15),
                  height: 40,
                  width: 40,
                  child: const CustomAvatar(
                    url:
                        'https://www.google.com/url?sa=i&url=https%3A%2F%2Fstock.adobe.com%2Fsearch%3Fk%3Duser&psig=AOvVaw39lcAIfcM9V-KCsC1NxISV&ust=1701286547665000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCJjz_7S454IDFQAAAAAdAAAAABAE',
                    height: 70,
                    width: 70,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Marria Orri",
                          style: TextStyle(fontSize: 16),
                        ),
                        StarRating(
                          rating: 4,
                          color: Colors.yellow,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                child: Text("feedback.content")),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  DateFormat.yMEd()
                      .add_jm()
                      .format(DateFormat("yyyy-MM-dd").parse("2023-11-29")),
                  style: const TextStyle(color: Colors.grey),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
