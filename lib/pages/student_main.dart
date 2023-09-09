import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:turnero_taie_front/components/search.dart';
import 'package:turnero_taie_front/pages/homepage.dart';
import '../components/home_student.dart';
import '../components/calendar_tutor.dart';
import 'package:turnero_taie_front/swagger_generated_code/api_model.swagger.dart';

class StudentPage extends StatefulWidget {
  final User? currentUser;

  const StudentPage({Key? key, required this.currentUser}) : super(key: key);

  @override
  _StudentPageState createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetOptions = <Widget>[
      HorariosAlumnosWidget(currentUser: widget.currentUser),
      TableEventsExample(),
      SearchPage(),
      const Text(
        'Perfil',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
      ),
    ];

    return Scaffold(
      appBar: _selectedIndex == 0 ? buildAppBar() : null,
      body: Center(
        child: widgetOptions.elementAt(_selectedIndex),
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

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.grey[50],
      elevation: 0,
      toolbarHeight: 90,
      iconTheme: IconThemeData(color: Colors.grey[900]),
      title: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bienvenido, ',
                  style: TextStyle(color: Colors.grey[700], fontSize: 16),
                ),
                Text(
                  widget.currentUser!.name,
                  style: TextStyle(
                      color: Colors.grey[900],
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
              icon: Image.asset(
                'assets/images/pfp_image_2.png',
              ),
              iconSize: 60,
              onPressed: () {
                if (context.mounted) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const HomePage();
                      },
                    ),
                  );
                }
              }),
        ),
      ],
    );
  }
}
