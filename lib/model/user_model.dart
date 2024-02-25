import 'package:cloud_firestore/cloud_firestore.dart';

class Usermodel {
  final String? id;
  final String name;
  final String email;
  final String password;
  final String phone;
  final String course;
  final String? userImage;

  const Usermodel({
    this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.phone,
    required this.course,
    this.userImage,
  });
  toJson() {
    return {
      "Name": name,
      "Email": email,
      "Password": password,
      "Phone": phone,
      "uuid": id,
      "course": course,
      "userImage":userImage,
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
        userImage: data["userImage"],
        phone: data["Phone"]);
  }
}
