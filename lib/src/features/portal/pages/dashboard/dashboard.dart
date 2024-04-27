import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_art/screens/add_treatment.dart';
import 'package:my_art/src/features/portal/controllers/ProfileController.dart';
import 'package:my_art/src/features/portal/controllers/patient_controller.dart';
import 'package:my_art/src/features/portal/pages/dashboard/widgets/drawer.dart';
import 'package:my_art/screens/add-patient.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../../../utils.dart';

class DashboardXScreen extends StatefulWidget {
  const DashboardXScreen({super.key});

  @override
  State<DashboardXScreen> createState() => _DashboardXScreenState();
}

class PatientData {
  final String type;
  final int count;
  final Color color;

  PatientData(this.type, this.count, this.color);
}

class MedicationData {
  final String type;
  final int count;
  final Color color;

  MedicationData(this.type, this.count, this.color);
}

List<PatientData> _createPatientData(int todayPatient, int totalPatient) {
  final int newPatients = todayPatient; // Define newPatients
  final int oldPatients = totalPatient; // Define oldPatients

  final data = [
    PatientData('New', newPatients, const Color(0xff33d48e)),
    PatientData('Old', oldPatients, const Color(0xff64ace6)),
  ];

  return data;
}

List<MedicationData> _createMedicationData() {
  final int pendingMedication = getPendingCount(); // Define newPatients
  final int completedMedication = getCompletedCount(); // Define oldPatients

  final data = [
    MedicationData('Pending', pendingMedication, const Color(0xff33d48e)),
    MedicationData('Completed', completedMedication, const Color(0xff64ace6)),
  ];

  return data;
}

int getNewPatientsCount() {
  // Replace this with your actual implementation
  return 10;
}

int getOldPatientsCount() {
  // Replace this with your actual implementation
  return 20;
}

int getPendingCount() {
  // Replace this with your actual implementation
  return 60;
}

int getCompletedCount() {
  // Replace this with your actual implementation
  return 20;
}

class _DashboardXScreenState extends State<DashboardXScreen> {
  String greetings() {
    final hour = TimeOfDay.now().hour;
    if (hour < 12) {
      return 'Morning';
    } else if (hour < 17) {
      return 'Afternoon';
    }
    return 'Evening';
  }

