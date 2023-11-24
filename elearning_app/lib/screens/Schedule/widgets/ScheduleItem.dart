import 'package:flutter/material.dart';

class ScheduleItem extends StatelessWidget {
  const ScheduleItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Fri, 30 Sep 22'),
            Row(
              children: [
                Image(
                  image: NetworkImage(
                      'https://w7.pngwing.com/pngs/178/595/png-transparent-user-profile-computer-icons-login-user-avatars-thumbnail.png'),
                  width: 40,
                  height: 40,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Keegan',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Fance',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      'Direct Messsage',
                      style: TextStyle(fontSize: 11, color: Colors.blue),
                    ),
                  ],
                ),
              ],
            ),
          ]),
          Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text('18:30 - 18:55'),
                  Text('18:30 - 18:55'),
                ],
              ))
        ],
      ),
    );
  }
}
