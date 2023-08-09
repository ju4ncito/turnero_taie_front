import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../components/home_tutor.dart';
import '../components/calendar_tutor.dart';

void main() => runApp(MaterialApp(
    builder: (context, child) {
      return Directionality(textDirection: TextDirection.ltr, child: child!);
    },
    title: 'GNav',
    theme: ThemeData(
      primaryColor: Colors.grey[800],
    ),
    home: TutorPage(userName: 'John Doe', tutorId: 123)));

class TutorPage extends StatefulWidget {
  final String? userName;
  final tutorId;

  TutorPage({Key? key, required this.userName, required this.tutorId})
      : super(key: key);

  @override
  _TutorPageState createState() => _TutorPageState();
}

class _TutorPageState extends State<TutorPage> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    TutoriasListWidget(),
    CalendarWidget(),
    Text(
      'Busqueda',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
    ),
    Text(
      'Perfil',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.grey[900]),
        title: Text(
          'Bienvenido, ${widget.userName}',
          style: TextStyle(color: Colors.grey[900]),
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 6,
              activeColor: Theme.of(context).primaryColor,
              iconSize: 28,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              tabs: const [
                GButton(
                  icon: Icons.home_rounded,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.calendar_month_rounded,
                  text: 'Calendario',
                ),
                GButton(
                  icon: Icons.search_rounded,
                  text: 'Buscar',
                ),
                GButton(
                  icon: Icons.person_rounded,
                  text: 'Perfil',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
