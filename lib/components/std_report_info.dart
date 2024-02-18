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
  bool occurred = true;
  int rating = 0; // Declare a variable to hold the rating value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          '${widget.report.area.name} - ${DateFormat('dd-MM-yyyy').format(widget.report.date)}',
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
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Tutor: ',
                        style: const TextStyle(fontSize: 12),
                      ),
                      Text(
                        '${widget.report.schedule.tutorUser.firstName} ${widget.report.schedule.tutorUser.lastName} (${widget.report.schedule.tutorUser.email})',
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        'Selecciona según corresponda:',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // Checkboxes for 'absent' and 'occurred'
              Row(
                children: [
                  Text('Falté a la clase'),
                  SizedBox(width: 20),
                  Switch(
                    value: isAbsent,
                    onChanged: (value) {
                      setState(() {
                        isAbsent = value;
                      });
                    },
                  ),
                  SizedBox(width: 5),
                  Text(isAbsent
                      ? 'SI'
                      : 'NO'), // Muestra 'SI' si isAbsent es true, 'NO' si es false
                ],
              ),
              Row(
                children: [
                  Text('La clase se dictó'),
                  SizedBox(width: 20),
                  Switch(
                    value: occurred,
                    onChanged: isAbsent
                        ? null // Si isAbsent es true, el onChanged estará deshabilitado
                        : (value) {
                            setState(() {
                              occurred = value;
                            });
                          },
                  ),
                  SizedBox(width: 5),
                  Text(occurred
                      ? 'SI'
                      : 'NO'), // Muestra 'SI' si occurred es true, 'NO' si es false
                ],
              ),
              if (!isAbsent)
                Text(
                  '¿Cómo evaluarías la clase en general?',
                  style: TextStyle(fontSize: 15),
                ),
              const SizedBox(height: 15),
              if (!isAbsent)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RatingBar.builder(
                      initialRating: 1,
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
              if (!isAbsent)
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
                enabled: !isAbsent, // Deshabilita el campo si isAbsent es true
              ),

              const SizedBox(height: 20),
              Spacer(),
              SizedBox(
                width: MediaQuery.of(context).size.width * 6 / 7,
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    if (widget.commentsController.text.isEmpty && !isAbsent) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'Debes dejar un comentario para enviar el reporte'),
                        ),
                      );
                      return; // Return early if either field is empty or if both checkboxes are unchecked
                    }

                    if (isAbsent) {
                      widget.commentsController.text = 'Falté a la clase';
                      rating = 1;
                    }
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
              // SizedBox(
              //   height: 40,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
