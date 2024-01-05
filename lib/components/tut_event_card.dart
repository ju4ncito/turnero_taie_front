import 'package:flutter/material.dart';
import 'package:turnero_taie_front/components/tut_event_info.dart';
import 'event.dart';
import 'helper_functions.dart';

class EventCard extends StatelessWidget {
  final Event event;
  final Future<void> Function() fetchFn;

  const EventCard({Key? key, required this.event, required this.fetchFn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color cardColor = getColorFromStatus(event.status);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: cardColor,
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    event.area ?? "No se encontro el area",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 2, 4, 6),
                        child: Text(
                          "ver detalle",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white70,
                        size: 16,
                      ),
                    ],
                  ),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Text(
                    "Asistentes: ${event.users!.length - 1}",
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    "Modalidad: ${event.schedule?.modality ?? "Sin estado"}",
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              onTap: () {
                print('Event selected: ${event.area}');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EventInfo(
                      event: event,
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
