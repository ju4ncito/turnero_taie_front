import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sign_in_button/sign_in_button.dart';

void main() {
  runApp(MaterialApp(
    title: "Turnero TAIE",
    theme: ThemeData(primaryColor: Colors.blue),
    home: const HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser != null) {
        // Authentication successful, navigate to the next page.
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MainTutorPage(tutorName: 'Juan'),
          ),
        );
      }
    } catch (error) {
      // Handle sign-in error.
      print('Sign-in with Google failed: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(10.0),
              width: 130,
              height: 130,
              child: IconButton(
                icon: Image.network(
                  'https://www2.ucc.edu.ar/archivos/imagenes/Institucional/IDENTIDAD_VISUAL_2018/SIGLA_UCC.png',
                ),
                onPressed: () {},
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              width: 500,
              child: Center(
                child: Text(
                  'Turnero TAIE',
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                      color: Color(0xFF37364A),
                      fontSize: 38,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            Container(
              margin: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text(
                    'Iniciar sesión',
                    style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                        color: Color(0xFF37364A),
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SignInButton(
                    Buttons.google,
                    onPressed: () => signInWithGoogle(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MainTutorPage extends StatelessWidget {
  final String tutorName;

  const MainTutorPage({required this.tutorName, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Tutor Page'),
      ),
      body: Center(
        child: Text('Welcome, $tutorName!'),
      ),
    );
  }
}
