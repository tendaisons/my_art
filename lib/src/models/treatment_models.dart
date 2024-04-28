import 'package:cloud_firestore/cloud_firestore.dart';

class Treatment {
  String id;
  String fullname;
  // String phoneNo;
  // String email;
  // String age;
  // String gender;
  // String address;
  // String country;
  // String province;
  // String city;
  // String? covidVaccination;
  String? medication_Type;
  String examination;
  String amountofMedication;
  String? createdAt = DateTime.now().toString().substring(0, 10);
  String? updatedAt = DateTime.now().toString().substring(0, 10);

  Treatment({
    required this.id,
    //required this.oiartnumber,
    required this.fullname,
    // required this.phoneNo,
    // required this.email,
    // required this.age,
    // required this.gender,
    // required this.address,
    // required this.country,
    // required this.province,
    // required this.city,
    // this.covidVaccination,
    this.medication_Type,
    required this.examination,
    required this.amountofMedication,
    this.createdAt,
    this.updatedAt,
  });

  toJson() {
    return {
      'id': id,
      // 'oiartnumber': oiartnumber,
      'name': fullname,
      // 'phone number': phoneNo,
      // 'email': email,
      // 'age': age,
      // 'gender': gender,
      // 'address': address,
      // 'country': country,
      // 'province': province,
      // 'city': city,
      // 'note': note,
      'medication_Type': medication_Type,
      'examination': examination,
      'amountofMedication': amountofMedication,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory Treatment.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return Treatment(
      id: document.id,
      fullname: data["name"],
      // phoneNo: data["phone number"],
      // email: data["email"],
      // age: data["age"],
      // gender: data['gender'],
      // address: data['address'],
      // country: data['country'],
      // province: data['province'],
      // city: data['city'],
      // note: data['note'],
      examination: data['examination'],
      medication_Type: data['medication_Type'],
      amountofMedication: data['amountofMedication'],
      createdAt: data['createdAt'],
      updatedAt: data['updatedAt'],
    );
  }
}
