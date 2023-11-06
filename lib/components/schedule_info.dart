import 'package:flutter/material.dart';
import 'package:turnero_taie_front/swagger_generated_code/api_model.swagger.dart';

class ScheduleInfo extends StatelessWidget {
  final ReadTutorUserSchedule tutorSchedule;

  const ScheduleInfo({Key? key, required this.tutorSchedule}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Schedule Info'),
      ),
      body: Center(
        child: Text('This is the Schedule Info page for ${tutorSchedule.day}'),
      ),
    );
  }
}
