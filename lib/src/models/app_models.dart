import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? uid;
  final String fullname;
  final String email;
  final String phoneNo;
  final String location;
  final String dateofbirth;
  String? createdAt = DateTime.now().toString().substring(0, 10);

  UserModel({
    this.uid,
    required this.fullname,
    required this.email,
    required this.phoneNo,
    required this.location,
    required this.dateofbirth,
    //  required String profileImage,
    this.createdAt,
  });

  toJson() {
    return {
      'Fullname': fullname,
      'Email': email,
      'PhoneNo': phoneNo,
      'Location': location,
      'DateofBirth': dateofbirth,
      'CreatedAt': createdAt,
    };
  }
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
      uid: document.id,
      fullname: data["Fullname"], 
      email: data["Email"], 
      phoneNo: data["PhoneNo"], 
      location: data["Location"],
      dateofbirth: data["DateofBirth"],
      createdAt: data["CreatedAt"],
      );
  }
}