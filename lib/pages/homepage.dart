import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:turnero_taie_front/pages/login_page.dart';
import 'tutor_page.dart';
import 'package:turnero_taie_front/swagger_generated_code/api_model.swagger.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> signInWithGoogle() async {
      try {
        final googleSignIn = GoogleSignIn();
        final account = await googleSignIn.signIn();
        print(account?.email.length);
        print(account?.email.substring(account.email.length - 10));
        if (account != null &&
            context.mounted &&
            (account.email.substring(account.email.length - 10) ==
                'ucc.edu.ar')) {
          print(account);

          final api_model =
              ApiModel.create(baseUrl: Uri.parse('http://127.0.0.1:8000'));
          // hacer singleton de la api
          final postresult = await api_model.apiUsersIsUserPost(
              body: EmailLookUpRequest(email: account.email));

          print(postresult.statusCode);

          // mandar el mail del account por el body
          // si devuelve 200 en el body esta toda la info, 404 se tiene q registrar y 400 no valido
          // agregar push a pagina de error de mail que permita volver atras

          if (postresult.statusCode == 200) {
            if (context.mounted) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return TutorPage(
                      userName: postresult.body?.name ?? '',
                      tutorId: postresult.body!.id,
                    );
                  },
                ),
              );
            }
          } else if (postresult.statusCode == 404) {
            if (context.mounted) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return LoginPage(
                      userName: account.displayName ?? '',
                      //   userName: firstName ?? '',
                      userEmail: account.email,
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
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage(
                                  userEmail: '',
                                  userName: '',
                                )),
                      );
                    },
                    child: const Text('Api Test'),
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
