import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'tutor_page.dart';
import 'package:turnero_taie_front/swagger_generated_code/api_model.swagger.dart';
import 'package:dropdown_search/dropdown_search.dart';

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
        automaticallyImplyLeading: false,
        title: Text(
          'A registrarse!',
          style: TextStyle(color: Colors.grey[900]),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(35.0),
            width: 500,
            child: Column(
              children: [
                Text(
                  '$userName, parece que es tu primera vez utilizando la app de Tutorias',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      color: Colors.grey[900],
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Text(
                  'Por favor, rellena los siguientes datos:',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      color: Colors.grey[900],
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                DropdownSearch<String>(
                  popupProps: const PopupProps.menu(
                    showSelectedItems: true,
                  ),
                  items: ["Ingenieria", "Medicina", 'Ciencias Quimicas'],
                  dropdownDecoratorProps: const DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      labelText: "Selecciona tu facultad",
                      hintText: "Facultad",
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                DropdownSearch<String>(
                  popupProps: const PopupProps.menu(
                    showSelectedItems: true,
                  ),
                  items: ["Brazil", "Tunisia", 'Canada'],
                  dropdownDecoratorProps: const DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      labelText: "Selecciona tu carrera",
                      hintText: "Carrera",
                    ),
                  ),
                ),
              ],
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

              final postresult = await api_model.apiUsersNewUserPost(
                  body: NewUserRequest(
                      careers: [1],
                      roles: ['STD'],
                      name: userName,
                      lastName: userName,
                      uccKey: int.parse(
                          userEmail.substring(0, userEmail.length - 11)),
                      email: userEmail,
                      academicYear: 1));

              print(postresult);

              if (postresult.statusCode == 201) {
                if (context.mounted) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return TutorPage(
                          userName: postresult.body?.name ?? '',
                          tutorId: postresult.body!.id,
                        );
                      },
                    ),
                  );
                }
              }
            },
            child: Text(
              'Continuar',
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
