import 'package:flutter/material.dart';

class WantToLearn extends StatefulWidget {
  const WantToLearn({
    Key? key,
  }) : super(key: key);

  @override
  State<WantToLearn> createState() => _WantToLearnState();
}

class _WantToLearnState extends State<WantToLearn> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            margin: const EdgeInsets.only(top: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Subjects',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Wrap(children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1000),
                          color: Colors.blue[100],
                        ),
                        child: Wrap(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Text(
                                'Topic name',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.blue[900]),
                              ),
                            ),
                            Icon(Icons.done_rounded,
                                color: Colors.blue[900], size: 19),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1000),
                          color: Colors.grey[200],
                        ),
                        child: const Text('Topic name',
                            style: TextStyle(fontSize: 15)),
                      ),
                    )
                  ]),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 8, top: 10),
                  child: const Text(
                    "testPreparation",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Wrap(children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1000),
                          color: Colors.blue[100],
                        ),
                        child: Wrap(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Text('Topic name',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.blue[900])),
                            ),
                            Icon(Icons.done_rounded,
                                color: Colors.blue[900], size: 19),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1000),
                          color: Colors.grey[200],
                        ),
                        child: const Text('Topic name',
                            style: TextStyle(fontSize: 15)),
                      ),
                    )
                  ]),
                ),
              ],
            ),
          );
  }
}
