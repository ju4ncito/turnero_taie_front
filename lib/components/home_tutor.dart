import 'package:flutter/material.dart';
import 'tutoria_card.dart';

class TutoriasListWidget extends StatelessWidget {
  final List<Tutoria> tutorias = [
    Tutoria('Programacion 1', 'con Ramiro Ghilino '),
    Tutoria('Fisica 2', 'con Fran Gomez'),
    Tutoria('name', 'description')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: tutorias.length,
        itemBuilder: (context, index) {
          final tutoria = tutorias[index];
          return TutoriaCard(tutoria: tutoria);
        },
      ),
    );
  }
}
