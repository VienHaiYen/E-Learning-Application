import 'package:elearning_app/models/calendar/calendar_detail.dart';
import 'package:elearning_app/models/tutor/tutor.dart';

class Calendar {
  String? id;
  String? tutorId;
  String? startTime;
  String? endTime;
  int? startTimestamp;
  int? endTimestamp;
  String? createdAt;
  bool? isBooked;
  List<CalendarDetail>? calendarDetails;
  Tutor? tutorInfo;

  Calendar({
    this.id,
    this.tutorId,
    this.startTime,
    this.endTime,
    this.startTimestamp,
    this.endTimestamp,
    this.createdAt,
    this.isBooked,
    this.calendarDetails,
    this.tutorInfo,
  });

  Calendar.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tutorId = json['tutorId'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    startTimestamp = json['startTimestamp'];
    endTimestamp = json['endTimestamp'];
    createdAt = json['createdAt'];
    isBooked = json['isBooked'];
    if (json['calendarDetails'] != null) {
      calendarDetails = <CalendarDetail>[];
      json['calendarDetails'].forEach((v) {
        calendarDetails!.add(CalendarDetail.fromJson(v));
      });
    }
    tutorInfo =
        json['tutorInfo'] != null ? Tutor.fromJson(json['tutorInfo']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['tutorId'] = tutorId;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    data['startTimestamp'] = startTimestamp;
    data['endTimestamp'] = endTimestamp;
    data['createdAt'] = createdAt;
    data['isBooked'] = isBooked;
    if (calendarDetails != null) {
      data['calendarDetails'] =
          calendarDetails!.map((v) => v.toJson()).toList();
    }
    if (tutorInfo != null) {
      data['tutorInfo'] = tutorInfo!.toJson();
    }
    return data;
  }
}
