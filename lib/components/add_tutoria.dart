import 'package:flutter/material.dart';
import 'package:turnero_taie_front/swagger_generated_code/api_model.swagger.dart';
import '../api/api_manager.dart';

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
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      final selectedHour = picked.hour < 12 ? picked.hour : picked.hour - 12;
      final formattedTime =
          '$selectedHour:${picked.minute.toString().padLeft(2, '0')}:00';
      setState(() {
        controller.text = formattedTime;
      });
    }
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16.0),
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
              decoration: const InputDecoration(labelText: 'Begin Time'),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: _endController,
              onTap: () => _selectTime(context, _endController),
              readOnly: true,
              decoration: const InputDecoration(labelText: 'End Time'),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: _capacityController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Capacity'),
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () async {
                final tutoriaRequest = CreateDeleteTutorUserScheduleRequest(
                  begin: _beginController.text,
                  capacity: int.parse(_capacityController.text),
                  day: _selectedDay,
                  end: _endController.text,
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
              child: const Text('Add Tutoria'),
            ),
          ],
        ),
      ),
    );
  }
}
