import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:elearning_app/utils/generate_ratio.dart';

class BookingFeature extends StatefulWidget {
  const BookingFeature({Key? key, required this.tutorId}) : super(key: key);

  final String tutorId;

  @override
  State<BookingFeature> createState() => _BookingFeatureState();
}

class _BookingFeatureState extends State<BookingFeature> {
  @override
  Widget build(BuildContext context) {
    Future showTutorTimePicker() {
      return showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(10),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        isScrollControlled: true,
        builder: (context) {
          return SafeArea(
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) =>
                  Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.6,
                child: Column(
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        margin: const EdgeInsets.only(bottom: 10),
                        width: double.infinity,
                        decoration: BoxDecoration(color: Colors.grey[300]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "selectSchedule",
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        )),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 10, left: 10, bottom: 10),
                        child: GridView.count(
                          crossAxisCount:
                              generateAsisChildRatio(constraints)[0].toInt(),
                          childAspectRatio:
                              (1 / generateAsisChildRatio(constraints)[1]),
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          shrinkWrap: true,
                          children: List.generate(
                            2,
                            (index) => ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey[200],
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  side:
                                      BorderSide(color: Colors.blue, width: 1),
                                ),
                              ),
                              child: Container(
                                padding:
                                    const EdgeInsets.only(top: 13, bottom: 13),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "11:11",
                                      style:
                                          const TextStyle(color: Colors.blue),
                                    ),
                                    Text(
                                      "11:11",
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }

    Future showTutorDatePicker() {
      return showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(10),
          ),
        ),
        isScrollControlled: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        builder: (context) {
          return SafeArea(
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) =>
                  Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.6,
                constraints: const BoxConstraints(maxWidth: 1000),
                child: Column(
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        margin: const EdgeInsets.only(bottom: 10),
                        width: double.infinity,
                        decoration: BoxDecoration(color: Colors.grey[300]),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text("selectSchedule",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                          ],
                        )),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 10, left: 10, bottom: 10),
                        child: GridView.count(
                          crossAxisCount:
                              generateAsisChildRatio(constraints)[0].toInt(),
                          childAspectRatio:
                              (1 / generateAsisChildRatio(constraints)[1]),
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          shrinkWrap: true,
                          children: List.generate(
                            2,
                            (index) => ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  side:
                                      BorderSide(color: Colors.blue, width: 1),
                                ),
                              ),
                              child: Container(
                                padding:
                                    const EdgeInsets.only(top: 13, bottom: 13),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Wed, Jan 25",
                                      style: TextStyle(color: Colors.blue),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20),
          child: ElevatedButton(
            onPressed: () {
              showTutorDatePicker();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(1000))),
            ),
            child: Container(
              padding: const EdgeInsets.only(top: 13, bottom: 13),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("booking", style: const TextStyle(color: Colors.white))
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
