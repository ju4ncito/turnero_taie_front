import 'package:flutter/material.dart';
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
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(28.0),
                  child: Text(
                    'Para consultar tus horarios dirigete a la página principal',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}
