import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:turnero_taie_front/swagger_generated_code/api_model.swagger.dart';
import '../api/api_manager.dart';

class ScheduleDetail extends StatefulWidget {
  final ReadTutorUserSchedule tutorSchedule;

  ScheduleDetail({required this.tutorSchedule});

  @override
  _ScheduleDetailState createState() => _ScheduleDetailState();
}

class _ScheduleDetailState extends State<ScheduleDetail> {
  late TextEditingController capacityController;
  late TextEditingController beginController;
  late TextEditingController endController;
  late CreateDeleteTutorUserSchedule editedTutorSchedule;

  List<Widget> numbers = List<Widget>.generate(
    50,
    (index) => Text('${index + 1}'),
  );

  String _selectedDay = '';
  String _selectedModality = '';

  bool isEditing = false;

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

  @override
  void initState() {
    super.initState();
    editedTutorSchedule = CreateDeleteTutorUserSchedule(
        id: widget.tutorSchedule.id,
        modality: widget.tutorSchedule.modality,
        day: widget.tutorSchedule.day,
        begin: widget.tutorSchedule.begin,
        end: widget.tutorSchedule.end,
        capacity: widget.tutorSchedule.capacity,
        tutorUser: widget.tutorSchedule.tutorUser.id);

    // Initialize controllers with the current values

    capacityController =
        TextEditingController(text: editedTutorSchedule.capacity.toString());
    beginController = TextEditingController(text: editedTutorSchedule.begin);
    endController = TextEditingController(text: editedTutorSchedule.end);
    _selectedDay = editedTutorSchedule.day;
    _selectedModality = editedTutorSchedule.modality;
  }

