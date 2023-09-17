import 'package:flutter/material.dart';
import 'package:turnero_taie_front/swagger_generated_code/api_model.swagger.dart';
import '../api/api_manager.dart';

class ScheduleDetail extends StatefulWidget {
  final TutorUserSchedule tutorSchedule;

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

  late TutorUserSchedule editedTutorSchedule;
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
    editedTutorSchedule = TutorUserSchedule(
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
          title: Text('Confirmar Eliminación'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('¿Estás seguro de que deseas eliminar este horario?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(dialogContext)
                    .pop(false); // Close the dialog with 'false'
              },
            ),
            TextButton(
              child: Text('Eliminar'),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const AlertDialog(
                      title: Text('Éxito'),
                      content: Text('Horario eliminado'),
                    );
                  },
                );
                Future.delayed(const Duration(milliseconds: 1000), () {
                  Navigator.of(dialogContext).pop(true);
                  Navigator.of(dialogContext)
                      .pop(true); // Close the dialog with 'true'
                });
              },
            ),
          ],
        );
      },
    );

    if (isConfirmed == true) {
      // User confirmed deletion, proceed with DELETE request
      final apiManager = ApiManager();
      final deleteResult =
          await apiManager.apiModel.apiTutorUserSchedulesIdDelete(
        id: widget.tutorSchedule.id,
      );

      if (deleteResult.error == null) {
        // The DELETE request was successful
        print("Horario eliminado con éxito");

        // Navigate back to the previous page after deleting
        Navigator.of(context).pop(); // Close the current screen
      } else {
        // Error in the DELETE request
        print("Error al eliminar el horario: ${deleteResult.error}");
        // You can show an error message or handle the error situation here
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Schedule Detail'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
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
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Modalidad: ${editedTutorSchedule.modality}',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Capacidad (asistentes): ${editedTutorSchedule.capacity.toString()}',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Hora de Inicio: ${editedTutorSchedule.begin}',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Hora de Finalización: ${editedTutorSchedule.end}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _showDeleteConfirmationDialog,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                    child: Text('Eliminar Horario'),
                  ),
                ],
              ),
            ),
            if (isEditing)
              Column(
                children: [
                  TextFormField(
                    controller: dayController,
                    decoration: InputDecoration(labelText: 'Día'),
                  ),
                  TextFormField(
                    controller: modalityController,
                    decoration: InputDecoration(labelText: 'Modalidad'),
                  ),
                  TextFormField(
                    controller: capacityController,
                    keyboardType: TextInputType.number,
                    decoration:
                        InputDecoration(labelText: 'Capacidad (asistentes)'),
                  ),
                  TextFormField(
                    controller: beginController,
                    decoration: InputDecoration(labelText: 'Hora de Inicio'),
                  ),
                  TextFormField(
                    controller: endController,
                    decoration:
                        InputDecoration(labelText: 'Hora de Finalización'),
                  ),
                  // ElevatedButton(
                  //   onPressed: () async {
                  //     final editedTutorSchedule = TutorUserSchedule(
                  //       id: widget.tutorSchedule
                  //           .id, // Asegúrate de incluir el ID del horario
                  //       day: dayController.text,
                  //       modality: modalityController.text,
                  //       capacity: int.parse(capacityController.text),
                  //       begin: beginController.text,
                  //       end: endController.text,
                  //       tutorUser: widget.tutorSchedule.tutorUser,
                  //     );

                  //     // Crear un objeto PatchedTutorUserScheduleRequest utilizando los valores editados
                  //     final patchedRequest = PatchedTutorUserScheduleRequest(
                  //       modality: editedTutorSchedule.modality,
                  //       day: editedTutorSchedule.day,
                  //       begin: editedTutorSchedule.begin,
                  //       end: editedTutorSchedule.end,
                  //       capacity: editedTutorSchedule.capacity,
                  //       tutorUser: editedTutorSchedule.tutorUser,
                  //     );

                  //     print("Tutoria Request Body: ${patchedRequest.toJson()}");

                  //     final apiManager = ApiManager();
                  //     final postResult = await apiManager.apiModel
                  //         .apiTutorUserSchedulesIdPatch(
                  //       id: widget.tutorSchedule
                  //           .id, // Pasar el ID del horario que se está modificando
                  //       body:
                  //           patchedRequest, // Usar el objeto PatchedTutorUserScheduleRequest
                  //     );

                  //     if (postResult.error == null) {
                  //       saveChanges();
                  //       // La solicitud PATCH se realizó con éxito
                  //       print(
                  //           "API Response Status Code: ${postResult.statusCode}");
                  //       // Puedes realizar otras acciones o mostrar un mensaje de éxito aquí
                  //     } else {
                  //       // Error en la solicitud PATCH
                  //       print(
                  //           "Error en la solicitud PATCH: ${postResult.error}");
                  //       // Puedes mostrar un mensaje de error o manejar la situación de error aquí
                  //     }
                  //   },
                  //   style: ElevatedButton.styleFrom(
                  //     primary: Colors.green,
                  //   ),
                  //   child: Text('Guardar Cambios'),
                  // ),
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
                      primary: Colors
                          .grey, // Choose a suitable color for the cancel button
                    ),
                    child: Text('Cancelar'),
                  ),
                if (!isEditing)
                  ElevatedButton(
                    onPressed: enableEditing,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                    ),
                    child: Text('Modificar Horario'),
                  ),
                if (isEditing)
                  ElevatedButton(
                    onPressed: () async {
                      final editedTutorSchedule = TutorUserSchedule(
                        id: widget.tutorSchedule.id,
                        day: dayController.text,
                        modality: modalityController.text,
                        capacity: int.parse(capacityController.text),
                        begin: beginController.text,
                        end: endController.text,
                        tutorUser: widget.tutorSchedule.tutorUser,
                      );

                      // Crear un objeto PatchedTutorUserScheduleRequest utilizando los valores editados
                      final patchedRequest = PatchedTutorUserScheduleRequest(
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
                        // La solicitud PATCH se realizó con éxito
                        print(
                            "API Response Status Code: ${postResult.statusCode}");
                        // Puedes realizar otras acciones o mostrar un mensaje de éxito aquí
                      } else {
                        // Error en la solicitud PATCH
                        print(
                            "Error en la solicitud PATCH: ${postResult.error}");
                        // Puedes mostrar un mensaje de error o manejar la situación de error aquí
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    ),
                    child: Text('Guardar Cambios'),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
