import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:turnero_taie_front/api/api_manager.dart';
import 'package:turnero_taie_front/components/report_student.dart';
import 'package:turnero_taie_front/swagger_generated_code/api_model.swagger.dart';
import 'event.dart';
import 'helper_functions.dart';

class EventDetail extends StatelessWidget {
  final Event event;
  final apiManager = AuthenticatedApiManager();

  EventDetail({required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Próxima Tutoría'),
        backgroundColor: const Color.fromARGB(255, 19, 45, 88),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    event.area ?? '',
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 10),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: SizedBox(
                      width: 80, // Set your desired width
                      height: 30, // Set your desired height
                      child: ElevatedButton(
                        onPressed: null,
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 30, 56, 102)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  15), // Set your desired radius
                            ),
                          ),
                        ),
                        child: Text(
                          getDayAbbreviation(event.date),
                          style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              const Text('Tutor', style: TextStyle(fontSize: 18)),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    ClipOval(
                      child: Image(
                          image: event.schedule!.tutorUser.profilePicture !=
                                  null
                              ? NetworkImage(
                                  event.schedule!.tutorUser.profilePicture!)
                              : const AssetImage(
                                      'assets/images/default_profile_picture.png')
                                  as ImageProvider,
                          width: 50,
                          height: 50),
                    ),
                    const SizedBox(width: 15),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${event.schedule!.tutorUser.firstName} ${event.schedule!.tutorUser.lastName}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '${event.area}',
                          style:
                              const TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text('Detalles de la tutoría',
                  style: TextStyle(fontSize: 18)),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Inicio',
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold),
                      ),
                      ElevatedButton(
                        onPressed: null,
                        child: Text(
                          event.schedule!.begin
                              .substring(0, event.schedule!.begin.length - 3),
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Final',
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold),
                      ),
                      ElevatedButton(
                        onPressed: null,
                        child: Text(
                          event.schedule!.end
                              .substring(0, event.schedule!.begin.length - 3),
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Fecha',
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold),
                      ),
                      ElevatedButton(
                        onPressed: null,
                        child: Text(
                          '${event.date.day}/'
                          '${event.date.month}/'
                          '${event.date.year}',
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Modalidad',
                    style: TextStyle(
                        color: Colors.blueGrey, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    onPressed: null,
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 30, 56, 102))),
                    child: Text(
                      event.schedule!.modality,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Estado',
                    style: TextStyle(
                        color: Colors.blueGrey, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    onPressed: null,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          getColorFromStatus(event.status)),
                    ),
                    child: Text(
                      translateStatusToSpanish(event.status!),
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Spacer(),
              if (event.status != TutorshipInstanceStatusEnum.done)
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 6 / 7,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () async {
                        final localContext = context;
                        final apiManager = AuthenticatedApiManager();
                        final postResult = await apiManager.apiModel
                            .apiTutorshipInstancesIdDisenrollTutorshipPost(
                          id: event.tutorshipId,
                        );

                        print(postResult.error);
                        print(postResult.body);
                        print(
                            "API disenroll Status Code: ${postResult.statusCode}");

                        if (context.mounted) {
                          Navigator.pop(localContext, true);
                        }
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
                        'Darme de baja',
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
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 6 / 7,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () async {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.grey,
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
                        'Esta tutoría ya ha finalizado',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
