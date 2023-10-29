import 'package:flutter/material.dart';

import 'calendar_tutor.dart';
import 'event_detail.dart';

class EventCard extends StatelessWidget {
  final Event event;
  final Future<void> Function() fetchFn;

  const EventCard({Key? key, required this.event, required this.fetchFn})
      : super(key: key);

  Color getColorFromStatus(String? status) {
    switch (status) {
      case 'Scheduled':
        return const Color.fromARGB(255, 63, 92, 143);
      case 'In Progress':
        return const Color.fromARGB(255, 69, 92, 54);
      case 'Done':
        return Colors.grey;
      default:
        return Colors.black;
    }
  }

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
                    "Asistentes: ${event.asistentes.toString()}",
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    "Estado: ${event.status ?? "Sin estado"}",
                    style: TextStyle(
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
                    builder: (context) => EventDetail(
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
