import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:elearning_app/screens/tutor/widgets/tutor_list_item.dart';
import 'package:elearning_app/widgets/avartar.dart';

typedef TutorChangeCallback = void Function(String tutorName);

class TutorSearchDelegate extends SearchDelegate {
// first overwrite to
// clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

// second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

// third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: TutorFunctions.searchTutor(1, 10, search: query),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return const Center(
              child: CircularProgressIndicator(),
            );
          default:
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              
              }
              return  ListView.builder(
                      itemCount: matchQuery.length,
                      itemBuilder: (context, index) {
                        // Tutor result = matchQuery[index];
                        return const Column(
                          children: <Widget>[
                            TutorListItem(
                              userId: "userId",
                              avatar: CustomAvatar(
                                url: "avatar",
                              ),
                              name: "name",
                              bio: "bio",
                              specialties: "specialties",
                              rating:4,
                              // feedbacks: "feedbacks",
                            ),
                          ],
                        );
                      },
                    );
            }
        }
      },
    );
  }

// last overwrite to show the
// querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    
    return FutureBuilder(
      future: TutorFunctions.searchTutor(1, 10, search: query),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        
              return matchQuery.isEmpty
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "asset/svg/ic_notfound.svg",
                              width: 200,
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              child: Text(
                                "errNotAnyResult",
                                style: TextStyle(color: Colors.grey[700]),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: matchQuery.length,
                      itemBuilder: (context, index) {
                        // Tutor result = matchQuery[index];
                        return const Column(
                          children: <Widget>[
                            TutorListItem(
                              userId: "userId",
                              avatar: CustomAvatar(
                                url: "avatar",
                              ),
                              name: "name",
                              bio: "bio",
                              specialties: "specialties",
                              rating: 4,
                              // feedbacks: result.feedbacks,
                            ),
                          ],
                        );
                      },
                    );
            }
    );
  }

