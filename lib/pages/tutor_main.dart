import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:turnero_taie_front/components/report_tutor.dart';
import 'package:turnero_taie_front/components/settings_tutor.dart';
import 'package:turnero_taie_front/pages/landing.dart';
import 'package:turnero_taie_front/swagger_generated_code/api_model.swagger.dart';
import '../components/home_tutor.dart';
import '../components/calendar_tutor.dart';

class TutorPage extends StatefulWidget {
  final User? currentUser;
  final String? photoUrl;

  const TutorPage({Key? key, required this.currentUser, required this.photoUrl})
      : super(key: key);

  @override
  _TutorPageState createState() => _TutorPageState();
}

class _TutorPageState extends State<TutorPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetOptions = <Widget>[
      HorariosTutoresWidget(currentUser: widget.currentUser),
      const TableEventsExample(),
      TutorReportWidget(
        currentUser: widget.currentUser,
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
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
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
                  icon: Icons.rate_review_rounded,
                  text: 'Evaluar',
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
      shadowColor: const Color.fromARGB(60, 158, 158, 158),
      toolbarHeight: 90,
      iconTheme: IconThemeData(color: Colors.grey[900]),
      title: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hola, ',
                      style: TextStyle(color: Colors.grey[700], fontSize: 16),
                    ),
                    Text(
                      widget.currentUser?.firstName ?? '',
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
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon: widget.photoUrl != null
                ? ClipOval(
                    child: Image.network(
                      widget.photoUrl!,
                      width: 50,
                      height: 50,
                    ),
                  )
                : ClipOval(
                    child: Image.asset(
                      'assets/images/pfp_image.png',
                      width: 50,
                      height: 50,
                    ),
                  ),
            iconSize: 60,
            onPressed: () {
              if (context.mounted) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return TutorSettingsPage(
                        currentUser: widget.currentUser,
                        photoUrl: widget.photoUrl,
                      );
                    },
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
