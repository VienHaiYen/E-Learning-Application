import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
// import 'package:elearning_app/widgets/infor_chip.dart';
import 'package:video_player/video_player.dart';

class DetailScreen extends StatefulWidget {
  final String userId;
  // final List<FeedBack>? feedbacks;
  const DetailScreen({super.key, required this.userId});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  VideoPlayerController? _controller;
  ChewieController? _chewieController;
  bool isLoading = true;

  @override
  DetailScreen get widget => super.widget;

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lettutor'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.only(
                    left: 15, right: 15, top: 10, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.black,
                      height: 200,
                      margin: const EdgeInsets.only(bottom: 10),
                      child: _chewieController != null
                          ? Chewie(
                              controller: _chewieController as ChewieController)
                          : Container(),
                    ),
                    // MainInfo(tutor: tutor as Tutor),
                    // BookingFeature(tutorId: tutor!.userId),
                    const Padding(
                      padding:  EdgeInsets.only(top: 10, bottom: 10),
                      child: Text('Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit',
                          style:  TextStyle(fontSize: 13)),
                    ),
                    // InforChips(
                    //     title: "languages",
                    //     chips: listLanguages."entries"
                    //         .where((element) => tutor!.languages!
                    //             .split(",")
                    //             .contains(element.key))
                    //         .map((e) => e.value["name"] as String)
                    //         .toList()),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "interests",
                            style:  TextStyle(
                                fontSize: 17, color: Colors.blue),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5),
                            child: const Text(
                              "Interest",
                              style:  TextStyle(
                                  fontSize: 13, color: Colors.grey),
                            ),
                          )
                        ],
                      ),
                    ),
                    // InforChips(
                    //     title: "specialties",
                    //     chips: listLearningTopics.entries
                    //         .where((element) => tutor!.specialties!
                    //             .split(",")
                    //             .contains(element.key))
                    //         .map((e) => e.value)
                    //         .toList()),
                    Container(
                      margin: const EdgeInsets.only(bottom: 6, top: 15),
                      child: const Text(
                        "feedback",
                        style:
                            const TextStyle(fontSize: 17, color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
