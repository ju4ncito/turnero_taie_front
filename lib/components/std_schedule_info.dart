import 'package:flutter/material.dart';
import 'helper_functions.dart';
import 'package:turnero_taie_front/api/api_manager.dart';
import 'package:turnero_taie_front/swagger_generated_code/api_model.swagger.dart';

class ScheduleInfo extends StatelessWidget {
  final apiManager = AuthenticatedApiManager();

  final SearchTutorship tutorInstance;

  ScheduleInfo({Key? key, required this.tutorInstance}) : super(key: key);

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
                    tutorInstance.area.name,
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
                          getDayAbbreviation(tutorInstance.date),
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
                          image: tutorInstance
                                      .schedule.tutorUser.profilePicture !=
                                  null
                              ? NetworkImage(tutorInstance
                                  .schedule.tutorUser.profilePicture!)
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
                          '${tutorInstance.schedule.tutorUser.firstName} ${tutorInstance.schedule.tutorUser.lastName}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '${tutorInstance.area.name}',
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
                          tutorInstance.schedule.begin.substring(
                              0, tutorInstance.schedule.begin.length - 3),
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
                          tutorInstance.schedule.end.substring(
                              0, tutorInstance.schedule.begin.length - 3),
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
                          '${tutorInstance.date.day}/'
                          '${tutorInstance.date.month}/'
                          '${tutorInstance.date.year}',
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
                      tutorInstance.schedule.modality,
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
                            getColorFromStatus(tutorInstance.status))),
                    child: Text(
                      translateStatusToSpanish(tutorInstance.status),
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 6 / 7,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      final tutoriaRequest = EnrollRequest(
                          scheduleId: tutorInstance.schedule.id,
                          date: tutorInstance.date,
                          areaId: tutorInstance.area.id);

                      print("Tutoria Request Body: ${tutorInstance.toJson()}");

                      final localContext = context;
                      final apiManager = AuthenticatedApiManager();
                      final postResult = await apiManager.apiModel
                          .apiTutorshipInstancesIdDisenrollTutorshipPost(
                        id: tutorInstance.id,
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
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
