import 'package:flutter/material.dart';
import 'package:turnero_taie_front/swagger_generated_code/api_model.swagger.dart';

class TutorDetailPage extends StatelessWidget {
  final User user;

  TutorDetailPage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tutor Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${user.name}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Email: ${user.email}'),
            SizedBox(height: 10),
            Text('UCC Key: ${user.uccKey}'),
            SizedBox(height: 10),
            Text('Academic Year: ${user.academicYear}'),
            SizedBox(height: 10),
            // Add more details as needed
          ],
        ),
      ),
    );
  }
}
