// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:turnero_taie_front/swagger_generated_code/api_model.swagger.dart';
import '../api/api_manager.dart';
import 'event.dart';
import 'helper_functions.dart';

class EventInfo extends StatelessWidget {
  final Event event;

  EventInfo({required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle del evento'),
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
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              Text('Con un total de ${event.users!.length - 1} alumnos',
                  style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Esta clase se encuentra ',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    '${translateStatusToSpanish(event.status!)}',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Spacer(),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      if (event.status == Status3e2Enum.scheduled ||
                          event.status == Status3e2Enum.delayed)
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
                                  status: Status3e2Enum.inProgress,
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
                                  final localContext = context;

                                  if (context.mounted) {
                                    Navigator.pop(localContext, true);
                                  }
                                  print(
                                      "API Response Status Code: ${postResult.statusCode}");
                                } else {
                                  print(
                                      "Error en la solicitud PATCH: ${postResult.error}");
                                }
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
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
                      if (event.status == Status3e2Enum.inProgress)
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
                                  status: Status3e2Enum.done,
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
                                  final localContext = context;

                                  if (context.mounted) {
                                    Navigator.pop(localContext, true);
                                  }
                                  print(
                                      "API Response Status Code: ${postResult.statusCode}");
                                } else {
                                  print(
                                      "Error en la solicitud PATCH: ${postResult.error}");
                                }
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  const Color.fromARGB(255, 19, 88, 53),
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
                                'Concluir',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      if (event.status == Status3e2Enum.scheduled)
                        Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 1 / 3,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () async {
                                final patchedRequest =
                                    PatchedTutorshipInstanceRequest(
                                  area: event.area,
                                  schedule: event.schedule!.id,
                                  status: Status3e2Enum.delayed,
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
                                  final localContext = context;

                                  if (context.mounted) {
                                    Navigator.pop(localContext, true);
                                  }
                                  print(
                                      "API Response Status Code: ${postResult.statusCode}");
                                } else {
                                  print(
                                      "Error en la solicitud PATCH: ${postResult.error}");
                                }
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  const Color.fromARGB(255, 78, 67, 9),
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
                  if (event.status != Status3e2Enum.done &&
                      event.status != Status3e2Enum.cancelled)
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 6 / 7,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () async {
                            final patchedRequest =
                                PatchedTutorshipInstanceRequest(
                              area: event.area,
                              schedule: event.schedule!.id,
                              status: Status3e2Enum.cancelled,
                              date: event.date,
                              zoomLink: event.zoomLink,
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
                              final localContext = context;

                              if (context.mounted) {
                                Navigator.pop(localContext, true);
                              }
                              print(
                                  "API Response Status Code: ${postResult.statusCode}");
                            } else {
                              print(
                                  "Error en la solicitud PATCH: ${postResult.error}");
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 102, 30, 30),
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
                  if (event.status == Status3e2Enum.done)
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.all(28.0),
                        child: Text(
                          'Esta clase ya ha finalizado',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  if (event.status == Status3e2Enum.cancelled)
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.all(28.0),
                        child: Text(
                          'Esta clase esta cancelada',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                ],
              ),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}
