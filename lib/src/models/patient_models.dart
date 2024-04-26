import 'package:cloud_firestore/cloud_firestore.dart';

class Patient {
  String id;
  String oiartnumber;
  String fullname;
  String phoneNo;
  String email;
  String age;
  String gender;
  String address;
  String country;
  String province;
  String city;
  String? covidVaccination;
  String? diabetes;
  String note;
  String allergies;
  String? createdAt = DateTime.now().toString().substring(0, 10);
  String? updatedAt = DateTime.now().toString().substring(0, 10);

  Patient({
    required this.id,
    required this.oiartnumber,
    required this.fullname,
    required this.phoneNo,
    required this.email,
    required this.age,
    required this.gender,
    required this.address,
    required this.country,
    required this.province,
    required this.city,
    this.covidVaccination,
    this.diabetes,
    required this.note,
    required this.allergies,
    this.createdAt,
    this.updatedAt,
  });

  toJson() {
    return {
      'id': id,
      'oiartnumber': oiartnumber,
      'name': fullname,
      'phone number': phoneNo,
      'email': email,
      'age': age,
      'gender': gender,
      'address': address,
      'country': country,
      'province': province,
      'city': city,
      'note': note,
      'diabetes': diabetes,
      'covidVaccination': covidVaccination,
      'allergies': allergies,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory Patient.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return Patient(
      id: document.id,
      oiartnumber: data["oiartnumber"],
      fullname: data["name"],
      phoneNo: data["phone number"],
      email: data["email"],
      age: data["age"],
      gender: data['gender'],
      address: data['address'],
      country: data['country'],
      province: data['province'],
      city: data['city'],
      note: data['note'],
      diabetes: data['diabetes'],
      covidVaccination: data['covidVaccination'],
      allergies: data['allergies'],
      createdAt: data['createdAt'],
      updatedAt: data['updatedAt'],
    );
  }
}
