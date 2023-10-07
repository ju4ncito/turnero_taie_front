import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:turnero_taie_front/swagger_generated_code/api_model.swagger.dart';
import 'schedule_detail.dart';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

class TutCard extends StatelessWidget {
  final TutorUserSchedule tutoria;
  final Future<void> Function() fetchFn;

  const TutCard({super.key, required this.tutoria, required this.fetchFn});

  @override
  Widget build(BuildContext context) {
    // Parse the date string to a DateTime object
    final DateTime date = DateTime.parse(tutoria.day);

    // Format the date as a day of the week
    final String dayOfWeek = DateFormat('EEEE', 'es').format(date).capitalize();

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: const Color.fromARGB(255, 63, 92, 143),
      elevation: 8,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          children: [
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    dayOfWeek, // Display the day of the week
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 18,
                  )
                ],
              ),
              subtitle: Text(
                '${tutoria.modality} con ${tutoria.capacity.toString()} asistentes',
                style: const TextStyle(
                  color: Color.fromARGB(255, 203, 225, 255),
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
              onTap: () {
                print('Tutoria selected: $dayOfWeek');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ScheduleDetail(
                      tutorSchedule: tutoria,
                    ),
                  ),
                ).then((value) {
                  fetchFn();
                });
              },
            ),
            const Divider(
              height: 10,
              thickness: 0.5,
              indent: 35,
              endIndent: 35,
              color: Color.fromARGB(80, 255, 255, 255),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 8, right: 8, bottom: 12, top: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(
                    Icons.calendar_month_rounded,
                    color: Colors.white,
                    size: 21,
                  ),
                  Text(
                    tutoria.day,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.grey[100],
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(width: 30),
                  const Icon(
                    Icons.schedule,
                    color: Colors.white,
                    size: 21,
                  ),
                  Text(
                    'de ${tutoria.begin} a ${tutoria.end}',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.grey[100],
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
