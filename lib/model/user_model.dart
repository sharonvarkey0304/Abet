import 'package:cloud_firestore/cloud_firestore.dart';

class Usermodel {
  final String? id;
  final String name;
  final String email;
  final String password;
  final String phone;
  final String course;

  const Usermodel({
    this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.phone,
    required this.course,
  });
  toJson() {
    return {
      "Name": name,
      "Email": email,
      "Password": password,
      "Phone": phone,
      "uuid": id,
      "course": course,
    };
  }

  factory Usermodel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return Usermodel(
        id: document.id,
        email: data["Email"],
        password: data["Password"],
        name: data["Name"],
        course: data["course"],
        phone: data["Phone"]);
  }
}
