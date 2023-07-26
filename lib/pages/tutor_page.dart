import 'package:flutter/material.dart';

class TutorPage extends StatelessWidget {
  final String? userName;

  TutorPage({Key? key, required this.userName}) : super(key: key);

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
        backgroundColor: Colors.grey[50],
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.grey[900]),
        title: Text(
          'Bienvenido, $userName',
          style: TextStyle(color: Colors.grey[900]),
        ),
      ),
      body: ListView.builder(
        itemCount: tutorships.length,
        itemBuilder: (context, index) {
          final tutorship = tutorships[index];
          return ListTile(
            title: Text(tutorship),
            onTap: () {
              print('Tutoria seleccionada: $tutorship');
            },
          );
        },
      ),
    );
  }
}
