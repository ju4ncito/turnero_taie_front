import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:turnero_taie_front/components/tut_report_info.dart';
import 'package:turnero_taie_front/swagger_generated_code/api_model.swagger.dart';
import 'helper_functions.dart';

class TutorReportCard extends StatelessWidget {
  final SearchTutorship report;
  final Future<void> Function() fetchFn;

  const TutorReportCard({Key? key, required this.report, required this.fetchFn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: Colors.blueGrey,
      elevation: 8,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(4, 10, 4, 6),
        child: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${report.area.name}', // Assuming subject is part of the report
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${DateFormat('dd-MM-yyyy', 'es_AR').format(report.date)}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 20,
              )
            ],
          ),
          subtitle: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.01,
                  ),
                  child: Text(
                    '${report.schedule.modality} con ${report.users.length - 1} ${report.users.length - 1 == 1 ? 'asistente' : 'asistentes'}',
                    style: const TextStyle(
                      color: Color.fromARGB(255, 203, 225, 255),
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.01,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.info_outline_rounded,
                      color: Colors.white,
                      size: 21,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Reporte pendiente',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.grey[100],
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          onTap: () {
            print('reporte selected: $report');
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TutorReportInfo(
                  report: report,
                ),
              ),
            ).then((value) {
              fetchFn();
            });
          },
        ),
      ),
    );
  }
}
