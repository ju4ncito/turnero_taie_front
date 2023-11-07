import 'package:flutter/material.dart';
import 'package:turnero_taie_front/api/api_manager.dart';
import 'package:turnero_taie_front/swagger_generated_code/api_model.swagger.dart';

class SearchInstancePage extends StatelessWidget {
  final apiManager = AuthenticatedApiManager();

  final SearchTutorship tutorInstance;

  SearchInstancePage({required this.tutorInstance});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle de Tutoría'),
        backgroundColor: const Color.fromARGB(255, 29, 69, 140),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Area: ${tutorInstance.area}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),
            Text('Date: ${tutorInstance.date}'),
            const SizedBox(height: 10),
            Text('Status: ${tutorInstance.status}'),
            const SizedBox(height: 10),
            Text('Cantidad de asistentes: ${tutorInstance.users.length - 1}'),
            const SizedBox(height: 10),

            // ElevatedButton(
            //   onPressed: () async {
            //     final tutoriaRequest = CreateDeleteTutorUserScheduleRequest(
            //       begin: _beginController.text,
            //       capacity: int.parse(_capacityController.text),
            //       day: _selectedDay,
            //       end: _endController.text,
            //       modality: _selectedModality,
            //       tutorUser: widget.currentUser!.id,
            //     );

            //     print("Tutoria Request Body: ${tutoriaRequest.toJson()}");

            //     final localContext = context;
            //     final postResult = await AuthenticatedApiManager.apiModel
            //         .apiTutorUserSchedulesPost(
            //       body: tutoriaRequest,
            //     );
            //     print(postResult.error);
            //     print("API Response Status Code: ${postResult.statusCode}");

            //     widget.fetchFn();
            //     if (context.mounted) {
            //       Navigator.pop(localContext);
            //     }
            //   },
            //   child: const Text('Add Tutoria'),
            // ),
            // Text('End: ${tutorUserSchedule.end}'),
            // const SizedBox(height: 10),
            // Text('Capacity: ${tutorUserSchedule.capacity}'),
            // const SizedBox(height: 10),
            // Add more details as needed
          ],
        ),
      ),
    );
  }
}
