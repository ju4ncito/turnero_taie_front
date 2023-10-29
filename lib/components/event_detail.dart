import 'package:flutter/material.dart';
import '../utils.dart';

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
              'Title: ${event.title}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Main Tutor: ${event.mainTutor}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Date Range: ${event.rangoT.start} - ${event.rangoT.end}',
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
