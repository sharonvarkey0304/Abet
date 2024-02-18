import 'package:cloud_firestore/cloud_firestore.dart';

class Usermodel {
  final String? id;
  final String name;
  final String email;
  final String password;
  final String phone;

  const Usermodel({
    this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.phone,
  });
  toJson() {
    return {
      "Name": name,
      "Email": email,
      "Password": password,
      "Phone": phone,
      "uuid": id,
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
        phone: data["Phone"]);
  }
}
