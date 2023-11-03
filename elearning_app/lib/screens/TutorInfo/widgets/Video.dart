import 'package:flutter/material.dart';

class Video extends StatelessWidget {
  const Video({
    super.key,
    this.link,
  });

  // final Widget? avatar;
  final String? link;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: const Image(
        image: NetworkImage(
            'https://401ktv.com/wp-content/uploads/2017/08/Video-Communications.png'),
      ),
    );
  }
}
