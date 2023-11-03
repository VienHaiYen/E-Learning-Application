import 'package:flutter/material.dart';

class TutorListItem extends StatelessWidget {
  const TutorListItem({
    super.key,
    // this.avatar,
    this.culture,
    this.name,
    this.bio,
    this.specialties,
    this.rating,
  });

  // final Widget? avatar;
  final String? name;
  final String? culture;
  final String? bio;
  final String? specialties;
  final double? rating;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black, // Màu của viền
            width: 2.0, // Độ rộng của viền
          ),
        ),
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        const Image(
                          image: NetworkImage(
                              'https://w7.pngwing.com/pngs/178/595/png-transparent-user-profile-computer-icons-login-user-avatars-thumbnail.png'),
                          width: 50,
                          height: 50,
                        ),
                        Padding(
                            padding: const EdgeInsets.all(5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  name ?? 'tutor1',
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  culture ?? 'VN',
                                  style: const TextStyle(
                                    fontSize: 12.0,
                                    // fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )),
                        const Spacer(),
                        const Icon(Icons.favorite_border),
                      ]),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          bio ??
                              'ayout parents: Các widget cha của Text có thể ảnh hưởng đến khả năng hoạt động của overflow. Đảm bảo rằng không có giới hạn về không gian hoặc overflow trong widget cha.Bất kỳ ràng buộc nào khác: Các ràng buộc, giới hạn, hoặc lớp kiểu dáng khác có thể ghi đè lên overflow. Hãy kiểm ',
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Colors.black54,
                          ),
                        ),
                      )
                    ],
                  )
                ])));
  }
}
