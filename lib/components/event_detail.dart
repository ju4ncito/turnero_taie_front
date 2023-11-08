import 'package:flutter/material.dart';
import 'event.dart';

class EventDetail extends StatelessWidget {
  final Event event;

  EventDetail({required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title: ${event.area}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Asistentes: ${event.asistentes}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Status: ${event.status}',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement the logic for handling the event, e.g., delete or edit.
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: const Text('Edit Event'),
            ),
          ],
        ),
      ),
    );
  }
}
