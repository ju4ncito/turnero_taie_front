import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:turnero_taie_front/api/api_manager.dart';
import 'package:turnero_taie_front/swagger_generated_code/api_model.swagger.dart';

class TutorReportInfo extends StatefulWidget {
  final apiManager = AuthenticatedApiManager();
  final SearchTutorship report;
  final TextEditingController commentsController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();

  TutorReportInfo({Key? key, required this.report}) : super(key: key);

  @override
  _TutorReportInfoState createState() => _TutorReportInfoState();
}

class _TutorReportInfoState extends State<TutorReportInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text('Informe'),
            SizedBox(height: 4),
            Text(
              '${widget.report.area.name} - ${DateFormat('dd-MM-yyyy').format(widget.report.date)}',
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
                    '¿Qué temas se abordaron en la clase? ',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: widget.subjectController,
                maxLength: 160,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'Dudas sobre...',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Comentarios sobre la clase',
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: widget.commentsController,
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
                    if (widget.subjectController.text.isEmpty ||
                        widget.commentsController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Debes completar todos los campos'),
                        ),
                      );
                      return; // Return early if either field is empty
                    }

                    final reportRequest = TutorshipReportRequest(
                      subject: widget.subjectController.text,
                      comment: widget.commentsController.text,
                      tutorUser: widget.report.schedule.tutorUser.id,
                      tutorshipInstance: widget.report.id,
                    );

                    print("reportRequest Body: ${reportRequest.toJson()}");

                    final localContext = context;
                    final apiManager = AuthenticatedApiManager();
                    final postResult =
                        await apiManager.apiModel.apiTutorshipReportsPost(
                      body: reportRequest,
                    );

                    print(postResult.error);
                    print(postResult);
                    print(
                        "API INscripcion a instancia Response Status Code: ${postResult.statusCode}");

                    if (context.mounted) {
                      Navigator.pop(localContext);
                    }
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
