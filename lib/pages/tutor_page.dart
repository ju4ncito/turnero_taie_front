import 'package:flutter/material.dart';
// import 'package:turnero_taie_front/swagger_generated_code/api_model.swagger.dart';

class TutorPage extends StatelessWidget {
  final String? userName;
  final tutorId;

  TutorPage({Key? key, required this.userName, required this.tutorId})
      : super(key: key);

  // // Dummy list of tutorships
  // Future<List> tutorships() async {
  //   final api_model =
  //       ApiModel.create(baseUrl: Uri.parse('http://127.0.0.1:8000'));

  //   final tutorshipsresult =
  //       await api_model.apiUserXTutorshipInstanceXRoleGet();
  //   final List<String> tutorships = [];
  //   return tutorships;
  // }

  final List<String> tutorships = ['-> Tutoria 1', '-> Tutoria 2'];

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
