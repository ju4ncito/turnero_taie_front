import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  final String userName, userEmail;
  const LoginPage({Key? key, required this.userName, required this.userEmail})
      : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showAdditionalDropdown = false;
  String _selectedAdditionalOption = '';

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
                      child: Text(
                        'Agregar otra carrera',
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
              ),
              const SizedBox(height: 200),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          // Add your onPressed code here!
        },
        label: Text(
          'Continuar con el registro',
          style: GoogleFonts.lato(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
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
