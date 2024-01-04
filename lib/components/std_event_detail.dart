import 'package:flutter/material.dart';
import 'event.dart';

class EventDetail extends StatelessWidget {
  final Event event;

  EventDetail({required this.event});

  String? translateStatusToSpanish(String? status) {
    Map<String, String> statusTranslations = {
      'Scheduled': 'Programada',
      'In progress': 'En curso',
      'Done': 'Finalizada',
      'Cancelled': 'Cancelada',
      'Delayed': 'Demorada',
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
                'Asistirán ${event.asistentes} alumnos',
                style: TextStyle(fontSize: 16),
              ),
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
                    'Para cancelar tu asistencia a este evento, por favor accede al detalle desde la pagina principal ',
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
