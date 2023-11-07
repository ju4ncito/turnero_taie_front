import 'package:flutter/material.dart';
import 'package:turnero_taie_front/swagger_generated_code/api_model.swagger.dart';

class TutorDetailPage extends StatelessWidget {
  final int id;

  TutorDetailPage({required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tutor Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(
            //   'Name: ${user.firstName}',
            //   style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            // ),
            // const SizedBox(height: 10),
            // Text('Email: ${user.email}'),
            // const SizedBox(height: 10),
            // Text('UCC Key: ${user.uccKey}'),
            // const SizedBox(height: 10),
            // Text('Academic Year: ${user.academicYear}'),
            // const SizedBox(height: 10),
            // // Add more details as needed
          ],
        ),
      ),
    );
  }
}
