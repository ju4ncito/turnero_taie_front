import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:turnero_taie_front/api/api_manager.dart';
import 'package:turnero_taie_front/swagger_generated_code/api_model.swagger.dart';
import 'event.dart';

String translateStatusToSpanish(String status) {
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

Color getColorFromStatus(String? status) {
  switch (status) {
    case 'Scheduled':
      return const Color.fromARGB(255, 63, 92, 143);
    case 'In progress':
      return const Color.fromARGB(255, 69, 92, 54);
    case 'Done':
      return Colors.grey;
    case 'Cancelled':
      return const Color.fromARGB(255, 102, 30, 30);
    case 'Delayed':
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
