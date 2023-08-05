import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/homepage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Turnero TAIE",
      theme: ThemeData(
        fontFamily: GoogleFonts.lato().fontFamily,
        primarySwatch: Colors.indigo,
        primaryColor: const Color(0xFF243a6e),
      ),
      home: const HomePage(),
    );
  }
}
