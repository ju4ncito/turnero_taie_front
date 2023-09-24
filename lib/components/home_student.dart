import 'package:flutter/material.dart';
import 'package:turnero_taie_front/swagger_generated_code/api_model.swagger.dart';
import '../api/api_manager.dart';
import 'std_tutoria_card.dart';

class HorariosAlumnosWidget extends StatefulWidget {
  final User? currentUser;

  HorariosAlumnosWidget({Key? key, required this.currentUser})
      : super(key: key);

  @override
  _HorariosAlumnosWidgetState createState() => _HorariosAlumnosWidgetState();
}

class _HorariosAlumnosWidgetState extends State<HorariosAlumnosWidget> {
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
          const Padding(
            padding: EdgeInsets.fromLTRB(18, 8, 0, 8),
            child: Text(
              'Tus próximas clases',
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
                            'Parece que no tienes agendado ningún horario. Dirígete al calendario o busca una tutoría para reservar.',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemCount: schedules?.length ?? 0,
                        itemBuilder: (context, index) {
                          final schedule = schedules![index];
                          return StdCard(
                            tutoria: schedule,
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }
}
