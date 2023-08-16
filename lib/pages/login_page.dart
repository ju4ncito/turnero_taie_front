import 'package:flutter/material.dart';
import 'package:turnero_taie_front/api/api_manager.dart';
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
  String? selectedFacultad;
  Career? selectedCareer;
  List<AcademicUnit> academicUnits = [];
  List<Career> careers = [];

  @override
  void initState() {
    super.initState();
    fetchAcademicUnits();
    fetchCareers(1);
  }

  final apiManager = ApiManager();
  Future<void> fetchAcademicUnits() async {
    try {
      final response = await apiManager.apiModel.apiAcademicUnitsGet();
      if (response.statusCode == 200) {
        setState(() {
          academicUnits = response.body ?? [];
        });
      } else {}
    } catch (error) {}
  }

  Future<void> fetchCareers(int academicUnitId) async {
    try {
      final response = await apiManager.apiModel.apiCareersGet();
      if (response.statusCode == 200) {
        setState(() {
          careers = response.body ?? [];
          careers = careers
              .where((career) => career.academicUnit == academicUnitId)
              .toList();
        });
      } else {}
    } catch (error) {}
  }

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
                margin: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Text(
                      '$userName, parece que es tu primera vez utilizando la app de Tutorias',
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
                    DropdownButtonFormField<AcademicUnit>(
                      items: academicUnits.map((AcademicUnit unit) {
                        return DropdownMenuItem<AcademicUnit>(
                          value: unit,
                          child: Text(unit.name),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          selectedFacultad = newValue?.name;
                          selectedCareer = null;
                          if (newValue != null) {
                            fetchCareers(newValue.id);
                          }
                        });
                      },
                      value: null,
                      decoration: const InputDecoration(
                        labelText: "Selecciona tu facultad",
                        hintText: "Facultad",
                      ),
                    ),
                    if (selectedFacultad != null)
                      DropdownButtonFormField<Career>(
                        items: careers.map((Career career) {
                          return DropdownMenuItem<Career>(
                            value: career,
                            child: Text(career.name),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectedCareer = newValue;
                          });
                        },
                        value: selectedCareer,
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
                          // _showAdditionalDropdown = true;
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
          final postresult = await apiManager.apiModel.apiUsersNewUserPost(
              body: NewUserRequest(
                  careers: [selectedCareer?.id ?? 1],
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
