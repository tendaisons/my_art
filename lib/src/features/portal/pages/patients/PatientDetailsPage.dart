import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:my_art/src/constants/colors.dart';
import 'package:my_art/src/features/portal/pages/patients/widgets/AddMedication.dart';

import '../../../../common_widgets/math.dart';
import '../../../../constants/dimensions.dart';
import '../../../../constants/sizes.dart';

class PatientDetailsPage extends StatefulWidget {
  final item;

  const PatientDetailsPage({super.key, this.item});

  @override
  State<PatientDetailsPage> createState() => _PatientDetailsPageState();
}

class _PatientDetailsPageState extends State<PatientDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Details'),
      ),
      body: Stack(
        children: [
          SizedBox(height: 30),
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
                            horizontal: 15, vertical: 15),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(widget.item.fullname,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style:
                                    Theme.of(context).textTheme.displaySmall),
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
                                Text(widget.item.phoneNo,
                                    maxLines: null,
                                    textAlign: TextAlign.left,
                                    style: TextTheme().bodyLarge),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Patient Details',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(widget.item.email,
                                style: TextTheme().bodyMedium),
                            const SizedBox(height: 8),
                            Text(
                              'Decription of Business Venture',
                              style: TextTheme().headlineMedium,
                            ),
                            const SizedBox(height: 8),
                            Text(widget.item.country,
                                maxLines: null,
                                textAlign: TextAlign.left,
                                style: const TextTheme().headlineMedium),
                            const SizedBox(height: 10),
                            Text(
                              'Financials',
                              style: TextTheme().headlineMedium,
                            ),
                            const SizedBox(height: 8),
                            Text("Amount Raised: ${widget.item.country}",
                                style: Theme.of(context).textTheme.bodyMedium),
                            Text("Goal: ${widget.item.city}",
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
                                style:
                                    Theme.of(context).textTheme.displaySmall),
                            const SizedBox(height: 5),
                            Text(
                                "Please use any of the following Methods to add medications and or book an appointment with the patient.",
                                style: Theme.of(context).textTheme.bodyMedium),
                            const SizedBox(height: 30.0),
                            AddMedicationsWidget(
                              onTap: () {
                                //Navigator.pop(context);
                                //Get.to(() => const ForgetPasswordMailScreen());
                              },
                              title: "Add Medications",
                              subTitle: "Add Patient Medications",
                              btnIcon: LineAwesomeIcons.medical_briefcase,
                            ),
                            const SizedBox(height: 20.0),
                            AddMedicationsWidget(
                              onTap: () {},
                              title: "Book an Appointment",
                              subTitle: "Book an Appointment with Patient",
                              btnIcon: LineAwesomeIcons.people_carry,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    'Actions',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
