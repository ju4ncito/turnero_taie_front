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
  final apiManager = AuthenticatedApiManager();
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
      if (selectedCareers.contains(career)) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('No se puede agregar la misma carrera dos veces.'),
          ),
        );
      } else {
        setState(() {
          selectedFaculties.add(faculty);
          selectedCareers.add(career);
          selectedCareerIds
              .add(careerId); // Add the selected career ID to the list
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Te damos la bienvenida a Turnero TAIE!'),
        backgroundColor: const Color.fromARGB(255, 29, 69, 140),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(children: [
                  const Text(
                    'Vamos a crear tu cuenta.',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Selecciona debajo las carreras que estás cursando en la UCC. Una vez que hayas terminado, presiona el botón "Registrarme".',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: selectedFaculty,
                    onChanged: (newValue) {
                      setState(() {
                        selectedFaculty = newValue;
                        selectedCareer = null;
                        careerDropdownEnabled = false;
                      });
                      careerDropdownTimer = Timer(
                          const Duration(seconds: 2), resetCareerDropdown);
                      fetchCareers(int.parse(facultyIdMap[
                          newValue]!)); // Utilizar el mapa para obtener el ID
                    },
                    items: academicUnits.map((unit) {
                      return DropdownMenuItem<String>(
                        value: unit.name,
                        child: Text(unit.name),
                      );
                    }).toList(),
                    decoration: const InputDecoration(
                        labelText: 'Selecciona tu facultad'),
                  ),
                  const SizedBox(height: 16),
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
                    decoration: const InputDecoration(
                        labelText: 'Selecciona tu carrera'),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: addFacultyAndCareer,
                    child: const Text(
                      'Agregar',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 21, 44, 83),
                      minimumSize: const Size(0, 45),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (selectedFaculties.isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Tus carreras son:',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: selectedFaculties.length,
                            itemBuilder: (BuildContext context, int index) {
                              final faculty = selectedFaculties[index];
                              final career = selectedCareers[index];
                              final careerId = selectedCareerIds[index];
                              return Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  color: const Color.fromARGB(255, 29, 69, 140),
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: ListTile(
                                      title: Text(
                                        '$career',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text(
                                        '$faculty',
                                        style: TextStyle(color: Colors.white70),
                                      ),
                                      trailing: IconButton(
                                        icon: IconTheme(
                                          data: IconThemeData(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary,
                                          ),
                                          child: const Icon(Icons.delete),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            selectedFaculties.removeAt(index);
                                            selectedCareers.removeAt(index);
                                            selectedCareerIds.removeAt(index);
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                ]),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          print(widget.currentUser);
          if (widget.currentUser != null && widget.currentUser?.id != null) {
            bool allPostsSuccessful = true;

            for (int careerId in selectedCareerIds) {
              final postresult = await apiManager.apiModel.apiCareerXUserPost(
                body: CareerXUserRequest(
                  career: careerId,
                  user: widget.currentUser!.id,
                ),
              );

              print(postresult.statusCode);
              print(widget.currentUser);

              if (postresult.statusCode != 201) {
                allPostsSuccessful = false;
                break;
              }
            }

            if (allPostsSuccessful && context.mounted) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return StudentPage(
                      currentUser: widget.currentUser,
                      photoUrl: widget.photoUrl,
                    );
                  },
                ),
              );
            }
          }
        },
        label: const Text('Registrarme'),
        icon: const Icon(Icons.arrow_forward, size: 18),
      ),
    );
  }
}
