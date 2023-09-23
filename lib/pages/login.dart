import 'package:flutter/material.dart';
import 'package:turnero_taie_front/api/api_manager.dart';
import 'package:turnero_taie_front/pages/student_main.dart';
import 'package:turnero_taie_front/swagger_generated_code/api_model.swagger.dart';
import 'dart:async';

class LoginPage extends StatefulWidget {
  final User? currentUser;
  final String? photoUrl;

  LoginPage({Key? key, required this.currentUser, required this.photoUrl})
      : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? selectedFaculty;
  String? selectedCareer;
  List<AcademicUnit> academicUnits = [];
  List<Career> careers = [];
  bool careerDropdownEnabled = true;
  final apiManager = ApiManager();
  late Timer careerDropdownTimer;
  List<String> selectedFaculties = [];
  List<String> selectedCareers = [];
  List<int> selectedCareerIds = []; // List to store selected career IDs
  TextEditingController facultyController = TextEditingController();
  TextEditingController careerController = TextEditingController();
  Map<String, String> facultyIdMap =
      {}; // Mapa para mapear nombres de facultades a IDs
  Map<String, String> careerIdMap =
      {}; // Mapa para mapear nombres de carreras a IDs

  @override
  void initState() {
    super.initState();
    fetchAcademicUnits();
  }

  @override
  void dispose() {
    careerDropdownTimer.cancel();
    super.dispose();
  }

  Future<void> fetchAcademicUnits() async {
    try {
      final response = await apiManager.apiModel.apiAcademicUnitsGet();
      if (response.statusCode == 200) {
        setState(() {
          academicUnits = response.body ?? [];
          // Llenar el mapa de nombres de facultades a IDs
          facultyIdMap = Map.fromIterable(academicUnits,
              key: (unit) => unit.name, value: (unit) => unit.id.toString());
        });
      } else {
        // Handle error
      }
    } catch (error) {
      // Handle error
    }
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
          // Llenar el mapa de nombres de carreras a IDs
          careerIdMap = Map.fromIterable(careers,
              key: (career) => career.name,
              value: (career) => career.id.toString());
        });
      } else {
        // Handle error
      }
    } catch (error) {
      // Handle error
    }
  }

  void resetCareerDropdown() {
    setState(() {
      selectedCareer = null;
      careerDropdownEnabled = true;
    });
  }

  void addFacultyAndCareer() {
    final faculty = selectedFaculty;
    final career = selectedCareer;

    if (faculty != null && career != null) {
      final careerId =
          int.parse(careerIdMap[career]!); // Parse career ID as an integer
      setState(() {
        selectedFaculties.add(faculty);
        selectedCareers.add(career);
        selectedCareerIds
            .add(careerId); // Add the selected career ID to the list
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Faculty and Career Selection'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  DropdownButtonFormField<String>(
                    value: selectedFaculty,
                    onChanged: (newValue) {
                      setState(() {
                        selectedFaculty = newValue;
                        selectedCareer = null;
                        careerDropdownEnabled = false;
                      });
                      careerDropdownTimer =
                          Timer(Duration(seconds: 2), resetCareerDropdown);
                      fetchCareers(int.parse(facultyIdMap[
                          newValue]!)); // Utilizar el mapa para obtener el ID
                    },
                    items: academicUnits.map((unit) {
                      return DropdownMenuItem<String>(
                        value: unit.name,
                        child: Text(unit.name),
                      );
                    }).toList(),
                    decoration:
                        InputDecoration(labelText: 'Selecciona tu facultad'),
                  ),
                  SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: selectedCareer,
                    onChanged: careerDropdownEnabled
                        ? (newValue) {
                            setState(() {
                              selectedCareer = newValue;
                            });
                          }
                        : null,
                    items: careers.map((career) {
                      return DropdownMenuItem<String>(
                        value: career.name,
                        child: Text(career.name),
                      );
                    }).toList(),
                    decoration:
                        InputDecoration(labelText: 'Selecciona tu carrera'),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: addFacultyAndCareer,
                    child: Text('Agregar'),
                  ),
                  SizedBox(height: 16),
                  if (selectedFaculties.isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Facultades y Carreras Seleccionadas:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: selectedFaculties.length,
                          itemBuilder: (BuildContext context, int index) {
                            final faculty = selectedFaculties[index];
                            final career = selectedCareers[index];
                            final careerId = selectedCareerIds[index];
                            return ListTile(
                              title: Text('Facultad: $faculty'),
                              subtitle: Text('Carrera: $career'),
                              trailing: IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  // Remove the selected career and its ID from the lists
                                  setState(() {
                                    selectedFaculties.removeAt(index);
                                    selectedCareers.removeAt(index);
                                    selectedCareerIds.removeAt(index);
                                  });
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final postresult = await apiManager.apiModel.apiUsersNewUserPost(
            body: NewUserRequest(
                careers: selectedCareerIds, // Pass the selected career IDs
                roles: ['STD'],
                fullName: widget.currentUser!.fullName,
                uccKey: int.parse(widget.currentUser!.email
                    .substring(0, widget.currentUser!.email.length - 11)),
                email: widget.currentUser!.email,
                academicYear: 1,
                profilePicture: widget.photoUrl),
          );
          print(selectedCareerIds);

          print(postresult.statusCode);

          if (postresult.statusCode == 201) {
            if (context.mounted) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return StudentPage(
                        currentUser: widget.currentUser,
                        photoUrl: widget.photoUrl);
                  },
                ),
              );
            }
          }
        },
        label: Text('Registrarme'),
        icon: Icon(Icons.arrow_forward),
      ),
    );
  }
}
