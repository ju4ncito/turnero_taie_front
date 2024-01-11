import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:turnero_taie_front/api/api_manager.dart';
import 'package:turnero_taie_front/components/search_schedule_page.dart';
import 'package:turnero_taie_front/swagger_generated_code/api_model.swagger.dart';
import 'search_instance_detail.dart';
import 'package:easy_debounce/easy_debounce.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

String capitalize(String s) {
  if (s.isEmpty) {
    return "";
  } else {
    return s[0].toUpperCase() + s.substring(1);
  }
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  List<BusquedaTutoriaHorarios?> searchResults = [];
  bool isLoading = false;

  Future<void> performSearch(query) async {
    setState(() {
      isLoading = true;
    });

    try {
      final apiManager = AuthenticatedApiManager();
      final response = await apiManager.apiModel
          .apiSearchsTutorshipSchedulesGet(searchString: query);
      if (response.statusCode == 200) {
        setState(() {
          // Update searchResults with the new response structure
          searchResults = [response.body];
          print('Search results ${searchResults[0]!.schedules}');
          isLoading = false; // Hide loader when data is available
        });
      } else {
        isLoading = false;
      }
    } catch (error) {
      isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Búsqueda'),
        backgroundColor: const Color.fromARGB(255, 19, 45, 88),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: searchController,
              onChanged: (query) {
                if (query.isEmpty) {
                  setState(() {
                    searchResults.clear();
                  });
                  EasyDebounce.cancel(
                      'search-debouncer'); // Cancel any ongoing debounce operations
                } else {
                  EasyDebounce.debounce(
                    'search-debouncer',
                    const Duration(milliseconds: 200),
                    () => performSearch(query),
                  );
                }
              },
              decoration: const InputDecoration(
                hintText: 'Busca materias para inscribirte',
                suffixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
                child: isLoading // Check the loading state
                    ? const Center(
                        child: CircularProgressIndicator(), // Show loader
                      )
                    : searchResults.isNotEmpty
                        ? ListView(
                            children: [
                              // Tutorship instances list

                              if (searchResults[0]!
                                  .tutorshipInstances
                                  .isNotEmpty)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Tutorias programadas',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(3.0),
                                      child: Text(
                                        'Tutorias a las que puedes sumarte',
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.grey),
                                      ),
                                    ),
                                    SizedBox(height: 6),
                                  ],
                                ),
                              ...List.generate(
                                searchResults[0]!.tutorshipInstances.length,
                                (index) {
                                  final tutorshipInstance = searchResults[0]!
                                      .tutorshipInstances[index];
                                  final title = tutorshipInstance.area.name;
                                  final formattedDate = capitalize(
                                      DateFormat('EEEEE dd-MM', 'es_AR')
                                          .format(tutorshipInstance.date));

                                  final subtitle = Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          "$formattedDate de ${tutorshipInstance.schedule.begin.substring(0, tutorshipInstance.schedule.begin.length - 3)} a ${tutorshipInstance.schedule.end.substring(0, tutorshipInstance.schedule.begin.length - 3)} con"),
                                      Text(
                                        ' ${tutorshipInstance.schedule.tutorUser.firstName}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  );

                                  return Card(
                                    elevation: 6,
                                    child: ListTile(
                                      title: Text(title),
                                      subtitle: subtitle,
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                SearchInstancePage(
                                                    tutorInstance:
                                                        tutorshipInstance),
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                },
                              ),
                              // if (searchResults[0]!.tutorshipInstances.isEmpty)

                              if (searchResults[0]!.schedules.isNotEmpty)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    SizedBox(height: 20),
                                    Text(
                                      'Horarios disponibles',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(3.0),
                                      child: Text(
                                        'Selecciona un horario y reserva una tutoría',
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.grey),
                                      ),
                                    ),
                                    SizedBox(height: 6),
                                  ],
                                ),
                              // Schedules list

                              ...List.generate(
                                searchResults[0]!.schedules.length,
                                (index) {
                                  final schedule =
                                      searchResults[0]!.schedules[index];
                                  final title = Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "${schedule.begin.substring(0, schedule.begin.length - 3)} a ${schedule.end.substring(0, schedule.end.length - 3)}",
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.2),
                                              spreadRadius: 1,
                                              blurRadius: 2,
                                              offset: const Offset(0, 1),
                                            ),
                                          ],
                                          color: const Color.fromARGB(
                                              255, 19, 45, 88),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 4),
                                        child: Text(
                                          '${schedule.coincidence!.length <= 25 ? schedule.coincidence : schedule.coincidence!.substring(0, 22) + "..."}',
                                          style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal,
                                            fontStyle: FontStyle.italic,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                  final subtitle = Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Text("${schedule.modality} con"),
                                            Text(
                                              ' ${schedule.tutorUser.firstName}',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(width: 15),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                  return Card(
                                    // color: Color.fromARGB(255, 220, 233, 255),
                                    elevation: 6,
                                    child: ListTile(
                                      title: title,
                                      subtitle: subtitle,
                                      onTap: () {
                                        // Navigate to the "tutor_detail" page when tapped
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                SearchSchedulePage(
                                                    tutorUserSchedule:
                                                        schedule),
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                },
                              ),
                              if (searchResults[0]!.schedules.isEmpty &&
                                  searchResults[0]!.tutorshipInstances.isEmpty)
                                const Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'En caso de no encontrar lo que buscabas, prueba con otros términos',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                )
                            ],
                          )
                        : const Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'En caso de no encontrar lo que buscabas, prueba con otros términos',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )),
          ],
        ),
      ),
    );
  }
}
