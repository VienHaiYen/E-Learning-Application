import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [
          const Icon(Icons.calendar_month, size: 60),
          Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
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
                Container(
                    // color: Colors.black,
                    padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                    decoration: const BoxDecoration(
                        border: Border(
                            left: BorderSide(
                      color: Colors.black,
                      width: 3.0,
                    ))),
                    child: const Expanded(
                        child: Text(
                      'I love the weather, the screnery and the laid-back lifestyle of the locals',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black45),
                    )))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
