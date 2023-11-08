import 'package:flutter/material.dart';
import 'package:turnero_taie_front/swagger_generated_code/api_model.swagger.dart';

import '../api/api_manager.dart';

class SearchSchedulePage extends StatelessWidget {
  final ReadTutorUserSchedule tutorUserSchedule;

  SearchSchedulePage({required this.tutorUserSchedule});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle de horario'),
        backgroundColor: const Color.fromARGB(255, 29, 69, 140),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${tutorUserSchedule.tutorUser.firstName} ${tutorUserSchedule.tutorUser.lastName}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text('Modality: ${tutorUserSchedule.modality}'),
            const SizedBox(height: 10),
            Text('Day: ${tutorUserSchedule.day}'),
            const SizedBox(height: 10),
            Text('Begin: ${tutorUserSchedule.begin}'),
            const SizedBox(height: 10),
            Text('End: ${tutorUserSchedule.end}'),
            const SizedBox(height: 10),
            Text('Capacity: ${tutorUserSchedule.capacity}'),
            const SizedBox(height: 10),
            // ElevatedButton(
            //   onPressed: () async {
            //     final tutoriaRequest = SearchTutorshipRequest(
            //         area: tutorUserSchedule.tutorUser.areas[],
            //         date: tutorUserSchedule.day,
            //         schedule: ReadTutorUserScheduleRequest(tutorUser: TutorAreasRequest(

            //         ) , modality: modality, day: day, begin: begin, end: end, capacity: capacity),
            //         status: 'Pendiente');

            //     print("Tutoria Request Body: ${tutoriaRequest.toJson()}");

            //     final localContext = context;
            //     final apiManager = AuthenticatedApiManager();
            //     final postResult = await apiManager.apiModel
            //         .apiTutorshipInstancesEnrollTutorshipPost(
            //       body: tutoriaRequest,
            //     );
            //     print(postResult.error);
            //     print("API Response Status Code: ${postResult.statusCode}");

            //     if (context.mounted) {
            //       Navigator.pop(localContext);
            //     }
            //   },
            //   child: const Text('Add Tutoria'),
            // ),
          ],
        ),
      ),
    );
  }
}
