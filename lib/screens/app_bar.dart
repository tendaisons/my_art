import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_art/screens/add-patient.dart';

// Define constants
const double ffem = 1.0;
const double fem = 1.0;
const Color primaryColor = Color(0xff303e9f);
const Color whiteColor = Color(0xffffffff);
const Color textColor = Color(0xff24284d);

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: whiteColor,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.menu, color: primaryColor),
                Text(
                  'Dr TATENDA ALEXIO',
                  style: TextStyle(
                    fontSize: 32 * ffem,
                    fontWeight: FontWeight.w500,
                    height: 1.5 * ffem / fem,
                    letterSpacing: -1.92 * fem,
                    color: textColor,
                  ),
                ),
                SizedBox(width: 32 * fem), // To balance the leading icon
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildButton(
                    '+ADD PATIENT', () => Get.to(() => const AddPatient())),
                _buildButton('+ADD TREATMENT', () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String text, VoidCallback onPressed) {
    return Container(
      width: 232 * fem,
      height: 63 * fem,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24 * fem),
        color: primaryColor,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24 * fem),
          ),
          backgroundColor: primaryColor,
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 20 * ffem,
              fontWeight: FontWeight.w500,
              height: 1.5 * ffem / fem,
              letterSpacing: -1.2 * fem,
              color: whiteColor,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
