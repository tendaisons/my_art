import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../../constants/text_strings.dart';
import '../../../../../repositories/authentication_repository/authentication_repository.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
        children: <Widget>[
          ListTile(
            contentPadding: EdgeInsets.all(0),
            title: Text('$tAppName',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            subtitle: Text(tAppDescription),
          ),
          const SizedBox(height: 20),
          ListTile(
            leading: const Icon(LineAwesomeIcons.home),
            title: const Text('Home'),
            onTap: () => Get.back(),
          ),
          ListTile(
              leading: const Icon(LineAwesomeIcons.user),
              title: const Text('Profile'),
              onTap: () {
                Get.back();
                // Get.to(() => const ProfileScreen());
              }),
          ListTile(
            leading: const Icon(LineAwesomeIcons.book),
            title: const Text('Farming Tips'),
            onTap: () {
              Get.back();
              //Get.to(() => const FarmingTips());
            },
          ),
          ListTile(
            leading: const Icon(LineAwesomeIcons.cog),
            title: const Text('Settings'),
            onTap: () {
              Get.back();
              //Get.to(() => const Settings());
            },
          ),
          ListTile(
              leading: const Icon(LineAwesomeIcons.info_circle),
              title: const Text('About'),
              onTap: () {
                Get.back();
                //Get.to(() => const AppInfo());
              }),
          ListTile(
            leading: const Icon(LineAwesomeIcons.readme),
            title: const Text('Records'),
            onTap: () {
              Get.back();
              //Get.to(() => const ViewAll());

            },
          ),
          ListTile(
            leading: const Icon(LineAwesomeIcons.power_off),
            title: const Text('Logout'),
            onTap: () {
              Get.back();
              Get.defaultDialog(
                title: "Logout",
                titleStyle: const TextStyle(fontSize: 20),
                content: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  child: Text("Are you sure, you want to logout?"),
                ),
                confirm: ElevatedButton(
                  onPressed: () => AuthenticationRepository.instance.logout(),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent, side: BorderSide.none),
                  child: const Text('Yes'),
                ),
                cancel: OutlinedButton(
                    onPressed: () => Get.back(), child: const Text("No")),
              );
            },
          ),
        ],
      ),
    );
  }
}
