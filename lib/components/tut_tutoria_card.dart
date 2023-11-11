import 'package:flutter/material.dart';
import 'package:turnero_taie_front/swagger_generated_code/api_model.swagger.dart';
import 'schedule_detail.dart';

class TutCard extends StatelessWidget {
  final ReadTutorUserSchedule tutoria;
  final Future<void> Function() fetchFn;

  const TutCard({super.key, required this.tutoria, required this.fetchFn});

  @override
  Widget build(BuildContext context) {
    final String dayOfWeek = tutoria.day;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: const Color.fromARGB(255, 50, 75, 118),
      elevation: 8,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(4, 10, 4, 6),
        child: Column(
          children: [
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    dayOfWeek,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 20,
                  )
                ],
              ),
              subtitle: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.01,
                      ),
                      child: Text(
                        '${tutoria.modality} con ${tutoria.capacity.toString()} asistentes',
                        style: const TextStyle(
                          color: Color.fromARGB(255, 203, 225, 255),
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.01,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.schedule,
                          color: Colors.white,
                          size: 21,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'de ${tutoria.begin.substring(0, tutoria.begin.length - 3)} a ${tutoria.end.substring(0, tutoria.end.length - 3)}',
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
          ],
        ),
      ),
    );
  }
}
