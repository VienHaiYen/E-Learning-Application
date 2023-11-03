import 'package:flutter/material.dart';
import '../../widgets/TutorListItem.dart';
import './widgets/AppriciateBar.dart';
import './widgets/TagButton.dart';
import '../../widgets/Video.dart';

class TutorInfo extends StatelessWidget {
  const TutorInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Login",
        home: Scaffold(
            body: ListView(
          children: <Widget>[
            const TutorListItem(),
            const AppriciateBar(),
            const Video(),
            Container(
              padding: const EdgeInsets.all(8),
              child: const Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Languagesss',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [TagButton(title: "English")],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: const Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Specialties',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [TagButton(title: "English For Bussiness")],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: const Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Suggested Courses',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Basis Coversation Topic',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Life in Internet Age',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      ]))
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: const Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Interests',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
                      child: Expanded(
                          child: Text(
                        'I love the weather, the screnery and the laid-back lifestyle of the locals',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black45),
                      )))
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: const Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Teaching Experience',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
                      child: Expanded(
                          child: Text(
                        'I have more than 10 years of teaching Einglish experience',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black45),
                      )))
                ],
              ),
            ),
          ],
        )));
  }
}
