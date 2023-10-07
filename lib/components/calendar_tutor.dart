import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:turnero_taie_front/swagger_generated_code/api_model.swagger.dart';
import '../api/api_manager.dart';
import 'dart:collection';

class TableEventsExample extends StatefulWidget {
  const TableEventsExample({Key? key});

  @override
  _TableEventsExampleState createState() => _TableEventsExampleState();
}

class _TableEventsExampleState extends State<TableEventsExample> {
  late final ValueNotifier<List<Event>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  final ApiManager apiManager = ApiManager();
  List<TutorUserSchedule>? schedules = []; // Store the fetched schedules
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    fetchSchedules();

    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier([]); // Initialize as an empty list
  }

  bool isLoading = true;

  Future<void> fetchSchedules() async {
    setState(() {
      isLoading = true;
    });

    try {
      final response = await apiManager.apiModel.apiTutorUserSchedulesGet();
      if (response.statusCode == 200) {
        setState(() {
          schedules = List<TutorUserSchedule>.from(response.body ?? []);

          // Populate kEvents here
          kEvents.clear(); // Clear existing data
          for (final TutorUserSchedule schedule in schedules!) {
            final String startTimeStr = "${schedule.day}T${schedule.begin}";
            final String endTimeStr = "${schedule.day}T${schedule.end}";
            final DateTime startDateTime = DateTime.parse(startTimeStr);
            final DateTime endDateTime = DateTime.parse(endTimeStr);

            // Add events to kEvents
            final eventDate = DateTime(
              startDateTime.year,
              startDateTime.month,
              startDateTime.day,
            );
            if (!kEvents.containsKey(eventDate)) {
              kEvents[eventDate] = [];
            }

            kEvents[eventDate]!.add(
              Event(
                schedule.modality,
                schedule.tutorUser.toString(),
                DateTimeRange(start: startDateTime, end: endDateTime),
              ),
            );
          }
        });
      } else {
        // Handle error
      }
    } catch (error) {
      // Handle error
    }

    setState(() {
      isLoading = false;
    });

    // Set _selectedEvents.value after populating kEvents
    _selectedEvents.value = kEvents[_selectedDay] ?? [];
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    // Implementation example
    return kEvents[day] ?? [];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    // Set _selectedDay to match the format used in kEvents
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
  }

  @override
  Widget build(BuildContext context) {
    final kEvents = LinkedHashMap<DateTime, List<Event>>(
      equals: isSameDay,
    );

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
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 5.0,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: ListTile(
                        onTap: () => print('${value[index]}'),
                        title: Text('${value[index].title}'),
                        subtitle: Text('${value[index].mainTutor}'),
                        trailing: Text(
                          '${value[index].rangoT.start.hour}:${value[index].rangoT.start.minute}-${value[index].rangoT.end.hour}:${value[index].rangoT.end.minute}',
                        ),
                      ),
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
  final String title;
  final String mainTutor;
  final DateTimeRange rangoT;

  const Event(this.title, this.mainTutor, this.rangoT);

  @override
  String toString() => title;
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);

final kEvents = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
);
