import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../pages/landing.dart';
import '../pages/tutor_main.dart';
import '../storage/secure_storage.dart';
import '../swagger_generated_code/api_model.swagger.dart';

class StudentsSettingsPage extends StatefulWidget {
  final User? currentUser;
  final String? photoUrl;

  const StudentsSettingsPage(
      {Key? key, required this.currentUser, required this.photoUrl})
      : super(key: key);
  @override
  _StudentsSettingsPageState createState() => _StudentsSettingsPageState();
}

class _StudentsSettingsPageState extends State<StudentsSettingsPage> {
  bool receiveNotifications = true;
  int selectedThemeIndex = 0;
  List<String> themes = ['Claro', 'Oscuro', 'Predeterminado del sistema'];

  Future<void> signOutGoogle() async {
    try {
      final googleSignIn = GoogleSignIn();
      await googleSignIn.signOut();

      // Limpiar los tokens almacenados
      UserSecureStorage.clearAccessToken();
      UserSecureStorage.clearRefreshToken();

      print('Se ha cerrado la sesión correctamente');

      final newAccessToken = await UserSecureStorage.getField('accessToken');
      final newRefreshToken = await UserSecureStorage.getField('refreshToken');

      print('New access token: $newAccessToken');
      print('New refresh token: $newRefreshToken');

      if (context.mounted) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return const LandingPage();
            },
          ),
          (Route<dynamic> route) => false,
        );
      }
    } catch (e) {
      print('Error during sign out: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajustes'),
        backgroundColor: const Color.fromARGB(255, 19, 45, 88),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Notificaciones',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SwitchListTile(
              title: const Text('Recibir notificaciones'),
              value: receiveNotifications,
              onChanged: (value) {
                setState(() {
                  receiveNotifications = value;
                });
              },
            ),
            const SizedBox(height: 16),
            const Text(
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
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 5 / 7,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      await signOutGoogle();
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 102, 30, 30)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9),
                        ),
                      ),
                      elevation: MaterialStateProperty.all(4),
                    ),
                    child: const Text(
                      'Cerrar sesión',
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
            const SizedBox(
              height: 40,
            ),
            if (widget.currentUser!.roles != null &&
                widget.currentUser!.roles.contains('TUTOR'))
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 5 / 7,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (context.mounted) {
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return TutorPage(
                                  photoUrl: widget.photoUrl,
                                  currentUser: widget.currentUser,
                                );
                              },
                            ),
                            (Route<dynamic> route) => false,
                          );
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 19, 45, 88)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9),
                          ),
                        ),
                        elevation: MaterialStateProperty.all(4),
                      ),
                      child: const Text(
                        'Cambiar a vista de tutor',
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
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
