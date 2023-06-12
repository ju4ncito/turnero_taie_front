// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  int id;
  String name;
  String lastName;
  int uccKey;
  String email;
  int academicYear;

  User({
    required this.id,
    required this.name,
    required this.lastName,
    required this.uccKey,
    required this.email,
    required this.academicYear,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        lastName: json["last_name"],
        uccKey: json["ucc_key"],
        email: json["email"],
        academicYear: json["academic_year"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "last_name": lastName,
        "ucc_key": uccKey,
        "email": email,
        "academic_year": academicYear,
      };
}
