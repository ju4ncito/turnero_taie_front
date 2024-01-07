import 'package:flutter/material.dart';

class StudentsSettingsPage extends StatefulWidget {
  @override
  _StudentsSettingsPageState createState() => _StudentsSettingsPageState();
}

class _StudentsSettingsPageState extends State<StudentsSettingsPage> {
  bool receiveNotifications = true;
  int selectedThemeIndex = 0;
  List<String> themes = ['Claro', 'Oscuro', 'Predeterminado del sistema'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
        backgroundColor: const Color.fromARGB(255, 19, 45, 88),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Notificaciones',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SwitchListTile(
              title: Text('Recibir notificaciones'),
              value: receiveNotifications,
              onChanged: (value) {
                setState(() {
                  receiveNotifications = value;
                });
              },
            ),
            SizedBox(height: 16),
            Text(
              'Configuración de Tema',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            DropdownButton<int>(
              value: selectedThemeIndex,
              onChanged: (value) {
                setState(() {
                  selectedThemeIndex = value!;
                });
              },
              items: List.generate(
                themes.length,
                (index) => DropdownMenuItem<int>(
                  value: index,
                  child: Text(themes[index]),
                ),
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 5 / 7,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      // Your action when the button is pressed
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 19, 45, 88)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9),
                        ),
                      ),
                      elevation: MaterialStateProperty.all(4),
                    ),
                    child: const Text(
                      'Guardar cambios',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
