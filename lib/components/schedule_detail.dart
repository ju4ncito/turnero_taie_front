import 'package:flutter/material.dart';
import 'package:turnero_taie_front/swagger_generated_code/api_model.swagger.dart';

class ScheduleDetail extends StatelessWidget {
  final TutorUserSchedule tutorSchedule;

  const ScheduleDetail({Key? key, required this.tutorSchedule})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle del Horario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Día: ${tutorSchedule.day}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Modalidad: ${tutorSchedule.modality}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Capacidad: ${tutorSchedule.capacity.toString()} asistentes',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Hora de Inicio: ${tutorSchedule.begin}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Hora de Finalización: ${tutorSchedule.end}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20), // Espacio entre la información y los botones
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Acción para modificar el horario
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                  ),
                  child: Text('Modificar Horario'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Acción para cancelar el horario
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  child: Text('Cancelar Horario'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
