import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:turnero_taie_front/components/std_event_card.dart';
import 'package:turnero_taie_front/swagger_generated_code/api_model.swagger.dart';
import '../api/api_manager.dart';
import '../components/tut_event_card.dart';
import 'event.dart';

class CalendarAlumno extends StatefulWidget {
  const CalendarAlumno({super.key});

  @override
  CalendarAlumnoState createState() => CalendarAlumnoState();
}

class CalendarAlumnoState extends State<CalendarAlumno> {
  late final ValueNotifier<List<Event>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  final AuthenticatedApiManager apiManager = AuthenticatedApiManager();
  List<SearchTutorship> instances = [];
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

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  Future<void> fetchInstances() async {
    setState(() {
      isLoading = true;
    });

    try {
      final response = await apiManager.apiModel
          .apiTutorshipInstancesGet(role: 'STD', page: 'calendar');
      if (response.statusCode == 200) {
        setState(() {
          kEvents.clear();

          instances = List<SearchTutorship>.from(response.body ?? []);
          for (final SearchTutorship instance in instances) {
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
                  instance.area.name,
                  instance.users.length - 1,
                  instance.status,
                  instance.schedule.id,
                  instance.schedule,
                  instance.users,
                  instance.id,
                  instance.date,
                  instance.area.id,
                  instance.zoomLink),
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
            locale: 'es_AR',
            headerStyle: HeaderStyle(
              titleTextFormatter: (date, locale) => DateFormat.yMMMM(locale)
                  .format(date)
                  .capitalize(), // Capitaliza el primer caracter del nombre del mes

              titleCentered: true,
              formatButtonVisible: false,
              titleTextStyle: const TextStyle(
                fontSize: 18,
              ),
            ),
            calendarBuilders:
                CalendarBuilders(singleMarkerBuilder: (context, date, events) {
              final status = events.status;
              Color color;
              switch (status) {
                case TutorshipInstanceStatusEnum.scheduled:
                  color = const Color.fromARGB(255, 29, 69, 140);
                  break;
                case TutorshipInstanceStatusEnum.inProgress:
                  color = const Color.fromARGB(255, 64, 106, 36);
                  break;
                case TutorshipInstanceStatusEnum.done:
                  color = Colors.grey;
                  break;
                case TutorshipInstanceStatusEnum.cancelled:
                  color = const Color.fromARGB(255, 102, 30, 30);
                  break;
                case TutorshipInstanceStatusEnum.delayed:
                  color = const Color.fromARGB(255, 78, 67, 9);
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
                if (value.isEmpty) {
                  return const Center(
                    child: Text(
                      'No tienes nada para este dia!',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                      ),
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    return StdEventCard(
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

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
