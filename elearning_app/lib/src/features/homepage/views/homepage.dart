import 'package:flutter/material.dart';
import 'package:elearning_app/src/models/tutor/tutor.dart';
import 'package:elearning_app/src/models/tutor/tutor_info.dart';
import 'package:elearning_app/src/providers/auth_provider.dart';
import 'package:elearning_app/src/services/tutor_service.dart';
import 'package:elearning_app/src/services/user_service.dart';
import 'package:provider/provider.dart';

import '../widgets/homepage_header.dart';
import '../widgets/tutor_card.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Tutor> _tutors = [];
  List<TutorInfo> _infos = [];
  bool _isLoading = true;

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

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HomepageHeader(),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              AppLocalizations.of(context)!.suggested_tutors,
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _tutors.length,
                  itemBuilder: (context, index) {
                    return TutorCard(tutor: _tutors[index]);
                  },
                )
        ],
      ),
    );
  }
}
