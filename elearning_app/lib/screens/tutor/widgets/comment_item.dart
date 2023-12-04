import 'package:flutter/material.dart';
import 'package:elearning_app/widgets/avatar.dart';
import 'package:elearning_app/widgets/star_rating.dart';

class CommentItem extends StatelessWidget {
  const CommentItem(
      {super.key,
      this.urlAvatar,
      this.name,
      this.rating,
      this.ratingCount,
      this.comment,
      this.time});

  final String? urlAvatar;
  final String? name;
  final String? comment;
  final double? rating;
  final int? ratingCount;
  final String? time;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Avatar(
                    url: urlAvatar ??
                        "https://sandbox.api.elearning_app.com/avatar/4d54d3d7-d2a9-42e5-97a2-5ed38af5789aavatar1684484879187.jpg",
                    height: 35,
                    width: 35),
              ),
              Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Row(children: [
                      Text(name ?? "Keegan",
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 134, 133, 133))),
                      Text('  ${time ?? "Not define"}',
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 165, 162, 162)))
                    ]),
                    // TODO: Add country image
                    Padding(
                        padding: const EdgeInsets.only(top: 4, bottom: 0),
                        child: StarRating(
                          rating: rating ?? 4,
                          ratingCount: ratingCount,
                        )),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 9),
                      alignment: Alignment.topLeft,
                      child: Text(
                        comment ?? "123",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ])),
              // FavoriteIcon(isInterested: true)
            ],
          ),
        ],
      ),
    );
  }
}
