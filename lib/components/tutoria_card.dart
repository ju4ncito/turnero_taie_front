import 'package:flutter/material.dart';

class Tutoria {
  final String name;
  final String description;

  Tutoria(this.name, this.description);
}

class TutoriaCard extends StatelessWidget {
  final Tutoria tutoria;
  const TutoriaCard({super.key, required this.tutoria});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: const Color.fromARGB(255, 63, 92, 143),
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    tutoria.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 18,
                  )
                ],
              ),
              subtitle: Text(
                tutoria.description,
                style: const TextStyle(
                  color: Color.fromARGB(255, 203, 225, 255),
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
              onTap: () {
                // Handle tutoria item tap
                print('Tutoria selected: ${tutoria.name}');
              },
            ),
            const Divider(
              height: 10,
              thickness: 0.5,
              indent: 35,
              endIndent: 35,
              color: Color.fromARGB(80, 255, 255, 255),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 8, right: 8, bottom: 12, top: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(
                    Icons.calendar_month_rounded,
                    color: Colors.white,
                    size: 21,
                  ),
                  Text(
                    'Martes 16 de Agosto',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.grey[100],
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(width: 30),
                  const Icon(
                    Icons.schedule,
                    color: Colors.white,
                    size: 21,
                  ),
                  Text(
                    '16:30 a 17:30',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.grey[100],
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
