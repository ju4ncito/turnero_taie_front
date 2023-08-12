import 'package:flutter/material.dart';

class Tutoria {
  final String name;
  final String description;

  Tutoria(this.name, this.description);
}

class TutoriasListWidget extends StatelessWidget {
  final List<Tutoria> tutorias = [
    Tutoria('Tutoria 1', 'Description for Tutoria 1'),
    Tutoria('Tutoria 2', 'Description for Tutoria 2'),
    Tutoria('Tutoria 3', 'Description for Tutoria 3'),
    // Add more tutorias here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: tutorias.length,
        itemBuilder: (context, index) {
          final tutoria = tutorias[index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text(tutoria.name),
              subtitle: Text(tutoria.description),
              onTap: () {
                // Handle tutoria item tap
                print('Tutoria selected: ${tutoria.name}');
              },
            ),
          );
        },
      ),
    );
  }
}
