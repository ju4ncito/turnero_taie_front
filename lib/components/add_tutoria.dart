import 'package:flutter/material.dart';
import 'package:turnero_taie_front/swagger_generated_code/api_model.swagger.dart';
import '../api/api_manager.dart';
import 'package:flutter/cupertino.dart';

class AddTutoriaPage extends StatefulWidget {
  final User? currentUser;
  final Future<void> Function() fetchFn;

  const AddTutoriaPage(
      {super.key, required this.currentUser, required this.fetchFn});

  @override
  _AddTutoriaPageState createState() => _AddTutoriaPageState();
}

class _AddTutoriaPageState extends State<AddTutoriaPage> {
  final apiManager = AuthenticatedApiManager();

  late TextEditingController _beginController;
  late TextEditingController _endController;
  late TextEditingController _capacityController;

  String _selectedModality = 'Virtual';
  String _selectedDay = 'Lunes'; // Default to 'Lunes'

  @override
  void initState() {
    super.initState();
    _beginController = TextEditingController();
    _endController = TextEditingController();
    _capacityController = TextEditingController();
  }

  @override
  void dispose() {
    _beginController.dispose();
    _endController.dispose();
    _capacityController.dispose();
    super.dispose();
  }

  Future<void> _selectTime(
      BuildContext context, TextEditingController controller) async {
    final Duration? picked = await showCupertinoModalPopup<Duration>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 300,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    child: const Text('Cancel'),
                    onPressed: () => Navigator.pop(context),
                  ),
                  CupertinoButton(
                    child: const Text('Done'),
                    onPressed: () {
                      Navigator.pop(context);
                      setState(() {});
                    },
                  ),
                ],
              ),
              Expanded(
                child: CupertinoTimerPicker(
                  mode: CupertinoTimerPickerMode.hm,
                  initialTimerDuration: Duration(hours: 12, minutes: 0),
                  onTimerDurationChanged: (Duration newDuration) {
                    final formattedTime =
                        '${newDuration.inHours}:${newDuration.inMinutes.remainder(60).toString().padLeft(2, '0')}';
                    controller.text = formattedTime;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar un horario'),
        backgroundColor: const Color.fromARGB(255, 19, 45, 88),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16.0),
              const Text(
                'Completa los siguientes datos',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Modalidad',
                style: TextStyle(
                    color: Colors.blueGrey, fontWeight: FontWeight.bold),
              ),
              DropdownButton<String>(
                value: _selectedModality,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedModality = newValue!;
                  });
                },
                items: <String>['Virtual', 'Presencial']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Día de la semana',
                style: TextStyle(
                    color: Colors.blueGrey, fontWeight: FontWeight.bold),
              ),
              DropdownButton<String>(
                value: _selectedDay,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedDay = newValue!;
                  });
                },
                items: <String>[
                  'Lunes',
                  'Martes',
                  'Miercoles',
                  'Jueves',
                  'Viernes',
                  'Sabado',
                  'Domingo'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _beginController,
                onTap: () => _selectTime(context, _beginController),
                readOnly: true,
                decoration: const InputDecoration(labelText: 'Hora de inicio'),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _endController,
                onTap: () => _selectTime(context, _endController),
                readOnly: true,
                decoration: const InputDecoration(labelText: 'Hora de fin'),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _capacityController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Capacidad'),
              ),
              const SizedBox(height: 32.0),
              Spacer(),
              Container(
                width: MediaQuery.of(context).size.width * 6 / 7,
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    final beginTime = _beginController.text + ':00';
                    final endTime = _endController.text + ':00';

                    final tutoriaRequest = CreateDeleteTutorUserScheduleRequest(
                      begin: beginTime,
                      capacity: int.parse(_capacityController.text),
                      day: _selectedDay,
                      end: endTime,
                      modality: _selectedModality,
                      tutorUser: widget.currentUser!.id,
                    );

                    print("Tutoria Request Body: ${tutoriaRequest.toJson()}");

                    final localContext = context;
                    final postResult =
                        await apiManager.apiModel.apiTutorUserSchedulesPost(
                      body: tutoriaRequest,
                    );
                    print(postResult.error);
                    print("API Response Status Code: ${postResult.statusCode}");

                    widget.fetchFn();
                    if (context.mounted) {
                      Navigator.pop(localContext);
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 30, 56, 102),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                    ),
                    elevation: MaterialStateProperty.all(4),
                  ),
                  child: const Text(
                    'Agregar nuevo horario',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
