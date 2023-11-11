import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:turnero_taie_front/swagger_generated_code/api_model.swagger.dart';

import '../api/api_manager.dart';

class SearchSchedulePage extends StatefulWidget {
  final apiManager = AuthenticatedApiManager();
  final ReadTutorUserSchedule tutorUserSchedule;

  SearchSchedulePage({required this.tutorUserSchedule});

  @override
  _SearchSchedulePageState createState() =>
      _SearchSchedulePageState(tutorUserSchedule: tutorUserSchedule);
}

class _SearchSchedulePageState extends State<SearchSchedulePage> {
  final apiManager = AuthenticatedApiManager();

  final ReadTutorUserSchedule tutorUserSchedule;

  _SearchSchedulePageState({required this.tutorUserSchedule});

  String _selectedArea = '';

  @override
  void initState() {
    super.initState();
    if (widget.tutorUserSchedule.tutorUser.areas.isNotEmpty) {
      _selectedArea = widget.tutorUserSchedule.tutorUser.areas[0];
    }
  }

  String capitalize(String s) {
    if (s.isEmpty) {
      return "";
    } else {
      return s[0].toUpperCase() + s.substring(1);
    }
  }

// Funcion de dias de semana
  List<DateTime> generateDates() {
    int scheduleDayOfWeek;
    switch (tutorUserSchedule.day.toLowerCase()) {
      case 'lunes':
        scheduleDayOfWeek = 1;
        break;
      case 'martes':
        scheduleDayOfWeek = 2;
        break;
      case 'miércoles':
        scheduleDayOfWeek = 3;
        break;
      case 'jueves':
        scheduleDayOfWeek = 4;
        break;
      case 'viernes':
        scheduleDayOfWeek = 5;
        break;
      case 'sabado':
        scheduleDayOfWeek = 6;
        break;
      case 'domingo':
        scheduleDayOfWeek = 7;
        break;
      default:
        throw Exception('Invalid schedule day');
    }

    DateTime nextDate = DateTime.now();
    while (nextDate.weekday != scheduleDayOfWeek) {
      nextDate = nextDate.add(const Duration(days: 1));
    }
    List<DateTime> dates =
        List.generate(5, (index) => nextDate.add(Duration(days: index * 7)));

    return dates;
  }

  Widget build(BuildContext context) {
    List<DateTime> _dates = generateDates();
    String _selectedDate = DateFormat('yyyy-MM-dd').format(_dates[0]);
    String _selectedDateString = DateFormat('yyyy-MM-dd').format(_dates[0]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reserva del Horario'),
        backgroundColor: const Color.fromARGB(255, 19, 45, 88),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    tutorUserSchedule.day,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
              const SizedBox(height: 25),
              const Text('Tutor', style: TextStyle(fontSize: 18)),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    ClipOval(
                      child: Image(
                          image: tutorUserSchedule.tutorUser.profilePicture !=
                                  null
                              ? NetworkImage(
                                  tutorUserSchedule.tutorUser.profilePicture!)
                              : const AssetImage(
                                      'assets/images/default_profile_picture.png')
                                  as ImageProvider,
                          width: 50,
                          height: 50),
                    ),
                    const SizedBox(width: 15),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${tutorUserSchedule.tutorUser.firstName} ${tutorUserSchedule.tutorUser.lastName}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          tutorUserSchedule.tutorUser.areas[0],
                          style:
                              const TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text('Detalles de la tutoría',
                  style: TextStyle(fontSize: 18)),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Inicio',
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold),
                      ),
                      ElevatedButton(
                        onPressed: null,
                        child: Text(
                          tutorUserSchedule.begin
                              .substring(0, tutorUserSchedule.begin.length - 3),
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Final',
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold),
                      ),
                      ElevatedButton(
                        onPressed: null,
                        child: Text(
                          tutorUserSchedule.end
                              .substring(0, tutorUserSchedule.begin.length - 3),
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                    width: 30,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Modalidad',
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold),
                      ),
                      ElevatedButton(
                        onPressed: null,
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 30, 56, 102))),
                        child: Text(
                          tutorUserSchedule.modality,
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Selecciona una fecha',
                    style: TextStyle(
                        color: Colors.blueGrey, fontWeight: FontWeight.bold),
                  ),
                  DropdownButton<String>(
                    value: _selectedDate,
                    items: _dates.map((DateTime date) {
                      return DropdownMenuItem<String>(
                        value: DateFormat('yyyy-MM-dd').format(date),
                        child: Text(capitalize(
                            DateFormat('EEEE dd-MM', 'es_AR').format(date))),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      _selectedDate = newValue!;
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Que área necesitas aprender?',
                    style: TextStyle(
                        color: Colors.blueGrey, fontWeight: FontWeight.bold),
                  ),
                  DropdownButton<String>(
                    value: _selectedArea,
                    items: tutorUserSchedule.tutorUser.areas.map((String area) {
                      return DropdownMenuItem<String>(
                        value: area,
                        child: Text(area),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedArea = newValue!;
                      });
                    },
                  ),
                ],
              ),
              const Spacer(),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 6 / 7,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      DateTime selectedDate =
                          DateFormat('yyyy-MM-dd').parse(_selectedDateString);

                      final tutoriaRequest = EnrollRequest(
                          scheduleId: tutorUserSchedule.id,
                          date: selectedDate,
                          areaId: tutorUserSchedule.tutorUser.areas
                              .indexOf(_selectedArea));

                      print("Tutoria Request Body: ${tutoriaRequest.toJson()}");

                      final localContext = context;
                      final apiManager = AuthenticatedApiManager();
                      final postResult = await apiManager.apiModel
                          .apiTutorshipInstancesEnrollTutorshipPost(
                        body: tutoriaRequest,
                      );

                      print(postResult.error);
                      print(postResult);
                      print(
                          "API INscripcion a instancia Response Status Code: ${postResult.statusCode}");

                      if (context.mounted) {
                        Navigator.pop(localContext);
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 30, 56, 102),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9),
                        ),
                      ),
                      elevation: MaterialStateProperty.all(4),
                    ),
                    child: const Text(
                      'Agendar tutoría',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
