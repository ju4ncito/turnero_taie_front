import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:turnero_taie_front/swagger_generated_code/api_model.swagger.dart';
import '../api/api_manager.dart';
import 'dart:collection';
import 'event_detail.dart';
import '../components/tut_event_card.dart';

class TableEventsExample extends StatefulWidget {
  const TableEventsExample({Key? key});

  @override
  _TableEventsExampleState createState() => _TableEventsExampleState();
}

class _TableEventsExampleState extends State<TableEventsExample> {
  late final ValueNotifier<List<Event>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  final ApiManager apiManager = ApiManager();
  List<TutorshipInstance> instances = [];
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    fetchInstances();

    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier([]);
  }

  bool isLoading = true;

  Future<void> fetchInstances() async {
    setState(() {
      isLoading = true;
    });

    try {
      final response = await apiManager.apiModel.apiTutorshipInstancesGet();
      if (response.statusCode == 200) {
        setState(() {
          kEvents.clear();

          instances = List<TutorshipInstance>.from(response.body ?? []);
          for (final TutorshipInstance instance in instances) {
            print('Area: ${instance.area}');

            final DateTime startDateTime = instance.date;
            final eventDate = DateTime(
              startDateTime.year,
              startDateTime.month,
              startDateTime.day,
            );
            if (!kEvents.containsKey(eventDate)) {
              kEvents[eventDate] = [];
            }
            print("kEvents: $kEvents");

            kEvents[eventDate]!.add(
              Event(
                instance.area,
                instance.users.length - 1,
                instance.status,
                instance.id,
              ),
            );
          }
        });
      } else {}
    } catch (error) {
      // Handle error
    }

    setState(() {
      isLoading = false;
    });

    _selectedEvents.value = kEvents[_selectedDay] ?? [];
    print("Selected Events in future function: ${_selectedEvents.value}");
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    _selectedDay = DateTime(
      selectedDay.year,
      selectedDay.month,
      selectedDay.day,
      focusedDay.hour,
      focusedDay.minute,
      focusedDay.second,
    );

    print('Selected Day: $_selectedDay');

    setState(() {
      _focusedDay = focusedDay;
    });

    if (kEvents.containsKey(_selectedDay)) {
      _selectedEvents.value = List.from(kEvents[_selectedDay]!);
    } else {
      _selectedEvents.value = [];
    }

    print("Selected Events on day selected: ${_selectedEvents.value}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 5,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          TableCalendar<Event>(
            calendarBuilders:
                CalendarBuilders(singleMarkerBuilder: (context, date, events) {
              final status = events.status;
              Color color;
              switch (status) {
                case 'Scheduled':
                  color = const Color.fromARGB(255, 29, 69, 140);
                  break;
                case 'In Progress':
                  color = const Color.fromARGB(255, 64, 106, 36);
                  break;
                case 'Done':
                  color = Colors.grey;
                  break;
                default:
                  color = Colors.black;
              }

              return Container(
                decoration: BoxDecoration(shape: BoxShape.circle, color: color),
                width: 11.0,
                height: 11.0,
                margin: const EdgeInsets.symmetric(horizontal: 1.5),
              );
            }),
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            calendarFormat: _calendarFormat,
            availableCalendarFormats: const {
              CalendarFormat.month: 'Month',
            },
            eventLoader: (day) {
              final selectedDateEvents = kEvents[day];
              return selectedDateEvents ?? [];
            },
            startingDayOfWeek: StartingDayOfWeek.monday,
            calendarStyle: const CalendarStyle(
              outsideDaysVisible: true,
            ),
            onDaySelected: _onDaySelected,
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          const SizedBox(height: 8.0),
          const Divider(
            height: 10,
            thickness: 0.5,
            indent: 35,
            endIndent: 35,
            color: Color.fromARGB(255, 49, 52, 95),
          ),
          Expanded(
            child: ValueListenableBuilder<List<Event>>(
              valueListenable: _selectedEvents,
              builder: (context, value, _) {
                print("ValueListenableBuilder called");
                print("Selected Events Length: ${value.length}");
                return ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    return EventCard(
                      event: value[index],
                      fetchFn: fetchInstances,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

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
