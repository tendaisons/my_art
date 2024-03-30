class Patient {

  int id;
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
  String covidVaccination;
  String diabetes;
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
    required this.covidVaccination,
    required this.diabetes,
    required this.note,
    required this.allergies,
    this.createdAt,
    this.updatedAt,
})

  toJson() {

  }

}