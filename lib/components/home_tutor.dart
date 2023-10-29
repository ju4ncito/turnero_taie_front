import 'package:flutter/material.dart';
import 'package:turnero_taie_front/swagger_generated_code/api_model.swagger.dart';
import '../api/api_manager.dart';
import 'add_tutoria.dart';
import 'tut_tutoria_card.dart';

class HorariosTutoresWidget extends StatefulWidget {
  final User? currentUser;

  HorariosTutoresWidget({Key? key, required this.currentUser})
      : super(key: key);

  @override
  _HorariosTutoresWidgetState createState() => _HorariosTutoresWidgetState();
}

class _HorariosTutoresWidgetState extends State<HorariosTutoresWidget> {
  final ApiManager apiManager = ApiManager();
  List<TutorUserSchedule>? schedules = []; // Store the fetched schedules

  @override
  void initState() {
    super.initState();
    fetchSchedules();
  }

  bool isLoading = true;

  Future<void> fetchSchedules() async {
    setState(() {
      isLoading = true;
    });

    try {
      final response = await apiManager.apiModel.apiTutorUserSchedulesGet();
      if (response.statusCode == 200) {
        setState(() {
          schedules = List<TutorUserSchedule>.from(response.body ?? []);
        });
      } else {
        // Handle error
      }
    } catch (error) {
      // Handle error
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: const Color.fromARGB(255, 30, 56, 102),
            elevation: 8,
            margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.14,
              vertical: MediaQuery.of(context).size.height * 0.01,
            ),
            child: ListTile(
              title: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Agregar un nuevo horario',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.add,
                      size: 24,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddTutoriaPage(
                      currentUser: widget.currentUser,
                      fetchFn: fetchSchedules,
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
              vertical: MediaQuery.of(context).size.height * 0.015,
            ),
            child: const Text(
              'Mis horarios',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
              child: isLoading
                  ? const Center(
                      child: CircularProgressIndicator(), // Loader
                    )
                  : schedules!.isEmpty
                      ? const Center(
                          child: Padding(
                            padding: EdgeInsets.all(28.0),
                            child: Text(
                              'Parece que no agregaste ningún horario. Agrega un horario con el botón superior!',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      : Scrollbar(
                          thickness: 3,
                          radius: const Radius.circular(20),
                          scrollbarOrientation: ScrollbarOrientation.right,
                          child: ListView.builder(
                            itemCount: schedules?.length ?? 0,
                            itemBuilder: (context, index) {
                              final schedule = schedules![index];
                              return TutCard(
                                tutoria: schedule,
                                fetchFn: fetchSchedules,
                              );
                            },
                          ),
                        )),
        ],
      ),
    );
  }
}
