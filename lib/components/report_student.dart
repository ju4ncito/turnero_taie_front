import 'package:flutter/material.dart';
import 'package:turnero_taie_front/components/std_report_card.dart';
import 'package:turnero_taie_front/components/std_tutoria_card.dart';
import 'package:turnero_taie_front/swagger_generated_code/api_model.swagger.dart';
import '../api/api_manager.dart';

class StudentReportWidget extends StatefulWidget {
  final User? currentUser;

  StudentReportWidget({Key? key, required this.currentUser}) : super(key: key);

  @override
  _StudentReportWidgetState createState() => _StudentReportWidgetState();
}

class _StudentReportWidgetState extends State<StudentReportWidget> {
  final AuthenticatedApiManager apiManager = AuthenticatedApiManager();
  List<SearchTutorship>? reports = [];

  @override
  void initState() {
    super.initState();
    fetchReports();
  }

  bool isLoading = true;

  Future<void> fetchReports() async {
    setState(() {
      isLoading = true;
    });

    try {
      final response = await apiManager.apiModel
          .apiTutorshipInstancesGet(role: 'STD', page: 'report');
      if (response.statusCode == 200) {
        setState(() {
          reports = List<SearchTutorship>.from(response.body ?? []);
        });
      } else {
        // Handle error
      }
    } catch (error) {
      // Handle error
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reportes'),
        backgroundColor: const Color.fromARGB(255, 19, 45, 88),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0), // Add padding here
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : reports!.isEmpty
                ? const Center(
                    child: Padding(
                      padding: EdgeInsets.all(28.0),
                      child: Text(
                        'Parece que no tienes informes académicos disponibles. Consulta con tus profesores para obtener más información.',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: reports?.length ?? 0,
                    itemBuilder: (context, index) {
                      final report = reports![index];
                      return StdReportCard(
                        report: report,
                        fetchFn: fetchReports,
                        currentUser: widget.currentUser,
                      );
                    },
                  ),
      ),
    );
  }
}
