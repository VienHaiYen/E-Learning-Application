// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:elearning_app/models/tutor/tutor.dart';
import 'package:elearning_app/models/tutor/tutor_info.dart';
import 'package:elearning_app/provider/auth_provider.dart';
import 'package:elearning_app/services/tutor_service.dart';
import 'package:elearning_app/services/user_service.dart';
import 'package:elearning_app/widgets/my_app_bar.dart';
import 'package:getwidget/getwidget.dart';
import 'package:elearning_app/widgets/group_fixed_button.dart';
import './widgets/tutor_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FindingTutor extends StatefulWidget {
  const FindingTutor({Key? key}) : super(key: key);

  @override
  State<FindingTutor> createState() => _FindingTutorState();
}

class _FindingTutorState extends State<FindingTutor> {
  List<Tutor> _tutors = [];
  List<TutorInfo> _infos = [];

  bool _isLoading = true;

  final searchOptions = [
    "Tất cả",
    "Tiếng Anh cho trẻ em",
    "Tiếng Anh cho công việc",
    "Giao tiếp",
    "FLYERS"
  ];

  Future<void> _fetchRecommendedTutors(AuthProvider authProvider) async {
    final String token = authProvider.token?.access?.token as String;

    final topics = await UserService.getLearningTopic(token);
    final tests = await UserService.getTestPreparation(token);
    authProvider.setLearnTopic(topics);
    authProvider.setTestPreparation(tests);

    _tutors = await TutorService.getListTutorWithPagination(
      page: 1,
      perPage: 10,
      token: token,
    );

    _tutors.sort((a, b) {
      if (a.rating == null || b.rating == null) return 0;
      return a.rating!.compareTo(b.rating!);
    });

    for (var tutor in _tutors) {
      final info = await TutorService.getTutorInfoById(
        token: token,
        userId: tutor.userId!,
      );
      _infos.add(info);
    }

    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    if (_isLoading && authProvider.token != null) {
      _fetchRecommendedTutors(authProvider);
    }

    return Scaffold(
      appBar: MyAppBar(),
      body: Stack(children: [
        const Positioned(bottom: 20, right: 20, child: GroupFixedButton()),
        ListView(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
              margin: const EdgeInsets.only(bottom: 12),
              width: double.infinity,
              color: const Color.fromARGB(255, 0, 75, 187),
              child: Column(children: [
                Text(AppLocalizations.of(context)!.upcoming_lesson,
                    style: const TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.w500))
                // TODO: Add time to next class
              ]),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              // alignment: Alignment.topLeft,
              child: Column(children: [
                Container(
                    alignment: Alignment.topLeft,
                    child: Text(AppLocalizations.of(context)!.find_tutor,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w700))),
                Row(
                  children: <Widget>[
                    Container(
                        width: 150,
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: AppLocalizations.of(context)!
                                  .search_tutor_name,
                              hintStyle: const TextStyle(
                                  fontSize: 14, color: Colors.grey)),
                        )),
                    const SizedBox(width: 20),
                    // TODO: Droplist Down
                    Container(
                        width: 120,
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: AppLocalizations.of(context)!
                                  .select_tutor_nationality,
                              hintStyle: const TextStyle(
                                  fontSize: 14, color: Colors.grey)),
                        )),
                  ],
                ),
                Container(
                    margin: const EdgeInsets.symmetric(vertical: 12),
                    alignment: Alignment.topLeft,
                    child: Text(AppLocalizations.of(context)!.input_free_time,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500))),
                Row(
                  children: <Widget>[
                    // TODO: DatePicker
                    Container(
                        width: 100,
                        child: TextField(
                          decoration: InputDecoration(
                              hintText:
                                  AppLocalizations.of(context)!.input_date,
                              hintStyle: const TextStyle(
                                  fontSize: 14, color: Colors.grey)),
                        )),
                    const SizedBox(width: 20),
                    // TODO: TimePicker
                    Flexible(
                        child: TextField(
                      decoration: InputDecoration(
                          hintText: AppLocalizations.of(context)!
                              .input_start_end_time,
                          hintStyle: const TextStyle(
                              fontSize: 14, color: Colors.grey)),
                    )),
                  ],
                ),
                // TODO: Add Data, render click
                Container(
                  alignment: Alignment.topLeft,
                  child: Wrap(
                    spacing: 4,
                    runSpacing: -20,
                    children: [
                      ...searchOptions.map((option) {
                        return GFButton(
                          onPressed: null,
                          text: option,
                          color: Colors.grey,
                          shape: GFButtonShape.pills,
                          size: 20,
                        );
                      }).toList()
                    ],
                  ),
                ),
                Container(
                    alignment: Alignment.topLeft,
                    child: GFButton(
                      onPressed: null,
                      text: AppLocalizations.of(context)!.reset_filters,
                      textStyle: const TextStyle(color: Colors.blue),
                      color: Colors.white,
                      textColor: Colors.yellow,
                      borderSide:
                          const BorderSide(width: 1, color: Colors.blue),
                      shape: GFButtonShape.pills,
                    )),
                Container(
                    margin: const EdgeInsets.only(bottom: 16, top: 10),
                    alignment: Alignment.topLeft,
                    child: Text(AppLocalizations.of(context)!.reset_filters,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w700))),
                // _isLoading
                //     ? const Center(child: CircularProgressIndicator())
                //     :
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _tutors.length,
                  itemBuilder: (context, index) {
                    return TutorItem(tutor: _tutors[index]);
                  },
                )
              ]),
            )
            // TODO: Add panigation
          ],
        )
      ]),
    );
  }
}
