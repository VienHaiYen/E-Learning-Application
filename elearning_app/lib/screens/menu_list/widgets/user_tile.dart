import 'package:flutter/material.dart';
import 'package:elearning_app/widgets/avatar.dart';

class UserTile extends StatelessWidget {
  UserTile({super.key, this.name});

  final String? name;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(177, 239, 239, 239),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 12),
                child: Avatar(
                    url:
                        "https://sandbox.api.lettutor.com/avatar/4d54d3d7-d2a9-42e5-97a2-5ed38af5789aavatar1684484879187.jpg",
                    height: 40,
                    width: 40),
              ),
              Expanded(
                  child: Text(
                name ?? "Hai Pham",
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              )),
            ],
          ),
        ],
      ),
    );
  }
}
