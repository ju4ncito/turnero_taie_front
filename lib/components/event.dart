import 'dart:collection';
import 'package:table_calendar/table_calendar.dart';
import 'package:turnero_taie_front/swagger_generated_code/api_model.swagger.dart';

class Event {
  final String? area;
  final int? asistentes;
  final TutorshipInstanceStatusEnum? status;
  final int? id;
  final ReadTutorUserSchedule? schedule;
  final List<int>? users;
  final int? tutorshipId;
  final DateTime date;
  final int areaId;
  final String? zoomLink;

  const Event(this.area, this.asistentes, this.status, this.id, this.schedule,
      this.users, this.tutorshipId, this.date, this.areaId, this.zoomLink);
}

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);

final kEvents = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode,
);
