import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:elearning_app/src/features/video_call/video_call_view.dart';
import 'package:elearning_app/src/models/schedule/booking_info.dart';
import 'package:elearning_app/src/providers/auth_provider.dart';
import 'package:elearning_app/src/services/user_service.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomepageHeader extends StatefulWidget {
  const HomepageHeader({Key? key}) : super(key: key);

  @override
  State<HomepageHeader> createState() => _HomepageHeaderState();
}

class _HomepageHeaderState extends State<HomepageHeader> {
  late Duration totalLessonTime;
  late BookingInfo upcomingClass;

  bool _isLoading = true;
  bool _isError = false;

  Future<void> _fetchTotalLessonTime(String token) async {
    try {
      final total = await UserService.getTotalLessonTime(token);
      final upcoming = await UserService.getUpcomingLesson(token);

      if (mounted) {
        setState(() {
          totalLessonTime = Duration(minutes: total);
          upcomingClass = upcoming;
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _isError = true;
      });
    }
  }

  String _convertTotalLessonTime() {
    if (totalLessonTime.inMinutes == 0) {
      return 'You have not attended any class';
    }

    String result = AppLocalizations.of(context)!.total_lession_time;

    final int hour = totalLessonTime.inHours;
    final int minute = totalLessonTime.inMinutes - hour * 60;
    result += hour > 0 ? ' $hour ${hour > 1 ? 'hours' : 'hour'}' : '';
    result += minute > 0 ? ' $minute ${minute > 1 ? 'minutes' : 'minute'}' : '';

    return result;
  }

  bool _isTimeToJoin() {
    final startTimestamp =
        upcomingClass.scheduleDetailInfo?.startPeriodTimestamp ?? 0;
    final startTime = DateTime.fromMillisecondsSinceEpoch(startTimestamp);
    final now = DateTime.now();
    return now.isAfter(startTime) || now.isAtSameMomentAs(startTime);
  }

  void _joinMeeting() async {
    final String meetingToken =
        upcomingClass.studentMeetingLink?.split('token=')[1] ?? '';
    Map<String, dynamic> jwtDecoded = JwtDecoder.decode(meetingToken);
    final String room = jwtDecoded['room'];
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();

    if (_isLoading && authProvider.token != null) {
      final String accessToken = authProvider.token?.access?.token as String;
      _fetchTotalLessonTime(accessToken);
    }

    return Container(
      color: const Color.fromARGB(255, 104, 168, 232),
      width: double.maxFinite,
      height: 208,
      child: _isLoading
          ? Center(
              child: _isError
                  ? Text(
                      AppLocalizations.of(context)!.error_upcoming_lesson,
                      style: TextStyle(color: Colors.white),
                    )
                  : const CircularProgressIndicator(
                      color: Colors.white,
                    ),
            )
          : Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    AppLocalizations.of(context)!.upcoming_lesson,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Text(
                  '${DateFormat.yMMMEd().format(DateTime.fromMillisecondsSinceEpoch(upcomingClass.scheduleDetailInfo!.startPeriodTimestamp ?? 0))} '
                  '${DateFormat.Hm().format(DateTime.fromMillisecondsSinceEpoch(upcomingClass.scheduleDetailInfo!.startPeriodTimestamp ?? 0))} - '
                  '${DateFormat.Hm().format(DateTime.fromMillisecondsSinceEpoch(upcomingClass.scheduleDetailInfo!.endPeriodTimestamp ?? 0))}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: TextButton(
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 16),
                          backgroundColor: Colors.white),
                      onPressed: () {
                        if (_isTimeToJoin()) {
                          _joinMeeting();
                        } else {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              final start = upcomingClass
                                  .scheduleDetailInfo!.startPeriodTimestamp!;
                              return VideoCallView(startTimestamp: start);
                            },
                          ));
                        }
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(width: 12),
                          Text(AppLocalizations.of(context)!.enter_lesson_room,
                              style: TextStyle(fontSize: 14)),
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 16),
                  child: Text(
                    _convertTotalLessonTime(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
    );
  }
}
