import 'package:flutter/material.dart';
import 'package:turnero_taie_front/swagger_generated_code/api_model.swagger.dart';
import 'tutor_page.dart';

class LoginPage extends StatefulWidget {
  final String userName, userEmail;
  const LoginPage({Key? key, required this.userName, required this.userEmail})
      : super(key: key);

  @override
  _LoginPageState createState() =>
      _LoginPageState(userName: userName, userEmail: userEmail);
}

class _LoginPageState extends State<LoginPage> {
  final String userName, userEmail;
  _LoginPageState({Key? key, required this.userName, required this.userEmail});
  bool _showAdditionalDropdown = false;

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
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                margin: const EdgeInsets.all(35.0),
                width: 500,
                child: Column(
                  children: [
                    Text(
                      '${widget.userName}, parece que es tu primera vez utilizando la app de Tutorias',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 50),
                    Text(
                      'Por favor, rellena los siguientes datos:',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 20),
                    if (!_showAdditionalDropdown)
                      DropdownButtonFormField<String>(
                        items: [
                          "Ingenieria",
                          "Medicina",
                          'Ciencias Quimicas',
                          'a',
                          'b'
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          // Handle dropdown value change
                        },
                        decoration: const InputDecoration(
                          labelText: "Selecciona tu facultad",
                          hintText: "Facultad",
                        ),
                      ),
                    if (_showAdditionalDropdown)
                      DropdownButtonFormField<String>(
                        items: [
                          "Inge",
                          "Med",
                          'Cie',
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          // Handle dropdown value change
                        },
                        decoration: const InputDecoration(
                          labelText: "Selecciona tu facultad",
                          hintText: "Facultad",
                        ),
                      ),
                    if (_showAdditionalDropdown)
                      DropdownButtonFormField<String>(
                        items: [
                          "Sistemas",
                          "Computacion",
                          'Electronica',
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          // Handle dropdown value change
                        },
                        decoration: const InputDecoration(
                          labelText: "Selecciona tu carrera",
                          hintText: "Carrera",
                        ),
                      ),
                    const SizedBox(height: 10),
                    if (!_showAdditionalDropdown)
                      DropdownButtonFormField<String>(
                        items: [
                          "Sistemas",
                          "Computacion",
                          'Electronica',
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          // Handle dropdown value change
                        },
                        decoration: const InputDecoration(
                          labelText: "Selecciona tu carrera",
                          hintText: "Carrera",
                        ),
                      ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 91, 66, 118),
                      ),
                      onPressed: () {
                        setState(() {
                          _showAdditionalDropdown = true;
                        });
                      },
                      child: const Text(
                        'Agregar otra carrera',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 200),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final api_model =
              ApiModel.create(baseUrl: Uri.parse('http://127.0.0.1:8000'));

          final postresult = await api_model.apiUsersNewUserPost(
              body: NewUserRequest(
                  careers: [1],
                  roles: ['STD'],
                  name: userName,
                  lastName: userName,
                  uccKey:
                      int.parse(userEmail.substring(0, userEmail.length - 11)),
                  email: userEmail,
                  academicYear: 1));

          print(postresult.statusCode);

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
        label: const Text(
          'Continuar con el registro',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        icon: const Icon(
          Icons.arrow_forward_ios,
          size: 14,
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
