// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:turnero_taie_front/swagger_generated_code/api_model.swagger.dart';
import 'package:url_launcher/url_launcher.dart';
import '../api/api_manager.dart';
import 'event.dart';
import 'helper_functions.dart';

class EventInfo extends StatelessWidget {
  final Event event;

  EventInfo({required this.event});

  void _launchURL(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

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
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Link de la reunion: ',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _launchURL(Uri.parse(event.zoomLink!)),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        getColorFromStatus(event.status))),
                child: Text(
                  '${event.zoomLink!.substring(0, 16)}...${event.zoomLink!.substring(event.zoomLink!.length - 8)}',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const Spacer(),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      if (event.status ==
                              TutorshipInstanceStatusEnum.scheduled ||
                          event.status == TutorshipInstanceStatusEnum.delayed)
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
                                  status:
                                      TutorshipInstanceStatusEnum.inProgress,
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
                      if (event.status ==
                          TutorshipInstanceStatusEnum.inProgress)
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
                                  status: TutorshipInstanceStatusEnum.done,
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
                      if (event.status == TutorshipInstanceStatusEnum.scheduled)
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
                                  status: TutorshipInstanceStatusEnum.delayed,
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
                  if (event.status != TutorshipInstanceStatusEnum.done &&
                      event.status != TutorshipInstanceStatusEnum.cancelled)
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
                              status: TutorshipInstanceStatusEnum.cancelled,
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
                  if (event.status == TutorshipInstanceStatusEnum.done)
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
                  if (event.status == TutorshipInstanceStatusEnum.cancelled)
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
