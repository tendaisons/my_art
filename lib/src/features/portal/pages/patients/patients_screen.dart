import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:my_art/src/features/portal/controllers/patient_controller.dart';
import 'package:my_art/src/features/portal/pages/patients/widgets/ListItemWidget.dart';
import 'package:my_art/src/models/patient_models.dart';

import '../../../../common_widgets/math.dart';

class PatientsScreen extends StatefulWidget {
  const PatientsScreen({super.key});

  @override
  State<PatientsScreen> createState() => _PatientsScreenState();
}

class _PatientsScreenState extends State<PatientsScreen> {
  final controller = Get.put(PatientController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patients'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              FutureBuilder<List<Patient>>(
                  future: controller.getAllPatients(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(
                            top: getVerticalSize(
                              230,
                            ),
                          ),
                          child: const Center(child: CircularProgressIndicator()));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Column(
                        children: [
                          SizedBox(height: 200,),
                          Icon(LineAwesomeIcons.alternate_file,
                              size: 100
                          ),
                          Center(child: Text('No Patients found!')),
                        ],
                      );
                    } else
                      //if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        // itemsList.length,
                        itemBuilder: (context, index) {
                          // get data from snapshot
                          final item = snapshot.data![index];

                          return ListItemWidget(item);
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Center(child: Text(snapshot.error.toString()));
                    } else {
                      return const Center(child: Text('Something went wrong'));
                    }
                  })
            ],
          ),
        ),
      )
      );
  }
}
