import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:my_art/src/features/portal/pages/treatments/ListItemWidgetT.dart';
import 'package:my_art/src/models/treatment_models.dart';
import 'package:my_art/src/features/portal/controllers/treatment_controller.dart';
import '../../../../common_widgets/math.dart';

class TreatmentsScreen extends StatefulWidget {
  const TreatmentsScreen({super.key});

  @override
  State<TreatmentsScreen> createState() => _TreatmentsScreenState();
}

class _TreatmentsScreenState extends State<TreatmentsScreen> {
  final controller = Get.put(TreatmentController());
  final searchController = TextEditingController();
  late Future<List<Treatment>> futureTreatments;

  @override
  void initState() {
    super.initState();
    futureTreatments = controller.getAllTreatments();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Treatments'),
        actions: [
          IconButton(
            icon: Icon(LineAwesomeIcons.search),
            onPressed: () {
              setState(() {
                futureTreatments =
                    controller.searchTreatment(searchController.text);
              });
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search by name, city, or phone number',
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    searchController.clear();
                    setState(() {
                      futureTreatments = controller.getAllTreatments();
                    });
                  },
                ),
              ),
              onSubmitted: (value) {
                setState(() {
                  futureTreatments = controller.searchTreatment(value);
                });
              },
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              FutureBuilder<List<Treatment>>(
                future: futureTreatments, // Use the futurePatients variable
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: getVerticalSize(250)),
                      child: const Center(child: CircularProgressIndicator()),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Column(
                      children: [
                        SizedBox(height: 200),
                        Icon(LineAwesomeIcons.alternate_file, size: 100),
                        Center(child: Text('No Treatments found!')),
                      ],
                    );
                  } else if (snapshot.hasData) {
                    return ListView.builder(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final item = snapshot.data![index];
                        return ListItemWidgetT(item);
                      },
                    );
                  } else if (snapshot.hasError) {
                    print("PAAAAAANAPA ${snapshot.error}");
                    return Center(child: Text(snapshot.error.toString()));
                  } else {
                    return const Center(child: Text('Something went wrong'));
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
