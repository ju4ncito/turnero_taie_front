import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:turnero_taie_front/login_page.dart';
import 'tutor.dart';

void main() {
  WidgetsFlutterBinding
      .ensureInitialized(); //revisar esto, parece q iphone tiene q tener wifi

  runApp(MaterialApp(
    title: "Turnero TAIE",
    theme: ThemeData(
      fontFamily: GoogleFonts.lato().fontFamily,
      primarySwatch: Colors.indigo,
      primaryColor: const Color(0xFF243a6e),
    ),
    home: const HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> signInWithGoogle() async {
      try {
        final googleSignIn = GoogleSignIn();
        final account = await googleSignIn.signIn();
        if (account != null && context.mounted) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) {
                return TutorPage(userName: account.displayName ?? '');
              },
            ),
          );
        } else {
          // Google sign-in was canceled manejar error REVISAR
        }
      } catch (e) {
        // sign-in error
        print('Google sign-in error: $e');
      }
    }

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
                  style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 38,
                    fontWeight: FontWeight.w500,
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
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SignInButton(
                    Buttons.google,
                    onPressed: () async {
                      await signInWithGoogle();
                    },
                    text: '   Sign in with Google',
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Text('First Login'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
