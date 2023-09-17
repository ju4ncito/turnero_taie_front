import 'package:flutter/material.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:turnero_taie_front/api/api_manager.dart';
import 'package:turnero_taie_front/pages/login.dart';
import 'package:turnero_taie_front/pages/student_main.dart';
import 'tutor_main.dart';
import 'package:turnero_taie_front/swagger_generated_code/api_model.swagger.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> signInWithGoogle() async {
      try {
        final googleSignIn = GoogleSignIn();
        final account = await googleSignIn.signIn();

        if (account != null &&
            context.mounted &&
            (account.email.substring(account.email.length - 10) ==
                'ucc.edu.ar')) {
          final apiManager = ApiManager();
          final postresult = await apiManager.apiModel.apiUsersIsUserPost(
              body: EmailLookUpRequest(email: account.email));

          print(postresult.statusCode);

          final currentUser =
              await apiManager.apiModel.apiUsersIdGet(id: postresult.body!.id);

          if (postresult.statusCode == 200) {
            if (postresult.body?.roles != null &&
                postresult.body!.roles.contains("TUTOR")) {
              if (context.mounted) {
                // push replacement para no poder scrollear para atras
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return TutorPage(
                        currentUser: currentUser.body,
                      );
                    },
                  ),
                );
              }
            } else {
              if (context.mounted) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return StudentPage(
                        currentUser: currentUser.body,
                      );
                    },
                  ),
                );
              }
            }
          } else if (postresult.statusCode == 404) {
            if (context.mounted) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return LoginPage(
                      currentUser: currentUser.body,
                    );
                  },
                ),
              );
            }
          }
        } else {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                    'Debe utilizar una cuenta institucional para utilizar la aplicacion.'),
                duration: Duration(seconds: 5),
              ),
            );
          }
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
                icon: Image.asset(
                  'assets/images/UCC_LOGO_WHITE.jpg',
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}