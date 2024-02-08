import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:turnero_taie_front/api/api_manager.dart';
import 'package:turnero_taie_front/swagger_generated_code/api_model.swagger.dart';

class StdReportInfo extends StatefulWidget {
  final apiManager = AuthenticatedApiManager();
  final SearchTutorship report;
  final TextEditingController commentsController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final User? currentUser;

  StdReportInfo({Key? key, required this.report, required this.currentUser})
      : super(key: key);

  @override
  _StdReportInfoState createState() => _StdReportInfoState();
}

class _StdReportInfoState extends State<StdReportInfo> {
  bool isAbsent = false;
  bool occurred = false;
  int rating = 0; // Declare a variable to hold the rating value

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
                    'Selecciona según corresponda:',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 15),

              const SizedBox(height: 10),
              // Checkboxes for 'absent' and 'occurred'
              Row(
                children: [
                  Checkbox(
                    value: isAbsent,
                    onChanged: (value) {
                      setState(() {
                        isAbsent = value!;
                      });
                    },
                  ),
                  Text('No estuve presente'),
                  SizedBox(width: 20),
                  Checkbox(
                    value: occurred,
                    onChanged: (value) {
                      setState(() {
                        occurred = value!;
                      });
                    },
                  ),
                  Text('La clase se dictó'),
                ],
              ),
              Text(
                '¿Cómo evaluarías la clase en general?',
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 0,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    unratedColor: Color.fromARGB(82, 91, 94, 97),
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star_rounded,
                      color: Color.fromARGB(255, 19, 45, 88),
                    ),
                    onRatingUpdate: (newRating) {
                      setState(() {
                        rating = newRating.round();
                        print(rating); // Update the rating variable
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Insuficiente',
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(width: 45),
                  Text(
                    'Excelente',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(height: 20),

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
                    final reviewRequest = TutorUserReviewRequest(
                      absent: isAbsent,
                      occurred: occurred,
                      studentUser: widget.currentUser!.id,
                      utility: rating,
                      comment: widget.commentsController.text,
                      tutorUser: widget.report.schedule.tutorUser.id,
                      tutorshipInstance: widget.report.id,
                    );

                    print("reviewRequest Body: ${reviewRequest.toJson()}");

                    final localContext = context;
                    final apiManager = AuthenticatedApiManager();
                    final postResult =
                        await apiManager.apiModel.apiTutorUserReviewPost(
                      body: reviewRequest,
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
