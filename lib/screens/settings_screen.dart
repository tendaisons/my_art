import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_art/src/repositories/authentication_repository/authentication_repository.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Settings",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 30),
          const ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage("assets/images/dpe.png"),
            ),
            title: Text(
              "Dear Programmer",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 25,
              ),
            ),
            subtitle: Text("Profile"),
          ),
          const Divider(height: 50),
          ListTile(
            onTap: () {},
            leading: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                CupertinoIcons.person,
                color: Colors.blue,
                size: 35,
              ),
            ),
            title: const Text(
              "Profile",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          ),
          const SizedBox(height: 20),
          ListTile(
            onTap: () {},
            leading: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade100,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.notifications_none_outlined,
                color: Colors.deepPurple,
                size: 35,
              ),
            ),
            title: const Text(
              "Notifications",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          ),
          const SizedBox(height: 20),
          ListTile(
            onTap: () {},
            leading: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.indigo.shade100,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.privacy_tip_outlined,
                color: Colors.indigo,
                size: 35,
              ),
            ),
            title: const Text(
              "Privacy",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          ),
          const SizedBox(height: 20),
          ListTile(
            onTap: () {},
            leading: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xff303e9f),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.settings_suggest_outlined,
                color: Color.fromARGB(255, 221, 224, 246),
                size: 35,
              ),
            ),
            title: const Text(
              "General",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          ),
          const SizedBox(height: 20),
          ListTile(
            onTap: () {},
            leading: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.orange.shade100,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.info_outline_rounded,
                color: Colors.orange,
                size: 35,
              ),
            ),
            title: const Text(
              "About Us",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          ),
          const Divider(height: 40),
          ListTile(
            onTap: () {
              // Log out
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
            leading: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.redAccent.shade100,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.info_outline_rounded,
                color: Colors.redAccent,
                size: 35,
              ),
            ),
            title: const Text(
              "Log Out",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
