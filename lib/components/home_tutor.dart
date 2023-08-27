import 'package:flutter/material.dart';
import 'package:turnero_taie_front/swagger_generated_code/api_model.swagger.dart';
import 'tutoria_card.dart';
import '../api/api_manager.dart';
import 'add_tutoria.dart';

class TutoriasListWidget extends StatelessWidget {
  final User? currentUser;
  final ApiManager apiManager = ApiManager();

  final List<Tutoria> tutorias = [
    Tutoria('Programacion 1', 'con Ramiro Ghilino '),
    Tutoria('Fisica 2', 'con Fran Gomez'),
    Tutoria('name', 'description'),
  ];

  TutoriasListWidget({Key? key, required this.currentUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView.builder(
            itemCount: tutorias.length,
            itemBuilder: (context, index) {
              final tutoria = tutorias[index];
              return TutoriaCard(tutoria: tutoria);
            },
          ),
          Positioned(
            bottom: 20,
            right: 40,
            left: 40,
            child: Container(
              width: (MediaQuery.of(context).size.width),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddTutoriaPage(
                          currentUser: currentUser), // Pass the currentUser
                    ),
                  );
                },
                child: Text('Aniadir un nuevo horario'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
