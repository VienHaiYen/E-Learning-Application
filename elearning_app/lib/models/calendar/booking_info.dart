import 'class_review.dart';
import 'calendar_detail.dart';

class BookingInfo {
  int? createdAtTimeStamp;
  int? updatedAtTimeStamp;
  String? id;
  String? userId;
  String? calendarDetailId;
  String? tutorMeetingLink;
  String? studentMeetingLink;
  String? studentRequest;
  String? tutorReview;
  int? scoreByTutor;
  String? createdAt;
  String? updatedAt;
  String? recordUrl;

  bool? isDeleted;
  CalendarDetail? calendarDetailInfo;
  ClassReview? classReview;

  BookingInfo({
    this.createdAtTimeStamp,
    this.updatedAtTimeStamp,
    this.id,
    this.userId,
    this.calendarDetailId,
    this.tutorMeetingLink,
    this.studentMeetingLink,
    this.studentRequest,
    this.tutorReview,
    this.scoreByTutor,
    this.createdAt,
    this.updatedAt,
    this.recordUrl,
    this.isDeleted,
    this.calendarDetailInfo,
    this.classReview,
  });

  BookingInfo.fromJson(Map<String, dynamic> json) {
    createdAtTimeStamp = json['createdAtTimeStamp'];
    updatedAtTimeStamp = json['updatedAtTimeStamp'];
    id = json['id'];
    userId = json['userId'];
    calendarDetailId = json['calendarDetailId'];
    tutorMeetingLink = json['tutorMeetingLink'];
    studentMeetingLink = json['studentMeetingLink'];
    studentRequest = json['studentRequest'];
    tutorReview = json['tutorReview'];
    scoreByTutor = json['scoreByTutor'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    recordUrl = json['recordUrl'];

    isDeleted = json['isDeleted'];
    calendarDetailInfo = json['calendarDetailInfo'] != null
        ? CalendarDetail.fromJson(json['calendarDetailInfo'])
        : null;
    classReview = json['classReview'] != null
        ? ClassReview.fromJson(json['classReview'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['createdAtTimeStamp'] = createdAtTimeStamp;
    data['updatedAtTimeStamp'] = updatedAtTimeStamp;
    data['id'] = id;
    data['userId'] = userId;
    data['calendarDetailId'] = calendarDetailId;
    data['tutorMeetingLink'] = tutorMeetingLink;
    data['studentMeetingLink'] = studentMeetingLink;
    data['studentRequest'] = studentRequest;
    data['tutorReview'] = tutorReview;
    data['scoreByTutor'] = scoreByTutor;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['recordUrl'] = recordUrl;
    data['isDeleted'] = isDeleted;
    if (calendarDetailInfo != null) {
      data['calendarDetailInfo'] = calendarDetailInfo!.toJson();
    }
    if (classReview != null) {
      data['classReview'] = classReview!.toJson();
    }
    return data;
  }
}
