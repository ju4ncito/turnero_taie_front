import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:turnero_taie_front/api/api_manager.dart';
import 'package:turnero_taie_front/swagger_generated_code/api_model.swagger.dart';
import 'event.dart';

String translateStatusToSpanish(Status3e2Enum status) {
  Map<Status3e2Enum, String> statusTranslations = {
    Status3e2Enum.scheduled: 'Programada',
    Status3e2Enum.inProgress: 'En curso',
    Status3e2Enum.done: 'Finalizada',
    Status3e2Enum.cancelled: 'Cancelada',
    Status3e2Enum.delayed: 'Demorada',
  };

  // Traduce el estado o devuelve el mismo estado si no hay una traducción disponible
  return statusTranslations.containsKey(status)
      ? statusTranslations[status]!
      : status.toString();
}

Color getColorFromStatus(Status3e2Enum? status) {
  switch (status) {
    case Status3e2Enum.scheduled:
      return const Color.fromARGB(255, 63, 92, 143);
    case Status3e2Enum.inProgress:
      return const Color.fromARGB(255, 69, 92, 54);
    case Status3e2Enum.done:
      return Colors.grey;
    case Status3e2Enum.cancelled:
      return const Color.fromARGB(255, 102, 30, 30);
    case Status3e2Enum.delayed:
      return const Color.fromARGB(255, 78, 67, 9);
    default:
      return Colors.black;
  }
}

String getDayAbbreviation(DateTime date) {
  String weekday = DateFormat('EEEE', 'es_ES').format(date).toUpperCase();

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
