import 'package:flutter/material.dart';
import 'package:turnero_taie_front/api/api_manager.dart';
import 'package:turnero_taie_front/components/tutor_detail.dart';
import 'package:turnero_taie_front/swagger_generated_code/api_model.swagger.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
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
                            // Schedules list
                            if (searchResults[0]!.schedules.isNotEmpty)
                              const Text('Tutorias programadas'),
                            ...List.generate(
                              searchResults[0]!.schedules.length,
                              (index) {
                                final schedule =
                                    searchResults[0]!.schedules[index];
                                final title =
                                    "${schedule.tutorUser.firstName} ${schedule.tutorUser.lastName}";
                                final subtitle = schedule.modality;

                                return ListTile(
                                  title: Text(title),
                                  subtitle: Text(subtitle),
                                  onTap: () {
                                    // Navigate to the "tutor_detail" page when tapped
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => TutorDetailPage(
                                            id: schedule.tutorUser.id),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                            if (searchResults[0]!.schedules.isEmpty)
                              const Text('No se encontraron horarios'),
                            const SizedBox(height: 20),
                            // Tutorship instances list
                            const Text(
                                'Tutorias programadas'), // Add text 'tutorshipInstances'
                            if (searchResults[0]!.tutorshipInstances.isNotEmpty)
                              ...List.generate(
                                searchResults[0]!.tutorshipInstances.length,
                                (index) {
                                  final tutorshipInstance = searchResults[0]!
                                      .tutorshipInstances[index];
                                  final title =
                                      "${tutorshipInstance.schedule.tutorUser.firstName} ${tutorshipInstance.schedule.tutorUser.lastName}";
                                  final subtitle = tutorshipInstance.area;

                                  return ListTile(
                                    title: Text(title),
                                    subtitle: Text(subtitle),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => TutorDetailPage(
                                              id: tutorshipInstance
                                                  .schedule.tutorUser.id),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            if (searchResults[0]!.tutorshipInstances.isEmpty)
                              const Text(
                                  'No hay tutorias a las cuales puedes sumarte'),
                          ],
                        )
                      : const Text(
                          'Escribe tu busqueda arriba! En caso de no encontra lo que buscabas prueba con distinto nombre o materia'),
            ),
          ],
        ),
      ),
    );
  }
}
