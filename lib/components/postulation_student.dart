import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:turnero_taie_front/api/api_manager.dart';
import 'package:turnero_taie_front/pages/student_main.dart';
import 'package:turnero_taie_front/swagger_generated_code/api_model.swagger.dart';
import 'dart:async';

class PostulationPage extends StatefulWidget {
  final User? currentUser;
  final String? photoUrl;

  PostulationPage({Key? key, required this.currentUser, required this.photoUrl})
      : super(key: key);

  @override
  _PostulationPageState createState() => _PostulationPageState();
}

class _PostulationPageState extends State<PostulationPage> {
  String? selectedCareer;
  String? selectedArea;
  List<UserCareer> userCareers = [];
  List<CustomArea> areas = [];
  bool areaDropdownEnabled = true;
  final apiManager = AuthenticatedApiManager();
  TextEditingController areaController = TextEditingController();
  List<String> selectedAreas = [];
  List<int> selectedAreaIds = []; // List to store selected area IDs
  late Timer areaDropdownTimer;
  Map<String, String> areaIdMap = {};

  List<Career> careers = [];
  Map<String, String> careerIdMap =
      {}; // Map to associate career names with their IDs

  @override
  void initState() {
    super.initState();
    populateCareerIdMap();
  }

  // Method to populate the career ID map
// Method to populate the career ID map
  void populateCareerIdMap() {
    for (var career in widget.currentUser?.careers ?? []) {
      careerIdMap[career.name] = career.id.toString();
    }
  }

  Future<void> fetchAreas(int selectedCareerId) async {
    print('Fetching areas for career ID $selectedCareerId');
    try {
      final response = await apiManager.apiModel
          .apiCareersIdGetAreasGet(id: selectedCareerId);
      if (response.statusCode == 200) {
        setState(() {
          print('fetch was correct, status response: ${response.statusCode}');
          // Assuming the response body is a list of CustomArea objects
          areas = response.body ?? [];
          // Create a map of area names to area IDs
          areaIdMap = Map.fromIterable(areas,
              key: (area) => area.name, value: (area) => area.id.toString());

          print('final areaIdMap: $areaIdMap');
          print('object areas: $areas');
          print('response body: ${response.body}');
        });
      } else {
        // Handle error
      }
    } catch (error) {
      // Handle error
    }
  }

  void handleCareerSelection(String? newValue) {
    setState(() {
      selectedCareer = newValue;
      selectedArea = null;
      areaDropdownEnabled = false;
    });
    areaDropdownTimer = Timer(const Duration(seconds: 2), resetAreaDropdown);
    fetchAreas(int.parse(careerIdMap[newValue!]!));
  }

  void resetAreaDropdown() {
    setState(() {
      selectedArea = null;
      areaDropdownEnabled = true;
    });
  }

  void addArea() {
    final area = selectedArea;
    if (area != null && !selectedAreas.contains(area)) {
      setState(() {
        selectedAreas.add(area);
        print('Se agrego el area $area');
        // Assuming you have the area ID available here
        selectedAreaIds.add(int.parse(areaIdMap[area]!));
      });
    }
  }

  @override
  void dispose() {
    areaDropdownTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inscripción'),
        backgroundColor: const Color.fromARGB(255, 19, 45, 88),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(children: [
                  const SizedBox(height: 12),
                  const Text(
                    'Selecciona debajo las áreas de tu interés. Puedes seleccionar más de una.',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: selectedCareer,
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedCareer = newValue;
                          selectedArea = null;
                          areaDropdownEnabled = false;
                        });
                        areaDropdownTimer = Timer(
                            const Duration(seconds: 2), resetAreaDropdown);

                        // Use newValue to get the selected career object
                        UserCareer? selectedCareerObject = widget
                            .currentUser?.careers
                            .firstWhere((career) => career.name == newValue,
                                orElse: () => UserCareer(id: 0, name: ''));
                        if (selectedCareerObject != null) {
                          // Fetch areas using the ID of the selected career
                          fetchAreas(selectedCareerObject.id);
                        }
                      }
                    },
                    items: widget.currentUser?.careers.map((career) {
                      return DropdownMenuItem<String>(
                        value: career.name, // Display career name
                        child: Text(career.name), // Display career name
                      );
                    }).toList(),
                    decoration: const InputDecoration(
                      labelText: 'Selecciona tu carrera',
                    ),
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: selectedArea,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedArea = newValue;
                      });
                    },
                    items: areas.map((area) {
                      return DropdownMenuItem<String>(
                        value: area.name,
                        child: Text(area.name),
                      );
                    }).toList(),
                    decoration:
                        InputDecoration(labelText: 'Selecciona un área'),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: addArea,
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
                  if (selectedAreas.isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Tus áreas de interés son:',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: selectedAreas.length,
                            itemBuilder: (BuildContext context, int index) {
                              final area = selectedAreas[index];
                              final areaId = selectedAreaIds[index];
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
                                        '$area',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
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
                                            selectedAreas.removeAt(index);
                                            selectedAreaIds.removeAt(index);
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
          if (careerIdMap.isEmpty) {
            populateCareerIdMap();
          }
          print(widget.currentUser);

          print('lista final de areas seleccionadas: $selectedAreas');
          if (widget.currentUser != null && widget.currentUser?.id != null) {
            if (selectedAreas.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                      'No se puede postular sin seleccionar al menos un area de interes.'),
                ),
              );
              return;
            }

            final postulationPost = PostulationRequest(
              studentUser: widget.currentUser!.id,
              areas:
                  selectedAreas, // Assuming this is the correct format for the areas field
              createdDate:
                  DateTime.now(), // Example of setting a current timestamp
            );

            print('postulation post body: ${postulationPost.toJson()}');
            final postulationResult = await apiManager.apiModel
                .apiPostulationsPost(body: postulationPost);

            print(
                '--La inscripcion salio con status code: ${postulationResult.statusCode}');
            print(
                '--La inscripcion salio con error: ${postulationResult.error}');

            if (postulationResult.statusCode == 400) {
              if (mounted) {
                // Check if the widget is still mounted
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        'Ya existe una postulación que posee al menos una de las áreas seleccionadas.'),
                  ),
                );
              }
              return;
            }
            if (postulationResult.statusCode == 201 && context.mounted) {
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
        label: const Text('Inscribirme'),
        icon: const Icon(Icons.arrow_forward, size: 18),
      ),
    );
  }
}