  void enableEditing() {
    setState(() {
      isEditing = true;
    });
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

  Future<void> _selectNumber(
      BuildContext context, TextEditingController controller) async {
    final int? picked = await showCupertinoModalPopup<int>(
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
                child: CupertinoPicker(
                  itemExtent: 32.0,
                  onSelectedItemChanged: (int index) {
                    controller.text = (index + 1).toString();
                  },
                  children: numbers,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void saveChanges() {
    // Update the editedTutorSchedule with new values from controllers
    editedTutorSchedule = CreateDeleteTutorUserSchedule(
      id: editedTutorSchedule.id,
      day: _selectedDay,
      modality: _selectedModality,
      capacity: int.parse(capacityController.text),
      begin: beginController.text,
      end: endController.text,
      tutorUser: editedTutorSchedule.tutorUser,
    );

    // Implement logic to save the edited schedule here
    // You can save the editedTutorSchedule to your backend or perform other actions

    setState(() {
      isEditing = false;
    });
  }

  @override
  void dispose() {
    // Dispose of the controllers

    capacityController.dispose();
    beginController.dispose();
    endController.dispose();
    super.dispose();
  }

  void _showDeleteConfirmationDialog() async {
    final isConfirmed = await showDialog<bool>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Confirmar Eliminación'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('¿Estás seguro de que deseas eliminar este horario?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(dialogContext)
                    .pop(false); // Close the dialog with 'false'
              },
            ),
            TextButton(
              child: const Text('Eliminar'),
              onPressed: () {
                Future.delayed(const Duration(milliseconds: 100), () {
                  Navigator.of(dialogContext).pop(true);
                });
              },
            ),
          ],
        );
      },
    );

    if (isConfirmed == true) {
      final apiManager = AuthenticatedApiManager();
      final deleteResult =
          await apiManager.apiModel.apiTutorUserSchedulesIdDelete(
        id: widget.tutorSchedule.id,
      );

      if (deleteResult.error == null) {
        print("Horario eliminado con éxito");

        if (context.mounted) {
          Navigator.of(context).pop();
        }
      } else {
        print("Error al eliminar el horario: ${deleteResult.error}");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle del horario'),
        backgroundColor: const Color.fromARGB(255, 19, 45, 88),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
              visible: !isEditing,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Día: ${editedTutorSchedule.day}',
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                const Text(
                                  'Modalidad',
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.bold),
                                ),
                                ElevatedButton(
                                  onPressed: null,
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              const Color.fromARGB(
                                                  255, 30, 56, 102))),
                                  child: Text(
                                    editedTutorSchedule.modality,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 20),
                            Column(
                              children: [
                                const Text(
                                  'Capacidad',
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.bold),
                                ),
                                ElevatedButton(
                                  onPressed: null,
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              const Color.fromARGB(
                                                  255, 30, 56, 102))),
                                  child: Text(
                                    ('${editedTutorSchedule.capacity.toString()} alumnos'),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Column(
                        children: [
                          const Text(
                            'Inicio',
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.bold),
                          ),
                          ElevatedButton(
                            onPressed: null,
                            child: Text(
                              editedTutorSchedule.begin.substring(
                                  0, editedTutorSchedule.begin.length - 3),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 30),
                      Column(
                        children: [
                          const Text(
                            'Final',
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.bold),
                          ),
                          ElevatedButton(
                            onPressed: null,
                            child: Text(
                              editedTutorSchedule.end.substring(
                                  0, editedTutorSchedule.end.length - 3),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ]),
                    const SizedBox(height: 20),
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 6 / 7,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: _showDeleteConfirmationDialog,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 102, 30, 30),
                          ),
                          child: const Text(
                            'Eliminar horario',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            if (isEditing)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16.0),
                    const Text(
                      'Completa los siguientes datos',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 30.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            const Text(
                              'Día de la semana',
                              style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.bold),
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
                          ],
                        ),
                        const SizedBox(width: 60),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Modalidad',
                              style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.bold),
                            ),
                            DropdownButton<String>(
                              value: _selectedModality,
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedModality = newValue!;
                                });
                              },
                              items: <String>[
                                'Virtual',
                                'Presencial'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                const SizedBox(height: 16.0),
                                const Text(
                                  'Hora de inicio',
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  width: 85,
                                  child: TextFormField(
                                    textAlign: TextAlign.center,
                                    controller: beginController,
                                    onTap: () =>
                                        _selectTime(context, beginController),
                                    decoration: const InputDecoration(),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 30),
                            Column(
                              children: [
                                const SizedBox(height: 16.0),
                                const Text(
                                  'Hora de fin',
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  width: 85,
                                  child: TextFormField(
                                    textAlign: TextAlign.center,
                                    controller: endController,
                                    onTap: () =>
                                        _selectTime(context, endController),
                                    decoration: const InputDecoration(),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 30),
                            Column(
                              children: [
                                const SizedBox(height: 16.0),
                                const Text(
                                  'Capacidad',
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  width: 60,
                                  child: TextFormField(
                                    textAlign: TextAlign.center,
                                    controller: capacityController,
                                    onTap: () => _selectNumber(
                                        context, capacityController),
                                    decoration: const InputDecoration(),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 2 / 6,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  isEditing = false;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blueGrey,
                              ),
                              child: const Text(
                                'Cancelar',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 2 / 5,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () async {
                                final editedTutorSchedule =
                                    CreateDeleteTutorUserSchedule(
                                  id: widget.tutorSchedule.id,
                                  day: _selectedDay,
                                  modality: _selectedModality,
                                  capacity: int.parse(capacityController.text),
                                  begin: beginController.text,
                                  end: endController.text,
                                  tutorUser: widget.tutorSchedule.tutorUser.id,
                                );

                                final patchedRequest =
                                    PatchedCreateDeleteTutorUserScheduleRequest(
                                  modality: editedTutorSchedule.modality,
                                  day: editedTutorSchedule.day,
                                  begin: editedTutorSchedule.begin,
                                  end: editedTutorSchedule.end,
                                  capacity: editedTutorSchedule.capacity,
                                  tutorUser: editedTutorSchedule.tutorUser,
                                );

                                print(
                                    "Tutoria Request Body: ${patchedRequest.toJson()}");

                                final apiManager = AuthenticatedApiManager();
                                final postResult = await apiManager.apiModel
                                    .apiTutorUserSchedulesIdPatch(
                                  id: widget.tutorSchedule.id,
                                  body: patchedRequest,
                                );

                                if (postResult.error == null) {
                                  saveChanges();
                                  print(
                                      "API Response Status Code: ${postResult.statusCode}");
                                } else {
                                  print(
                                      "Error en la solicitud PATCH: ${postResult.error}");
                                  if (context.mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                            '${postResult.error}. Por favor, contacte a soporte.'),
                                        duration: Duration(seconds: 5),
                                      ),
                                    );
                                  }
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                              ),
                              child: const Text(
                                'Guardar',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if (!isEditing)
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 6 / 7,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: enableEditing,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 19, 45, 88),
                        ),
                        child: const Text(
                          'Modificar horario',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
