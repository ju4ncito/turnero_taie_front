import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:turnero_taie_front/components/std_schedule_info.dart';
import 'package:turnero_taie_front/swagger_generated_code/api_model.swagger.dart';
import 'helper_functions.dart';

class StdCard extends StatelessWidget {
  final SearchTutorship tutoria;
  final Future<void> Function() fetchFn;

  const StdCard({super.key, required this.tutoria, required this.fetchFn});

  @override
  Widget build(BuildContext context) {
    final String dayOfWeek = tutoria.schedule.day;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: getColorFromStatus(tutoria.status),
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ' ${tutoria.area.name}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        ' ${dayOfWeek} ${DateFormat(' dd-MM', 'es_AR').format(tutoria.date)}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
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
                        '${tutoria.schedule.modality} con ${tutoria.schedule.tutorUser.firstName}',
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
                          'de ${tutoria.schedule.begin.substring(0, tutoria.schedule.begin.length - 3)} a ${tutoria.schedule.end.substring(0, tutoria.schedule.end.length - 3)} - ${translateStatusToSpanish(tutoria.status!)}',
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
                    builder: (context) => ScheduleInfo(
                      tutorInstance: tutoria,
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
