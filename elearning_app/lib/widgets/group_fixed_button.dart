import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:getwidget/getwidget.dart';

class GroupFixedButton extends StatelessWidget {
  const GroupFixedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
            radius: 24,
            backgroundColor: const Color.fromARGB(255, 126, 123, 123),
            child: IconButton(
                onPressed: () {},
                padding: const EdgeInsets.fromLTRB(1, 0, 1, 2),
                icon: const Icon(
                  CupertinoIcons.gift,
                  size: 34,
                  color: Colors.white,
                ))),
        const SizedBox(
          height: 6,
        ),
        CircleAvatar(
            radius: 24,
            backgroundColor: const Color.fromARGB(255, 126, 123, 123),
            child: IconButton(
                onPressed: () {},
                padding: const EdgeInsets.fromLTRB(1, 0, 1, 2),
                icon: const Icon(
                  Icons.message_outlined,
                  size: 28,
                  color: Colors.white,
                )))
      ],
    );
  }
}
