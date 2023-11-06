import 'package:flutter/material.dart';
import 'package:turnero_taie_front/swagger_generated_code/api_model.swagger.dart';
import '../api/api_manager.dart';

class ScheduleDetail extends StatefulWidget {
  final CreateDeleteTutorUserSchedule tutorSchedule;

  ScheduleDetail({required this.tutorSchedule});

  @override
  _ScheduleDetailState createState() => _ScheduleDetailState();
}

class _ScheduleDetailState extends State<ScheduleDetail> {
  late TextEditingController dayController;
  late TextEditingController modalityController;
  late TextEditingController capacityController;
  late TextEditingController beginController;
  late TextEditingController endController;

  late CreateDeleteTutorUserSchedule editedTutorSchedule;
  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    editedTutorSchedule = widget.tutorSchedule;

    // Initialize controllers with the current values
    dayController = TextEditingController(text: editedTutorSchedule.day);
    modalityController =
        TextEditingController(text: editedTutorSchedule.modality);
    capacityController =
        TextEditingController(text: editedTutorSchedule.capacity.toString());
    beginController = TextEditingController(text: editedTutorSchedule.begin);
    endController = TextEditingController(text: editedTutorSchedule.end);
  }

  void enableEditing() {
    setState(() {
      isEditing = true;
    });
  }

  void saveChanges() {
    // Update the editedTutorSchedule with new values from controllers
    editedTutorSchedule = CreateDeleteTutorUserSchedule(
      id: editedTutorSchedule.id,
      day: dayController.text,
      modality: modalityController.text,
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
    dayController.dispose();
    modalityController.dispose();
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
      final apiManager = ApiManager();
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
        title: const Text('Schedule Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
              visible: !isEditing,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Día: ${editedTutorSchedule.day}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Modalidad: ${editedTutorSchedule.modality}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Capacidad (asistentes): ${editedTutorSchedule.capacity.toString()}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Hora de Inicio: ${editedTutorSchedule.begin}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Hora de Finalización: ${editedTutorSchedule.end}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _showDeleteConfirmationDialog,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: const Text('Eliminar Horario'),
                  ),
                ],
              ),
            ),
            if (isEditing)
              Column(
                children: [
                  TextFormField(
                    controller: dayController,
                    decoration: const InputDecoration(labelText: 'Día'),
                  ),
                  TextFormField(
                    controller: modalityController,
                    decoration: const InputDecoration(labelText: 'Modalidad'),
                  ),
                  TextFormField(
                    controller: capacityController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        labelText: 'Capacidad (asistentes)'),
                  ),
                  TextFormField(
                    controller: beginController,
                    decoration:
                        const InputDecoration(labelText: 'Hora de Inicio'),
                  ),
                  TextFormField(
                    controller: endController,
                    decoration: const InputDecoration(
                        labelText: 'Hora de Finalización'),
                  ),
                ],
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if (isEditing)
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isEditing = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                    ),
                    child: const Text('Cancelar'),
                  ),
                if (!isEditing)
                  ElevatedButton(
                    onPressed: enableEditing,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: const Text('Modificar Horario'),
                  ),
                if (isEditing)
                  ElevatedButton(
                    onPressed: () async {
                      final editedTutorSchedule = CreateDeleteTutorUserSchedule(
                        id: widget.tutorSchedule.id,
                        day: dayController.text,
                        modality: modalityController.text,
                        capacity: int.parse(capacityController.text),
                        begin: beginController.text,
                        end: endController.text,
                        tutorUser: widget.tutorSchedule.tutorUser,
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

                      print("Tutoria Request Body: ${patchedRequest.toJson()}");

                      final apiManager = ApiManager();
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
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: const Text('Guardar Cambios'),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
