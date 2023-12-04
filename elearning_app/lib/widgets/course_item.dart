import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CourseItem extends StatelessWidget {
  const CourseItem({super.key, this.bottomWidget});

  final Widget? bottomWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: GestureDetector(
          onTap: null,
          child: Card(
            elevation: 8,
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // TODO: Không load được ảnh, cần xem lại
                  CachedNetworkImage(
                    imageUrl:
                        "https://camblycurriculumicons.s3.amazonaws.com/5e0e8b212ac750e7dc9886ac?h=d41d8cd98f00b204e9800998ecf8427e",
                    fit: BoxFit.cover,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Life in the Internet Age",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 8, bottom: 15),
                          child: Text(
                            "Let's discuss how technology is changing the way we live",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey[800]),
                          ),
                        ),
                        bottomWidget ??
                            Text(
                              'Any level',
                              style: TextStyle(
                                  fontSize: 15, color: Colors.grey[800]),
                            ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
