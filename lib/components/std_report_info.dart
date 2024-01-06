import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'helper_functions.dart';
import 'package:turnero_taie_front/api/api_manager.dart';
import 'package:turnero_taie_front/swagger_generated_code/api_model.swagger.dart';

class StdReportInfo extends StatelessWidget {
  final apiManager = AuthenticatedApiManager();
  final SearchTutorship report;
  final TextEditingController commentsController = TextEditingController();

  StdReportInfo({Key? key, required this.report}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text('Informe'),
            SizedBox(height: 4),
            Text(
              '${report.area.name} - ${DateFormat('dd-MM-yyyy').format(report.date)}',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white54,
              ),
            ),
            SizedBox(height: 8),
          ],
        ),
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
                    'La clase fue dictada por:',
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    ClipOval(
                      child: Image(
                        image: report.schedule.tutorUser.profilePicture != null
                            ? NetworkImage(
                                report.schedule.tutorUser.profilePicture!)
                            : const AssetImage(
                                    'assets/images/default_profile_picture.png')
                                as ImageProvider,
                        width: 50,
                        height: 50,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${report.schedule.tutorUser.firstName} ${report.schedule.tutorUser.lastName}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          report.area.name,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Feedback del tutor',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              Text(
                '¿Cómo evaluarías la clase en general?',
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Checkbox(value: false, onChanged: (value) {}),
                  Text('Sí'),
                  const SizedBox(width: 10),
                  Checkbox(value: false, onChanged: (value) {}),
                  Text('Parcialmente'),
                  const SizedBox(width: 10),
                  Checkbox(value: false, onChanged: (value) {}),
                  Text('No'),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                '¿El contenido fue claro y comprensible?',
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Checkbox(value: false, onChanged: (value) {}),
                  Text('Sí'),
                  const SizedBox(width: 10),
                  Checkbox(value: false, onChanged: (value) {}),
                  Text('Parcialmente'),
                  const SizedBox(width: 10),
                  Checkbox(value: false, onChanged: (value) {}),
                  Text('No'),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                '¿El tutor resolvió tus dudas?',
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Checkbox(value: false, onChanged: (value) {}),
                  Text('Sí'),
                  const SizedBox(width: 10),
                  Checkbox(value: false, onChanged: (value) {}),
                  Text('Parcialmente'),
                  const SizedBox(width: 10),
                  Checkbox(value: false, onChanged: (value) {}),
                  Text('No'),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'Utiliza este espacio para agregar comentarios sobre la clase',
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: commentsController,
                maxLength: 160,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'Máximo 160 caracteres',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              Spacer(),
              SizedBox(
                width: MediaQuery.of(context).size.width * 6 / 7,
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    // Your action when the button is pressed
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 69, 92, 54),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                    ),
                    elevation: MaterialStateProperty.all(4),
                  ),
                  child: const Text(
                    'Enviar reporte',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
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
