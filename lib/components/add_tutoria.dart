import 'package:flutter/material.dart';
import 'package:turnero_taie_front/swagger_generated_code/api_model.swagger.dart';
import '../api/api_manager.dart';
import 'package:intl/intl.dart';

class AddTutoriaPage extends StatefulWidget {
  final User? currentUser;
  final Future<void> Function() fetchFn;

  const AddTutoriaPage(
      {super.key, required this.currentUser, required this.fetchFn});

  @override
  _AddTutoriaPageState createState() => _AddTutoriaPageState();
}

class _AddTutoriaPageState extends State<AddTutoriaPage> {
  final apiManager = ApiManager();

  late TextEditingController _beginController;
  late TextEditingController _endController;
  late TextEditingController _capacityController;
  late TextEditingController _dateController;

  String _selectedModality = 'Virtual';
  late DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _beginController = TextEditingController();
    _endController = TextEditingController();
    _capacityController = TextEditingController();
    _dateController = TextEditingController(
        text: DateFormat('yyyy-MM-dd').format(_selectedDate));
  }

  @override
  void dispose() {
    _beginController.dispose();
    _endController.dispose();
    _capacityController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = DateFormat('yyyy-MM-dd').format(_selectedDate);
      });
    }
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
        title: const Text('Add Tutoria'),
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
            TextButton(
              onPressed: () => _selectDate(context),
              child: Row(
                children: [
                  const Text('Select Date: '),
                  Expanded(
                    child: TextFormField(
                      controller: _dateController,
                      enabled: false,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
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
                final tutoriaRequest = TutorUserScheduleRequest(
                  begin: _beginController.text,
                  capacity: int.parse(_capacityController.text),
                  day: _dateController.text,
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