  final controller = Get.put(PatientController());
  final profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    double baseWidth = 540;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      appBar: AppBar(
        title: Obx(() {
          return RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.headline6,
              children: [
                TextSpan(
                  text: 'Hey, Good ${greetings()} 👋\n',
                  style: TextStyle(fontSize: 12),
                ),
                TextSpan(
                  text:
                      'Doctor ${profileController.userData.value?.fullname ?? ""}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ],
            ),
          );
        }),
      ),
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                FutureBuilder<int>(
                  future: controller.getPatientsAddedToday(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasData) {
                      return Padding(
                        padding: const EdgeInsets.all(16),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Patients Added Today',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall,
                                      ),
                                    ],
                                  ),
                                  Text(
                                    snapshot.data.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Center(child: Text(snapshot.error.toString()));
                    } else {
                      return const Center(child: Text('Something went wrong'));
                    }
                  },
                ),

                //   Total Patients
                FutureBuilder<int>(
                  future: controller.getPatientCount(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasData) {
                      return Padding(
                        padding: const EdgeInsets.all(16),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Total Patients',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall,
                                      ),
                                    ],
                                  ),
                                  Text(
                                    snapshot.data.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Center(child: Text(snapshot.error.toString()));
                    } else {
                      return const Center(child: Text('Something went wrong'));
                    }
                  },
                ),

                //   Listview with patients
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Material(
                      color: const Color(0xff303e9f),
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        onTap: () {
                          Get.to(() => const AddPatient());
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 40),
                          child: const Text(
                            "+ Patient",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Material(
                      color: const Color(0xff303e9f),
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        onTap: () {
                          //Get.to(() => const AddMed());
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 40),
                          child: const Text(
                            "+ Treatment",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // test start
                FutureBuilder(
                  future: Future.wait([
                    controller.getPatientsAddedToday(),
                    controller.getPatientCount(),
                  ]),
                  builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Center(child: CircularProgressIndicator())
                        ],
                      );
                    } else if (snapshot.hasData) {
                      var total_patients_today = snapshot.data?[0].toString();
                      var total_patients = snapshot.data?[1].toString();
                      return SizedBox(
                        width: double.infinity,
                        child: Container(
                            // dashGHu (29:61)
                            width: double.infinity,
                            height: 1109 * fem,
                            child: Stack(children: [
                              SizedBox(
                                  width: double.infinity,
                                  child: Container(
                                      // dashGHu (29:61)
                                      width: double.infinity,
                                      height: 1109 * fem,
                                      child: Stack(children: [
                                        Positioned(
                                          // rectangle1Fp3 (13:2)
                                          left: 0 * fem,
                                          top: 0 * fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 540 * fem,
                                              height: 1108 * fem,
                                              child: Container(
                                                decoration: const BoxDecoration(
                                                  color: Color(0xfff2f6ff),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),

                                        // Patient Background

                                        Positioned(
                                          // rectangle4rST (13:6)
                                          left: 32 * fem,
                                          top: 231 * fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 228 * fem,
                                              height: 330 * fem,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24 * fem),
                                                  color:
                                                      const Color(0xffffffff),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),

                                        // Medication Background
                                        Positioned(
                                          // rectangle13wio (14:91)
                                          left: 281 * fem,
                                          top: 231 * fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 228 * fem,
                                              height: 330 * fem,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24 * fem),
                                                  color:
                                                      const Color(0xffffffff),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),

                                        //Treatment Background
                                        Positioned(
                                          // rectangle6qZH (13:8)
                                          left: 32 * fem,
                                          top: 578 * fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 476 * fem,
                                              height: 462 * fem,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24 * fem),
                                                  color:
                                                      const Color(0xffffffff),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: const Color(
                                                          0x3f000000),
                                                      offset: Offset(
                                                          0 * fem, 4 * fem),
                                                      blurRadius: 2 * fem,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),

                                        // Patient
                                        Positioned(
                                          // patientWvK (13:24)
                                          left: 79 * fem,
                                          top: 261 * fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 71 * fem,
                                              height: 30 * fem,
                                              child: Text(
                                                'Patients',
                                                style: SafeGoogleFont(
                                                  'Poppins',
                                                  fontSize: 20 * ffem,
                                                  fontWeight: FontWeight.w500,
                                                  height: 1.5 * ffem / fem,
                                                  color:
                                                      const Color(0xff4b57a8),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),

                                        // Treatment
                                        Positioned(
                                          // treatmentMg3 (14:101)
                                          left: 79 * fem,
                                          top: 613 * fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 106 * fem,
                                              height: 30 * fem,
                                              child: Text(
                                                'Treatment',
                                                style: SafeGoogleFont(
                                                  'Poppins',
                                                  fontSize: 20 * ffem,
                                                  fontWeight: FontWeight.w500,
                                                  height: 1.5 * ffem / fem,
                                                  color:
                                                      const Color(0xff4b57a8),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),

                                        // Medication
                                        Positioned(
                                          // medicationmzf (14:85)
                                          left: 328 * fem,
                                          top: 261 * fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 113 * fem,
                                              height: 30 * fem,
                                              child: Text(
                                                'Medication',
                                                style: SafeGoogleFont(
                                                  'Poppins',
                                                  fontSize: 20 * ffem,
                                                  fontWeight: FontWeight.w500,
                                                  height: 1.5 * ffem / fem,
                                                  color:
                                                      const Color(0xff4b57a8),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),

                                        Positioned(
                                          left: 85 * fem,
                                          top: 162 * fem,
                                          child: GestureDetector(
                                            onTap: () {
                                              // Add your button tap functionality here
                                              // For example, you can navigate to a new screen
                                              // or perform any action you desire
                                            },
                                          ),
                                        ),
                                        // New -> Patient
                                        Positioned(
                                          // newoK5 (13:34)
                                          left: 86 * fem,
                                          top: 483 * fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 35 * fem,
                                              height: 24 * fem,
                                              child: Text(
                                                'New',
                                                style: SafeGoogleFont(
                                                  'Poppins',
                                                  fontSize: 16 * ffem,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.5 * ffem / fem,
                                                  color:
                                                      const Color(0xff24284d),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),

                                        // Pending -> Medication
                                        Positioned(
                                          // pendingf6P (14:86)
                                          left: 335 * fem,
                                          top: 483 * fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 66 * fem,
                                              height: 24 * fem,
                                              child: Text(
                                                'Pending',
                                                style: SafeGoogleFont(
                                                  'Poppins',
                                                  fontSize: 16 * ffem,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.5 * ffem / fem,
                                                  color:
                                                      const Color(0xff24284d),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          // ZhZ (13:36)
                                          left: 227 * fem,
                                          top: 483 * fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 6 * fem,
                                              height: 24 * fem,
                                              child: Text(
                                                total_patients_today!,
                                                style: SafeGoogleFont(
                                                  'Poppins',
                                                  fontSize: 16 * ffem,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.5 * ffem / fem,
                                                  color:
                                                      const Color(0xff24284d),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),

                                        Positioned(
                                          // UJj (14:87)
                                          left: 471 * fem,
                                          top: 483 * fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 11 * fem,
                                              height: 24 * fem,
                                              child: Text(
                                                '1 hee',
                                                style: SafeGoogleFont(
                                                  'Poppins',
                                                  fontSize: 16 * ffem,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.5 * ffem / fem,
                                                  color:
                                                      const Color(0xff24284d),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          // totalPRh (13:35)
                                          left: 86 * fem,
                                          top: 508 * fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 40 * fem,
                                              height: 24 * fem,
                                              child: Text(
                                                'Total',
                                                style: SafeGoogleFont(
                                                  'Poppins',
                                                  fontSize: 16 * ffem,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.5 * ffem / fem,
                                                  color:
                                                      const Color(0xff24284d),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          // completedraB (14:88)
                                          left: 335 * fem,
                                          top: 508 * fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 91 * fem,
                                              height: 24 * fem,
                                              child: Text(
                                                'Completed',
                                                style: SafeGoogleFont(
                                                  'Poppins',
                                                  fontSize: 16 * ffem,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.5 * ffem / fem,
                                                  color:
                                                      const Color(0xff24284d),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          // 9JP (13:37)
                                          left: 227 * fem,
                                          top: 508 * fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 6 * fem,
                                              height: 24 * fem,
                                              child: Text(
                                                total_patients!,
                                                style: SafeGoogleFont(
                                                  'Poppins',
                                                  fontSize: 16 * ffem,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.5 * ffem / fem,
                                                  color:
                                                      const Color(0xff24284d),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          // f1q (14:89)
                                          left: 471 * fem,
                                          top: 508 * fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 11 * fem,
                                              height: 24 * fem,
                                              child: Text(
                                                '0',
                                                style: SafeGoogleFont(
                                                  'Poppins',
                                                  fontSize: 16 * ffem,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.5 * ffem / fem,
                                                  color:
                                                      const Color(0xff24284d),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),

                                        Positioned(
                                          // addtreatmentTTV (13:27)
                                          left: 312 * fem,
                                          top: 162 * fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 159 * fem,
                                              height: 30 * fem,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          // rectangle8uaP (13:11)
                                          left: 59 * fem,
                                          top: 611 * fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 8 * fem,
                                              height: 34 * fem,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24 * fem),
                                                  color:
                                                      const Color(0xff303e9f),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          // rectangle9yKM (13:13)
                                          left: 59 * fem,
                                          top: 259 * fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 8 * fem,
                                              height: 34 * fem,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24 * fem),
                                                  color:
                                                      const Color(0xff303e9f),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          // rectangle14Haw (14:92)
                                          left: 308 * fem,
                                          top: 259 * fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 8 * fem,
                                              height: 34 * fem,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24 * fem),
                                                  color:
                                                      const Color(0xff303e9f),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        //
                                        Positioned(
                                          // rectangle104VD (13:16)
                                          left: 59 * fem,
                                          top: 488 * fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 15 * fem,
                                              height: 15 * fem,
                                              child: Container(
                                                decoration: const BoxDecoration(
                                                  color: Color(0xff33d48e),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          // rectangle15k79 (14:93)
                                          left: 308 * fem,
                                          top: 488 * fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 15 * fem,
                                              height: 15 * fem,
                                              child: Container(
                                                decoration: const BoxDecoration(
                                                  color: Color(0xff33d48e),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          // rectangle11eiK (13:17)
                                          left: 59 * fem,
                                          top: 513 * fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 15 * fem,
                                              height: 15 * fem,
                                              child: Container(
                                                decoration: const BoxDecoration(
                                                  color: Color(0xff64ace6),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          // rectangle16NeK (14:94)
                                          left: 308 * fem,
                                          top: 513 * fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 15 * fem,
                                              height: 15 * fem,
                                              child: Container(
                                                decoration: const BoxDecoration(
                                                  color: Color(0xff64ace6),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 100 * fem,
                                          top: 342 * fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 92 * fem,
                                              height: 92 * fem,
                                              child: SfCircularChart(
                                                series: <CircularSeries>[
                                                  DoughnutSeries<PatientData,
                                                      String>(
                                                    dataSource: _createPatientData(
                                                        int.parse(
                                                            total_patients_today),
                                                        int.parse(
                                                            total_patients)),
                                                    pointColorMapper:
                                                        (PatientData data, _) =>
                                                            data.color,
                                                    xValueMapper:
                                                        (PatientData data, _) =>
                                                            data.type,
                                                    yValueMapper:
                                                        (PatientData data, _) =>
                                                            data.count,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 349 * fem,
                                          top: 342 * fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 92 * fem,
                                              height: 92 * fem,
                                              child: SfCircularChart(
                                                series: <CircularSeries>[
                                                  DoughnutSeries<MedicationData,
                                                      String>(
                                                    dataSource:
                                                        _createMedicationData(),
                                                    pointColorMapper:
                                                        (MedicationData data,
                                                                _) =>
                                                            data.color,
                                                    xValueMapper:
                                                        (MedicationData data,
                                                                _) =>
                                                            data.type,
                                                    yValueMapper:
                                                        (MedicationData data,
                                                                _) =>
                                                            data.count,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          // group1unf (13:23)
                                          left: 221 * fem,
                                          top: 263 * fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 7 * fem,
                                              height: 27 * fem,
                                              child: Image.asset(
                                                'assets/dashboard/images/group-1.png',
                                                width: 7 * fem,
                                                height: 27 * fem,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          // group3RW7 (14:96)
                                          left: 470 * fem,
                                          top: 263 * fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 7 * fem,
                                              height: 27 * fem,
                                              child: Image.asset(
                                                'assets/dashboard/images/group-3.png',
                                                width: 7 * fem,
                                                height: 27 * fem,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          // group27tj (13:30)
                                          left: 465 * fem,
                                          top: 615 * fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 7 * fem,
                                              height: 27 * fem,
                                              child: Image.asset(
                                                'assets/dashboard/images/group-2.png',
                                                width: 7 * fem,
                                                height: 27 * fem,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ])))
                            ])),
                      );
                    } else if (snapshot.hasError) {
                      return Center(child: Text(snapshot.error.toString()));
                    } else {
                      return const Center(child: Text('Something went wrong'));
                    }
                  },
                ),

                // test end
//                 SizedBox(
//                   width: double.infinity,
//                   child: Container(
//                       // dashGHu (29:61)
//                       width: double.infinity,
//                       height: 1109 * fem,
//                       child: Stack(children: [
//                         SizedBox(
//                             width: double.infinity,
//                             child: Container(
//                                 // dashGHu (29:61)
//                                 width: double.infinity,
//                                 height: 1109 * fem,
//                                 child: Stack(children: [
//                                   Positioned(
//                                     // rectangle1Fp3 (13:2)
//                                     left: 0 * fem,
//                                     top: 0 * fem,
//                                     child: Align(
//                                       child: SizedBox(
//                                         width: 540 * fem,
//                                         height: 1108 * fem,
//                                         child: Container(
//                                           decoration: const BoxDecoration(
//                                             color: Color(0xfff2f6ff),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),

//                                   // Patient Background

//                                   Positioned(
//                                     // rectangle4rST (13:6)
//                                     left: 32 * fem,
//                                     top: 231 * fem,
//                                     child: Align(
//                                       child: SizedBox(
//                                         width: 228 * fem,
//                                         height: 330 * fem,
//                                         child: Container(
//                                           decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(24 * fem),
//                                             color: const Color(0xffffffff),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),

//                                   // Medication Background
//                                   Positioned(
//                                     // rectangle13wio (14:91)
//                                     left: 281 * fem,
//                                     top: 231 * fem,
//                                     child: Align(
//                                       child: SizedBox(
//                                         width: 228 * fem,
//                                         height: 330 * fem,
//                                         child: Container(
//                                           decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(24 * fem),
//                                             color: const Color(0xffffffff),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),

//                                   //Treatment Background
//                                   Positioned(
//                                     // rectangle6qZH (13:8)
//                                     left: 32 * fem,
//                                     top: 578 * fem,
//                                     child: Align(
//                                       child: SizedBox(
//                                         width: 476 * fem,
//                                         height: 462 * fem,
//                                         child: Container(
//                                           decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(24 * fem),
//                                             color: const Color(0xffffffff),
//                                             boxShadow: [
//                                               BoxShadow(
//                                                 color: const Color(0x3f000000),
//                                                 offset:
//                                                     Offset(0 * fem, 4 * fem),
//                                                 blurRadius: 2 * fem,
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),

//                                   // Patient
//                                   Positioned(
//                                     // patientWvK (13:24)
//                                     left: 79 * fem,
//                                     top: 261 * fem,
//                                     child: Align(
//                                       child: SizedBox(
//                                         width: 71 * fem,
//                                         height: 30 * fem,
//                                         child: Text(
//                                           'Patients',
//                                           style: SafeGoogleFont(
//                                             'Poppins',
//                                             fontSize: 20 * ffem,
//                                             fontWeight: FontWeight.w500,
//                                             height: 1.5 * ffem / fem,
//                                             color: const Color(0xff4b57a8),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),

//                                   // Treatment
//                                   Positioned(
//                                     // treatmentMg3 (14:101)
//                                     left: 79 * fem,
//                                     top: 613 * fem,
//                                     child: Align(
//                                       child: SizedBox(
//                                         width: 106 * fem,
//                                         height: 30 * fem,
//                                         child: Text(
//                                           'Treatment',
//                                           style: SafeGoogleFont(
//                                             'Poppins',
//                                             fontSize: 20 * ffem,
//                                             fontWeight: FontWeight.w500,
//                                             height: 1.5 * ffem / fem,
//                                             color: const Color(0xff4b57a8),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),

//                                   // Medication
//                                   Positioned(
//                                     // medicationmzf (14:85)
//                                     left: 328 * fem,
//                                     top: 261 * fem,
//                                     child: Align(
//                                       child: SizedBox(
//                                         width: 113 * fem,
//                                         height: 30 * fem,
//                                         child: Text(
//                                           'Medication',
//                                           style: SafeGoogleFont(
//                                             'Poppins',
//                                             fontSize: 20 * ffem,
//                                             fontWeight: FontWeight.w500,
//                                             height: 1.5 * ffem / fem,
//                                             color: const Color(0xff4b57a8),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),

//                                   Positioned(
//                                     left: 85 * fem,
//                                     top: 162 * fem,
//                                     child: GestureDetector(
//                                       onTap: () {
//                                         // Add your button tap functionality here
//                                         // For example, you can navigate to a new screen
//                                         // or perform any action you desire
//                                       },
//                                     ),
//                                   ),
//                                   // New -> Patient
//                                   Positioned(
//                                     // newoK5 (13:34)
//                                     left: 86 * fem,
//                                     top: 483 * fem,
//                                     child: Align(
//                                       child: SizedBox(
//                                         width: 35 * fem,
//                                         height: 24 * fem,
//                                         child: Text(
//                                           'New',
//                                           style: SafeGoogleFont(
//                                             'Poppins',
//                                             fontSize: 16 * ffem,
//                                             fontWeight: FontWeight.w400,
//                                             height: 1.5 * ffem / fem,
//                                             color: const Color(0xff24284d),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),

//                                   // Pending -> Medication
//                                   Positioned(
//                                     // pendingf6P (14:86)
//                                     left: 335 * fem,
//                                     top: 483 * fem,
//                                     child: Align(
//                                       child: SizedBox(
//                                         width: 66 * fem,
//                                         height: 24 * fem,
//                                         child: Text(
//                                           'Pending',
//                                           style: SafeGoogleFont(
//                                             'Poppins',
//                                             fontSize: 16 * ffem,
//                                             fontWeight: FontWeight.w400,
//                                             height: 1.5 * ffem / fem,
//                                             color: const Color(0xff24284d),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
// // new test code here

// // ends here
//                                   Positioned(
//                                     // ZhZ (13:36)
//                                     left: 227 * fem,
//                                     top: 483 * fem,
//                                     child: Align(
//                                       child: SizedBox(
//                                         width: 6 * fem,
//                                         height: 24 * fem,
//                                         child: Text(
//                                           // snapshot.data.toString(),
//                                           '100',
//                                           style: SafeGoogleFont(
//                                             'Poppins',
//                                             fontSize: 16 * ffem,
//                                             fontWeight: FontWeight.w400,
//                                             height: 1.5 * ffem / fem,
//                                             color: const Color(0xff24284d),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),

//                                   Positioned(
//                                     // UJj (14:87)
//                                     left: 471 * fem,
//                                     top: 483 * fem,
//                                     child: Align(
//                                       child: SizedBox(
//                                         width: 11 * fem,
//                                         height: 24 * fem,
//                                         child: Text(
//                                           '0 hee',
//                                           style: SafeGoogleFont(
//                                             'Poppins',
//                                             fontSize: 16 * ffem,
//                                             fontWeight: FontWeight.w400,
//                                             height: 1.5 * ffem / fem,
//                                             color: const Color(0xff24284d),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   Positioned(
//                                     // totalPRh (13:35)
//                                     left: 86 * fem,
//                                     top: 508 * fem,
//                                     child: Align(
//                                       child: SizedBox(
//                                         width: 40 * fem,
//                                         height: 24 * fem,
//                                         child: Text(
//                                           'Total',
//                                           style: SafeGoogleFont(
//                                             'Poppins',
//                                             fontSize: 16 * ffem,
//                                             fontWeight: FontWeight.w400,
//                                             height: 1.5 * ffem / fem,
//                                             color: const Color(0xff24284d),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   Positioned(
//                                     // completedraB (14:88)
//                                     left: 335 * fem,
//                                     top: 508 * fem,
//                                     child: Align(
//                                       child: SizedBox(
//                                         width: 91 * fem,
//                                         height: 24 * fem,
//                                         child: Text(
//                                           'Completed',
//                                           style: SafeGoogleFont(
//                                             'Poppins',
//                                             fontSize: 16 * ffem,
//                                             fontWeight: FontWeight.w400,
//                                             height: 1.5 * ffem / fem,
//                                             color: const Color(0xff24284d),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   Positioned(
//                                     // 9JP (13:37)
//                                     left: 227 * fem,
//                                     top: 508 * fem,
//                                     child: Align(
//                                       child: SizedBox(
//                                         width: 6 * fem,
//                                         height: 24 * fem,
//                                         child: Text(
//                                           '1',
//                                           style: SafeGoogleFont(
//                                             'Poppins',
//                                             fontSize: 16 * ffem,
//                                             fontWeight: FontWeight.w400,
//                                             height: 1.5 * ffem / fem,
//                                             color: const Color(0xff24284d),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   Positioned(
//                                     // f1q (14:89)
//                                     left: 471 * fem,
//                                     top: 508 * fem,
//                                     child: Align(
//                                       child: SizedBox(
//                                         width: 11 * fem,
//                                         height: 24 * fem,
//                                         child: Text(
//                                           '0',
//                                           style: SafeGoogleFont(
//                                             'Poppins',
//                                             fontSize: 16 * ffem,
//                                             fontWeight: FontWeight.w400,
//                                             height: 1.5 * ffem / fem,
//                                             color: const Color(0xff24284d),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),

//                                   Positioned(
//                                     // addtreatmentTTV (13:27)
//                                     left: 312 * fem,
//                                     top: 162 * fem,
//                                     child: Align(
//                                       child: SizedBox(
//                                         width: 159 * fem,
//                                         height: 30 * fem,
//                                       ),
//                                     ),
//                                   ),
//                                   Positioned(
//                                     // rectangle8uaP (13:11)
//                                     left: 59 * fem,
//                                     top: 611 * fem,
//                                     child: Align(
//                                       child: SizedBox(
//                                         width: 8 * fem,
//                                         height: 34 * fem,
//                                         child: Container(
//                                           decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(24 * fem),
//                                             color: const Color(0xff303e9f),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   Positioned(
//                                     // rectangle9yKM (13:13)
//                                     left: 59 * fem,
//                                     top: 259 * fem,
//                                     child: Align(
//                                       child: SizedBox(
//                                         width: 8 * fem,
//                                         height: 34 * fem,
//                                         child: Container(
//                                           decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(24 * fem),
//                                             color: const Color(0xff303e9f),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   Positioned(
//                                     // rectangle14Haw (14:92)
//                                     left: 308 * fem,
//                                     top: 259 * fem,
//                                     child: Align(
//                                       child: SizedBox(
//                                         width: 8 * fem,
//                                         height: 34 * fem,
//                                         child: Container(
//                                           decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(24 * fem),
//                                             color: const Color(0xff303e9f),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   //
//                                   Positioned(
//                                     // rectangle104VD (13:16)
//                                     left: 59 * fem,
//                                     top: 488 * fem,
//                                     child: Align(
//                                       child: SizedBox(
//                                         width: 15 * fem,
//                                         height: 15 * fem,
//                                         child: Container(
//                                           decoration: const BoxDecoration(
//                                             color: Color(0xff33d48e),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   Positioned(
//                                     // rectangle15k79 (14:93)
//                                     left: 308 * fem,
//                                     top: 488 * fem,
//                                     child: Align(
//                                       child: SizedBox(
//                                         width: 15 * fem,
//                                         height: 15 * fem,
//                                         child: Container(
//                                           decoration: const BoxDecoration(
//                                             color: Color(0xff33d48e),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   Positioned(
//                                     // rectangle11eiK (13:17)
//                                     left: 59 * fem,
//                                     top: 513 * fem,
//                                     child: Align(
//                                       child: SizedBox(
//                                         width: 15 * fem,
//                                         height: 15 * fem,
//                                         child: Container(
//                                           decoration: const BoxDecoration(
//                                             color: Color(0xff64ace6),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   Positioned(
//                                     // rectangle16NeK (14:94)
//                                     left: 308 * fem,
//                                     top: 513 * fem,
//                                     child: Align(
//                                       child: SizedBox(
//                                         width: 15 * fem,
//                                         height: 15 * fem,
//                                         child: Container(
//                                           decoration: const BoxDecoration(
//                                             color: Color(0xff64ace6),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   Positioned(
//                                     left: 100 * fem,
//                                     top: 342 * fem,
//                                     child: Align(
//                                       child: SizedBox(
//                                         width: 92 * fem,
//                                         height: 92 * fem,
//                                         child: SfCircularChart(
//                                           series: <CircularSeries>[
//                                             DoughnutSeries<PatientData, String>(
//                                               dataSource: _createPatientData(),
//                                               pointColorMapper:
//                                                   (PatientData data, _) =>
//                                                       data.color,
//                                               xValueMapper:
//                                                   (PatientData data, _) =>
//                                                       data.type,
//                                               yValueMapper:
//                                                   (PatientData data, _) =>
//                                                       data.count,
//                                             )
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   Positioned(
//                                     left: 349 * fem,
//                                     top: 342 * fem,
//                                     child: Align(
//                                       child: SizedBox(
//                                         width: 92 * fem,
//                                         height: 92 * fem,
//                                         child: SfCircularChart(
//                                           series: <CircularSeries>[
//                                             DoughnutSeries<MedicationData,
//                                                 String>(
//                                               dataSource:
//                                                   _createMedicationData(),
//                                               pointColorMapper:
//                                                   (MedicationData data, _) =>
//                                                       data.color,
//                                               xValueMapper:
//                                                   (MedicationData data, _) =>
//                                                       data.type,
//                                               yValueMapper:
//                                                   (MedicationData data, _) =>
//                                                       data.count,
//                                             )
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   Positioned(
//                                     // group1unf (13:23)
//                                     left: 221 * fem,
//                                     top: 263 * fem,
//                                     child: Align(
//                                       child: SizedBox(
//                                         width: 7 * fem,
//                                         height: 27 * fem,
//                                         child: Image.asset(
//                                           'assets/dashboard/images/group-1.png',
//                                           width: 7 * fem,
//                                           height: 27 * fem,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   Positioned(
//                                     // group3RW7 (14:96)
//                                     left: 470 * fem,
//                                     top: 263 * fem,
//                                     child: Align(
//                                       child: SizedBox(
//                                         width: 7 * fem,
//                                         height: 27 * fem,
//                                         child: Image.asset(
//                                           'assets/dashboard/images/group-3.png',
//                                           width: 7 * fem,
//                                           height: 27 * fem,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   Positioned(
//                                     // group27tj (13:30)
//                                     left: 465 * fem,
//                                     top: 615 * fem,
//                                     child: Align(
//                                       child: SizedBox(
//                                         width: 7 * fem,
//                                         height: 27 * fem,
//                                         child: Image.asset(
//                                           'assets/dashboard/images/group-2.png',
//                                           width: 7 * fem,
//                                           height: 27 * fem,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ])))
//                       ])),
//                 ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
