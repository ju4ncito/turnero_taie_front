import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:turnero_taie_front/api/api_manager.dart';
import 'package:turnero_taie_front/swagger_generated_code/api_model.swagger.dart';
import 'event.dart';

String translateStatusToSpanish(status) {
  Map<TutorshipInstanceStatusEnum, String> statusTranslations = {
    TutorshipInstanceStatusEnum.scheduled: 'Programada',
    TutorshipInstanceStatusEnum.inProgress: 'En curso',
    TutorshipInstanceStatusEnum.done: 'Finalizada',
    TutorshipInstanceStatusEnum.cancelled: 'Cancelada',
    TutorshipInstanceStatusEnum.delayed: 'Demorada',
  };

  // Traduce el estado o devuelve el mismo estado si no hay una traducción disponible
  return statusTranslations.containsKey(status)
      ? statusTranslations[status]!
      : status.toString();
}

Color getColorFromStatus(TutorshipInstanceStatusEnum? status) {
  switch (status) {
    case TutorshipInstanceStatusEnum.scheduled:
      return const Color.fromARGB(255, 63, 92, 143);
    case TutorshipInstanceStatusEnum.inProgress:
      return const Color.fromARGB(255, 69, 92, 54);
    case TutorshipInstanceStatusEnum.done:
      return Colors.grey;
    case TutorshipInstanceStatusEnum.cancelled:
      return const Color.fromARGB(255, 102, 30, 30);
    case TutorshipInstanceStatusEnum.delayed:
      return const Color.fromARGB(255, 78, 67, 9);
    default:
      return Colors.black;
  }
}

String getDayAbbreviation(DateTime date) {
  String weekday = DateFormat('EEEE', 'es_ES').format(date).toUpperCase();
  print(weekday);
  switch (weekday) {
    case 'LUNES':
      return 'LUN';
    case 'MARTES':
      return 'MAR';
    case 'MIÉRCOLES':
      return 'MIE';
    case 'JUEVES':
      return 'JUE';
    case 'VIERNES':
      return 'VIE';
    case 'SÁBADO':
      return 'SAB';
    case 'DOMINGO':
      return 'DOM';
    default:
      return '';
  }
}
