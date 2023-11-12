import 'package:flutter/material.dart';
import 'package:turnero_taie_front/swagger_generated_code/api_model.swagger.dart';
import '../api/api_manager.dart';
import 'event.dart';

class EventInfo extends StatelessWidget {
  final Event event;

  EventInfo({required this.event});

  String? translateStatusToSpanish(String? status) {
    Map<String, String> statusTranslations = {
      'Scheduled': 'Programada',
      'In progress': 'En curso',
      'Done': 'Finalizada',
    };

    // Traduce el estado o devuelve el mismo estado si no hay una traducción disponible
    return statusTranslations.containsKey(status)
        ? statusTranslations[status]!
        : status;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle del evento'),
        backgroundColor: const Color.fromARGB(255, 19, 45, 88),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Clase de ${event.area}',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text(
                'Dictada por ti, ${event.schedule!.tutorUser.firstName}',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              Text('Con un total de ${event.users!.length - 1} alumnos',
                  style: TextStyle(fontSize: 16)),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Esta clase se encuentra ',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    '${translateStatusToSpanish(event.status)}',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Spacer(),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 1 / 2,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () async {
                              final patchedRequest =
                                  PatchedTutorshipInstanceRequest(
                                area: event.area,
                                schedule: event.schedule!.id,
                                status: 'In progress',
                                date: event.date,
                              );

                              print(
                                  "Tutoria Request Body: ${patchedRequest.toJson()}");

                              final apiManager = AuthenticatedApiManager();
                              final postResult = await apiManager.apiModel
                                  .apiTutorshipInstancesIdPatch(
                                id: event.tutorshipId,
                                body: patchedRequest,
                              );

                              print('id ${event.tutorshipId}');
                              if (postResult.error == null) {
                                print(
                                    "API Response Status Code: ${postResult.statusCode}");
                              } else {
                                print(
                                    "Error en la solicitud PATCH: ${postResult.error}");
                              }
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 19, 45, 88),
                              ),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(9),
                                ),
                              ),
                              elevation: MaterialStateProperty.all(4),
                            ),
                            child: const Text(
                              'Comenzar',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 1 / 3,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () async {
                              //
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromARGB(255, 102, 76, 30),
                              ),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(9),
                                ),
                              ),
                              elevation: MaterialStateProperty.all(4),
                            ),
                            child: const Text(
                              'Demorar',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 6 / 7,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () async {
                          //
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 102, 30, 30),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(9),
                            ),
                          ),
                          elevation: MaterialStateProperty.all(4),
                        ),
                        child: const Text(
                          'Cancelar esta clase',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}
