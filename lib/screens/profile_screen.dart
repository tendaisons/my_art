import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../src/constants/colors.dart';
import '../src/constants/sizes.dart';
import '../src/constants/text_strings.dart';
import '../src/features/portal/controllers/ProfileController.dart';
import '../src/models/app_models.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    final Color color = Theme.of(context).brightness == Brightness.light
        ? Colors.black
        : Colors.white;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
              color: color,
              onPressed: () => Get.back(),
              icon: const Icon(LineAwesomeIcons.angle_left)),
          title: Text(tProfile, style: Theme.of(context).textTheme.headlineMedium),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: FutureBuilder(
                future: controller.getUserData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      UserModel userData = snapshot.data as UserModel;

                      // Text Controllers
                      final id = TextEditingController(text: userData.uid);
                      final email = TextEditingController(text: userData.email);
                      final password =
                      TextEditingController(text: userData.location);
                      final fullname =
                      TextEditingController(text: userData.fullname);
                      final phoneNo =
                      TextEditingController(text: userData.phoneNo);
                      final createdAt =
                      TextEditingController(text: userData.createdAt);

                      final dateofbirth = TextEditingController(text: userData.dateofbirth);


                      return Column(children: [
                        Stack(
                          children: [
                            SizedBox(
                              width: 120,
                              height: 120,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: const Icon(LineAwesomeIcons.user, size: 100, color: tSecondaryColor,)
                            ),),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: tPrimaryColor),
                                child: GestureDetector(
                                  child: const Icon(
                                    LineAwesomeIcons.camera,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                  onTap: () {

                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 50),
                        TextFormField(
                          readOnly: true,
                          controller: fullname,
                          decoration: const InputDecoration(
                            hintText: tFullName,
                            prefixIcon: Icon(Icons.person_outline_rounded),
                          ),
                        ),
                        const SizedBox(
                          height: tFormHeight - 20,
                        ),
                        TextFormField(
                          readOnly: true,
                          controller: email,
                          decoration: const InputDecoration(
                            hintText: tEmail,
                            prefixIcon: Icon(Icons.email_outlined),
                          ),
                        ),
                        const SizedBox(
                          height: tFormHeight - 20,
                        ),
                        TextFormField(
                          readOnly: true,
                          controller: phoneNo,
                          decoration: const InputDecoration(
                              hintText: tPhoneNo,
                              prefixIcon: Icon(Icons.phone_android)),
                        ),
                        const SizedBox(
                          height: tFormHeight - 20,
                        ),
                        TextFormField(
                          readOnly: true,
                          controller: dateofbirth,
                          decoration: const InputDecoration(
                              hintText: tPassword,
                              prefixIcon: Icon(Icons.date_range)),
                        ),
                        const SizedBox(
                          height: tFormHeight,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text.rich(TextSpan(
                                text: tJoined,
                                style: const TextStyle(fontSize: 12),
                                children: [
                                  TextSpan(
                                      text: userData.createdAt,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12))
                                ])),
                            ElevatedButton(
                              style: (ElevatedButton.styleFrom(
                                  backgroundColor:
                                  Colors.redAccent.withOpacity(0.1),
                                  elevation: 0,
                                  foregroundColor: Colors.red,
                                  // shape: const StadiumBorder(),
                                  side: BorderSide.none)),
                              onPressed: () {},
                              child: const Text(tDelete),
                            )
                          ],
                        )
                      ]);
                    } else if (snapshot.hasError) {
                      return Center(child: Text(snapshot.error.toString()));
                    } else {
                      return const Center(child: Text('Something went wrong'));
                    }
                  } else {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(padding: const EdgeInsets.only(top: 300),
                              child: const CircularProgressIndicator(
                              )
                          )
                        ],
                      ),
                    );
                  }
                }),
          ),
        ),
      ),
    );
  }
}