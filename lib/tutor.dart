import 'package:flutter/material.dart';

class TutorPage extends StatelessWidget {
  TutorPage({Key? key}) : super(key: key);

  // Dummy list of tutorships
  final List<String> tutorships = [
    'Tutoria 1',
    'Tutoria 2',
    'Tutoria 3',
    'Tutoria 4',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tutorias'),
      ),
      body: ListView.builder(
        itemCount: tutorships.length,
        itemBuilder: (context, index) {
          final tutorship = tutorships[index];
          return ListTile(
            title: Text(tutorship),
            onTap: () {
              print(' Tutoria seleccionada: $tutorship');
            },
          );
        },
      ),
    );
  }
}
