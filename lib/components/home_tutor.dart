import 'package:flutter/material.dart';
import 'tutoria_card.dart';
import '../api/api_manager.dart';

class TutoriasListWidget extends StatelessWidget {
// pasar Id para api
  final apiManager = ApiManager();
  // Future<void> fetchTutorias() async {
  //   try {
  //     final response = await apiManager.apiModel.apiTutorshipInstancesByUserGet();
  //     if (response.statusCode == 200) {

  //     } else {}
  //   } catch (error) {}
  // }
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
