import 'package:flutter/material.dart';
import 'package:elearning_app/screens/tutor/widgets/tutor_list_item.dart';

import 'package:elearning_app/widgets/avartar.dart';

class TutorListView extends StatefulWidget {
  final String? specialties;
  const TutorListView({super.key, this.specialties});
  @override
  State<TutorListView> createState() => _TutorListViewState();
}

class _TutorListViewState extends State<TutorListView> {
  @override
  TutorListView get widget => super.widget;
  // List<Tutor> data = [];
  bool isLoading = true;
  bool isLoadMore = false;
  int page = 1;
  int perPage = 10;

  late ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: 2,
            padding: const EdgeInsets.all(10.0),
            controller: _scrollController,
            itemBuilder: (BuildContext context, int index) {
              return const Column(
                children: <Widget>[
                  TutorListItem(
                    userId: "123456",
                    avatar: CustomAvatar(
                      url:
                          "https://t4.ftcdn.net/jpg/02/29/75/83/360_F_229758328_7x8jwCwjtBMmC6rgFzLFhZoEpLobB6L8.jpg",
                    ),
                    name: "Andy",
                    bio:
                        "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit",
                    specialties: "Swimming",
                    rating: 5,
                    // feedbacks: "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit",
                  ),
                ],
              );
            },
          );
  }
}
