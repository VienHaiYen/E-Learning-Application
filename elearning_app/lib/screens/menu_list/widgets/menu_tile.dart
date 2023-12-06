import 'package:flutter/material.dart';

class MenuTile extends StatelessWidget {
  MenuTile({
    super.key,
    required this.title,
    required this.icon,
    required this.route,
  });

  final Icon icon;

  final String title;

  final String route;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        color: Color.fromARGB(177, 239, 239, 239),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(padding: const EdgeInsets.only(right: 12), child: icon),
                Expanded(
                    child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w600),
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
