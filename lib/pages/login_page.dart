import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'tutor_page.dart';
import 'package:turnero_taie_front/swagger_generated_code/api_model.swagger.dart';

class LoginPage extends StatelessWidget {
  final String userName, userEmail;
  const LoginPage({Key? key, required this.userName, required this.userEmail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.grey[900]),
        title: Text(
          'reg',
          style: TextStyle(color: Colors.grey[900]),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(30.0),
            width: 500,
            child: Text(
              'Registro',
              textAlign: TextAlign.left,
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                  color: Colors.grey[900],
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(height: 400),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
            ),
            onPressed: () async {
              final api_model =
                  ApiModel.create(baseUrl: Uri.parse('http://127.0.0.1:8000'));

              final postresult = await api_model.apiUsersPost(
                  body: UserRequest(
                      name: userName,
                      email: userEmail,
                      lastName: userName,
                      academicYear: 1,
                      uccKey: int.parse(
                          userEmail.substring(0, userEmail.length - 11))));
              print(postresult.statusCode);
              if (postresult.statusCode == 201) {
                final resultCareer = await api_model.apiCareerXUserPost(
                    body: CareerXUserRequest(
                        career: 1, user: postresult.body!.id));
                print(
                    ' resultado de career ${resultCareer.statusCode} , ${resultCareer.body}');

                final resultRole = await api_model.apiUserXRolePost(
                    body: UserXRoleRequest(user: postresult.body!.id, role: 1));

                print(
                    ' resultado de ROLE ${resultRole.statusCode} , ${resultRole.body}');
              }
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TutorPage(
                    userName: userName,
                  ),
                ),
              );
            },
            child: Text('Continuar'),
          ),
        ],
      ),
    );
  }
}
