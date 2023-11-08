import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:turnero_taie_front/api/api_manager.dart';
import 'package:turnero_taie_front/components/search_schedule_page.dart';
import 'package:turnero_taie_front/swagger_generated_code/api_model.swagger.dart';
import 'search_instance_detail.dart';

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
        backgroundColor: const Color.fromARGB(255, 29, 69, 140),
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
                } else {
                  performSearch(query);
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
                              const Text(
                                'Tutorias programadas',
                                style: TextStyle(fontSize: 18),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(2.0),
                                child: Text(
                                  'Tutorias a las que puedes sumarte',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                              ),
                              const SizedBox(height: 6),
                              if (searchResults[0]!
                                  .tutorshipInstances
                                  .isNotEmpty)
                                ...List.generate(
                                  searchResults[0]!.tutorshipInstances.length,
                                  (index) {
                                    final tutorshipInstance = searchResults[0]!
                                        .tutorshipInstances[index];
                                    final title = tutorshipInstance.area;
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
                              if (searchResults[0]!.tutorshipInstances.isEmpty)
                                const Text(
                                  'No hay tutorias a las cuales puedes sumarte',
                                ),

                              const SizedBox(height: 20),
                              // Schedules list
                              if (searchResults[0]!.schedules.isNotEmpty)
                                const Text(
                                  'Horarios disponibles',
                                  style: TextStyle(fontSize: 18),
                                ),
                              const Padding(
                                padding: EdgeInsets.all(2.0),
                                child: Text(
                                  'Reserva una tutoria con un tutor',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                              ),
                              const SizedBox(height: 6),
                              ...List.generate(
                                searchResults[0]!.schedules.length,
                                (index) {
                                  final schedule =
                                      searchResults[0]!.schedules[index];
                                  final title =
                                      "${schedule.tutorUser.firstName} ${schedule.tutorUser.lastName}";
                                  final subtitle = schedule.modality;

                                  return Card(
                                    child: ListTile(
                                      title: Text(title),
                                      subtitle: Text(subtitle),
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
                              if (searchResults[0]!.schedules.isEmpty)
                                const Text('No se encontraron horarios'),
                            ],
                          )
                        : const Center(
                            child: Text(
                              'En caso de no encontrar lo que buscabas, prueba con otra materia',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                              ),
                            ),
                          )),
          ],
        ),
      ),
    );
  }
}
