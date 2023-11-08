import 'dart:collection';
import 'package:table_calendar/table_calendar.dart';

class Event {
  final String? area;
  final int? asistentes;
  final String? status;
  final int? id;

  const Event(this.area, this.asistentes, this.status, this.id);
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
