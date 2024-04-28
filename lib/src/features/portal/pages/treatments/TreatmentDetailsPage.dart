import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:my_art/screens/add_treatment.dart';
import 'package:my_art/screens/schedule_screen.dart';
import 'package:my_art/src/constants/colors.dart';
import 'package:my_art/src/features/portal/pages/patients/widgets/AddMedication.dart';
import 'package:my_art/widgets/upcoming_schedule.dart';

import '../../../../../screens/edit-patient.dart';
import '../../../../common_widgets/math.dart';
import '../../../../constants/dimensions.dart';
import '../../../../constants/sizes.dart';
import '../reporting/generate_report.dart';

class TreatmentDetailsPage extends StatefulWidget {
  final item;

  const TreatmentDetailsPage({super.key, this.item});

  @override
  State<TreatmentDetailsPage> createState() => _TreatmentDetailsPageState();
}

class _TreatmentDetailsPageState extends State<TreatmentDetailsPage> {
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    print(widget.item);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Treatment Details'),
          actions: [
            IconButton(
              icon: Icon(LineAwesomeIcons.user_edit),
              onPressed: () {
                Get.to(() => EditPatient(item: widget.item));
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Card(
              clipBehavior: Clip.antiAlias,
              elevation: 0,
              margin: const EdgeInsets.symmetric(),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(
                getHorizontalSize(16),
              ))),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(widget.item.fullname,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: Theme.of(context).textTheme.displaySmall),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                LineAwesomeIcons.map_marker,
                                color: tSecondaryColor,
                                size: 20,
                              ),
                              const SizedBox(width: 5),
                              Text(widget.item.city + " " + widget.item.country,
                                  maxLines: null,
                                  textAlign: TextAlign.left,
                                  style: TextTheme().bodyLarge),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Treatment Details',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text("Examination: " + widget.item.examination,
                              style: TextTheme().bodyMedium),
                          const SizedBox(height: 10),
                          Text(
                              "amountofmedication: ${widget.item.amountofmedication}",
                              style: Theme.of(context).textTheme.bodyMedium),
                          const SizedBox(height: 10),
                          Text("medicationtype: ${widget.item.medicationtype}",
                              style: Theme.of(context).textTheme.bodyMedium),
                          const SizedBox(height: 10),
                          const Text(
                            'Patient Notes',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                          Text("${widget.item.note}",
                              style: Theme.of(context).textTheme.bodyMedium),
                          const SizedBox(height: 10),
                          const Text(
                            'Patient Alleges',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                          Text("${widget.item.allergies}",
                              style: Theme.of(context).textTheme.bodyMedium),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Material(
          elevation: 20,
          child: SizedBox(
            height: Dimensions.height100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
                  width: Dimensions.width60 * 6.5,
                  height: Dimensions.width60,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all<double>(0),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          builder: (context) => Container(
                              padding: const EdgeInsets.all(tDefaultSize),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Choose an Action",
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall),
                                  const SizedBox(height: 5),
                                  Text(
                                      "Please use any of the following Methods to add medications and or book an appointment with the patient.",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium),
                                  const SizedBox(height: 30.0),
                                  AddMedicationsWidget(
                                    onTap: () {
                                      //Navigator.pop(context);
                                      Get.to(() => const AddMed());
                                    },
                                    title: "Add Medications",
                                    subTitle: "Add Patient Medications",
                                    btnIcon: LineAwesomeIcons.medical_briefcase,
                                  ),
                                  const SizedBox(height: 20.0),
                                  AddMedicationsWidget(
                                    onTap: () {
                                      Get.to(() => ScheduleScreen());
                                    },
                                    title: "Book an Appointment",
                                    subTitle:
                                        "Book an Appointment for the Patient",
                                    btnIcon: LineAwesomeIcons.people_carry,
                                  ),
                                  const SizedBox(height: 20.0),
                                  AddMedicationsWidget(
                                      title: "Report",
                                      subTitle: "Generate a Report for Patient",
                                      btnIcon: LineAwesomeIcons.pdf_file,
                                      onTap: ()
                                          // Navigator.pop(context);
                                          async {
                                        setState(() {
                                          isLoading = true;
                                        });
                                        bool result =
                                            await createReport(widget.item);
                                        setState(() {
                                          isLoading = false;
                                        });
                                        // print(result);

                                        if (result) {
                                          Get.showSnackbar(const GetSnackBar(
                                            title: 'Report Generated',
                                            message:
                                                'The Patient Report has been generated and saved to Downloads folder',
                                            duration: Duration(seconds: 3),
                                            snackPosition: SnackPosition.BOTTOM,
                                            backgroundColor: Colors.green,
                                            margin: EdgeInsets.all(8),
                                            borderRadius: 8,
                                            icon: Icon(
                                                Icons.check_circle_outline),
                                          ));
                                          Navigator.pop(context);
                                        } else {
                                          Get.showSnackbar(const GetSnackBar(
                                            title: 'Error',
                                            message:
                                                'An error occured while generating the report',
                                            duration: Duration(seconds: 3),
                                            snackPosition: SnackPosition.BOTTOM,
                                            backgroundColor: Colors.red,
                                            margin: EdgeInsets.all(8),
                                            borderRadius: 8,
                                            icon: Icon(Icons.error_outline),
                                          ));
                                        }
                                      }),
                                  isLoading
                                      ? const Expanded(
                                          flex: 1,
                                          child: Center(
                                              child:
                                                  CircularProgressIndicator()))
                                      : const Spacer(
                                          flex: 1,
                                        )
                                ],
                              )));
                    },
                    child: const Text(
                      'Actions',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
