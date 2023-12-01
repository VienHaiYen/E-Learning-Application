import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:elearning_app/widgets/avartar.dart';
import 'package:elearning_app/widgets/rating_star.dart';

class MainInfo extends StatefulWidget {
  const MainInfo({Key? key}) : super(key: key);

  @override
  State<MainInfo> createState() => _MainInfoState();
}

class _MainInfoState extends State<MainInfo> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(bottom: 10, right: 15),
                height: 60,
                width: 60,
                child: const CustomAvatar(
                  url:
                      "https://t4.ftcdn.net/jpg/02/29/75/83/360_F_229758328_7x8jwCwjtBMmC6rgFzLFhZoEpLobB6L8.jpg",
                  height: 70,
                  width: 70,
                ),
              ),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Andy',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'Vietnam',
                      style: TextStyle(fontSize: 15),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.end, children: <Widget>[
          const StarRating(
            color: Colors.yellow,
            rating: 5,
          ),
          Container(
            margin: const EdgeInsets.only(top: 8, right: 8),
            child: GestureDetector(
              onTap: () async {},
              child: !isFavorite
                  ? SvgPicture.asset(
                      "asset/svg/ic_heart.svg",
                      width: 35,
                      height: 35,
                      color: Colors.pink,
                    )
                  : SvgPicture.asset(
                      "asset/svg/ic_heart_fill.svg",
                      width: 35,
                      height: 35,
                      color: Colors.pink,
                    ),
            ),
          )
        ])
      ],
    );
  }
}
