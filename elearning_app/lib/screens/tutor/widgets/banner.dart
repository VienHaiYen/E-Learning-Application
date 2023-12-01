import 'package:flutter/material.dart';

class BannerHomeScreen extends StatefulWidget {
  const BannerHomeScreen({super.key});

  @override
  State<BannerHomeScreen> createState() => _BannerHomeScreenState();
}

class _BannerHomeScreenState extends State<BannerHomeScreen> {
  bool isLoading = true;
  Duration? totalHourLesson;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30),
      width: MediaQuery.of(context).size.width,
      color: const Color(0xff0040D6),
      child: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 8),
                  child: const Text(
                    "2023-11-29",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Text(
                  '2023-12-12',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(1000))),
                    ),
                    child: Container(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: const Text(
                          "enterRoom",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  child: const Text(
                    "1h30m",
                    style: TextStyle(fontSize: 13, color: Colors.white),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
    );
  }
}

String convertTime(Duration totalHourLesson) {
  String result = '';
  if (totalHourLesson.inHours > 0) {
    result += '${totalHourLesson.inHours}  ';
    totalHourLesson =
        totalHourLesson - Duration(hours: totalHourLesson.inHours);
  }
  if (totalHourLesson.inMinutes > 0) {
    result += '${totalHourLesson.inMinutes} ';
    totalHourLesson =
        totalHourLesson - Duration(minutes: totalHourLesson.inMinutes);
  }
  return result;
}
