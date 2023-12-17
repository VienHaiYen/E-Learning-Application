import 'booking_info.dart';
import 'calendar.dart';

class CalendarDetail {
  int? startPeriodTimestamp;
  int? endPeriodTimestamp;
  String? id;
  String? calendarId;
  String? startPeriod;
  String? endPeriod;
  String? createdAt;
  String? updatedAt;
  List<BookingInfo>? bookingInfo;
  bool? isBooked;
  Calendar? calendarInfo;

  CalendarDetail({
    this.startPeriodTimestamp,
    this.endPeriodTimestamp,
    this.id,
    this.calendarId,
    this.startPeriod,
    this.endPeriod,
    this.createdAt,
    this.updatedAt,
    this.bookingInfo,
    this.isBooked,
    this.calendarInfo,
  });

  CalendarDetail.fromJson(Map<String, dynamic> json) {
    startPeriodTimestamp = json['startPeriodTimestamp'];
    endPeriodTimestamp = json['endPeriodTimestamp'];
    id = json['id'];
    calendarId = json['calendarId'];
    startPeriod = json['startPeriod'];
    endPeriod = json['endPeriod'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['bookingInfo'] != null) {
      bookingInfo = <BookingInfo>[];
      json['bookingInfo'].forEach((v) {
        bookingInfo!.add(BookingInfo.fromJson(v));
      });
    }
    isBooked = json['isBooked'];
    calendarInfo = json['calendarInfo'] != null
        ? Calendar.fromJson(json['calendarInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['startPeriodTimestamp'] = startPeriodTimestamp;
    data['endPeriodTimestamp'] = endPeriodTimestamp;
    data['id'] = id;
    data['calendarId'] = calendarId;
    data['startPeriod'] = startPeriod;
    data['endPeriod'] = endPeriod;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (bookingInfo != null) {
      data['bookingInfo'] = bookingInfo!.map((v) => v.toJson()).toList();
    }
    data['isBooked'] = isBooked;
    if (calendarInfo != null) {
      data['calendarInfo'] = calendarInfo!.toJson();
    }
    return data;
  }
}
