import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:my_art/utils.dart';

class Scene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 540;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
        backgroundColor: Colors.amber,
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text('Your App Title'),
          // Add any additional app bar configuration here
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Container(
              // dashGHu (29:61)
              width: double.infinity,
              height: 1109 * fem,
              child: Stack(
                children: [
                  // Positioned(
                  //   // rectangle1Fp3 (13:2)
                  //   left: 0 * fem,
                  //   top: 0 * fem,
                  //   child: Align(
                  //     child: SizedBox(
                  //       width: 540 * fem,
                  //       height: 1108 * fem,
                  //       child: Container(
                  //         decoration: BoxDecoration(
                  //           color: Color(0xfff2f6ff),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   // rectangle28cw (13:3)
                  //   left: 32 * fem,
                  //   top: 145 * fem,
                  //   child: Align(
                  //     child: SizedBox(
                  //       width: 232 * fem,
                  //       height: 63 * fem,
                  //       child: Container(
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(24 * fem),
                  //           color: Color(0xff303e9f),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   // rectangle3zf9 (13:5)
                  //   left: 276 * fem,
                  //   top: 145 * fem,
                  //   child: Align(
                  //     child: SizedBox(
                  //       width: 232 * fem,
                  //       height: 63 * fem,
                  //       child: Container(
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(24 * fem),
                  //           color: Color(0xff303e9f),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   // rectangle4rST (13:6)
                  //   left: 32 * fem,
                  //   top: 231 * fem,
                  //   child: Align(
                  //     child: SizedBox(
                  //       width: 228 * fem,
                  //       height: 330 * fem,
                  //       child: Container(
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(24 * fem),
                  //           color: Color(0xffffffff),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   // rectangle13wio (14:91)
                  //   left: 281 * fem,
                  //   top: 231 * fem,
                  //   child: Align(
                  //     child: SizedBox(
                  //       width: 228 * fem,
                  //       height: 330 * fem,
                  //       child: Container(
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(24 * fem),
                  //           color: Color(0xffffffff),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   // rectangle6qZH (13:8)
                  //   left: 32 * fem,
                  //   top: 578 * fem,
                  //   child: Align(
                  //     child: SizedBox(
                  //       width: 476 * fem,
                  //       height: 462 * fem,
                  //       child: Container(
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(24 * fem),
                  //           color: Color(0xffffffff),
                  //           boxShadow: [
                  //             BoxShadow(
                  //               color: Color(0x3f000000),
                  //               offset: Offset(0 * fem, 4 * fem),
                  //               blurRadius: 2 * fem,
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Positioned(
                    // patientWvK (13:24)
                    left: 79 * fem,
                    top: 261 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 71 * fem,
                        height: 30 * fem,
                        child: Text(
                          'Patient',
                          style: SafeGoogleFont(
                            'Poppins',
                            fontSize: 20 * ffem,
                            fontWeight: FontWeight.w500,
                            height: 1.5 * ffem / fem,
                            color: Color(0xff4b57a8),
                          ),
                        ),
                      ),
                    ),
                  ),
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
                            color: Color(0xff4b57a8),
                          ),
                        ),
                      ),
                    ),
                  ),
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
                            color: Color(0xff4b57a8),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // addpatientGAj (13:25)
                    left: 85 * fem,
                    top: 162 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 126 * fem,
                        height: 30 * fem,
                        child: ElevatedButton(
                          onPressed: () {
                            // Add your button click logic here
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xff303e9f), // Button color
                            onPrimary: Colors.white, // Text color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  24 * fem), // Button border radius
                            ),
                          ),
                          child: Text(
                            '+ADD PATIENT',
                            style: SafeGoogleFont(
                              'Poppins',
                              fontSize: 20 * ffem,
                              fontWeight: FontWeight.w500,
                              height: 1.5 * ffem / fem,
                              letterSpacing: -1.2 * fem,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // hellow1y (13:29)
                    left: 32 * fem,
                    top: 37 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 51 * fem,
                        height: 33 * fem,
                        child: Text(
                          'Hello',
                          style: SafeGoogleFont(
                            'Poppins',
                            fontSize: 22 * ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.5 * ffem / fem,
                            letterSpacing: -0.66 * fem,
                            color: Color(0xff24284d),
                          ),
                        ),
                      ),
                    ),
                  ),
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
                            color: Color(0xff24284d),
                          ),
                        ),
                      ),
                    ),
                  ),
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
                            color: Color(0xff24284d),
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
                          '1',
                          style: SafeGoogleFont(
                            'Poppins',
                            fontSize: 16 * ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.5 * ffem / fem,
                            color: Color(0xff24284d),
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
                          '0',
                          style: SafeGoogleFont(
                            'Poppins',
                            fontSize: 16 * ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.5 * ffem / fem,
                            color: Color(0xff24284d),
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
                            color: Color(0xff24284d),
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
                            color: Color(0xff24284d),
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
                          '1',
                          style: SafeGoogleFont(
                            'Poppins',
                            fontSize: 16 * ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.5 * ffem / fem,
                            color: Color(0xff24284d),
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
                            color: Color(0xff24284d),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // drtatendaalexiomKm (13:28)
                    left: 32 * fem,
                    top: 66 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 277 * fem,
                        height: 48 * fem,
                        child: Text(
                          'Dr TATENDA ALEXIO ',
                          style: SafeGoogleFont(
                            'Poppins',
                            fontSize: 32 * ffem,
                            fontWeight: FontWeight.w500,
                            height: 1.5 * ffem / fem,
                            letterSpacing: -1.92 * fem,
                            color: Color(0xff24284d),
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
                        child: Text(
                          '+ADD TREATMENT',
                          style: SafeGoogleFont(
                            'Poppins',
                            fontSize: 20 * ffem,
                            fontWeight: FontWeight.w500,
                            height: 1.5 * ffem / fem,
                            letterSpacing: -1.2 * fem,
                            color: Color(0xffffffff),
                          ),
                        ),
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
                            borderRadius: BorderRadius.circular(24 * fem),
                            color: Color(0xff303e9f),
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
                            borderRadius: BorderRadius.circular(24 * fem),
                            color: Color(0xff303e9f),
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
                            borderRadius: BorderRadius.circular(24 * fem),
                            color: Color(0xff303e9f),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // rectangle7nnb (13:10)
                    left: 0 * fem,
                    top: 1023 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 540 * fem,
                        height: 86 * fem,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xffffffff),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x3f000000),
                                offset: Offset(0 * fem, 4 * fem),
                                blurRadius: 2 * fem,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // rectangle104VD (13:16)
                    left: 59 * fem,
                    top: 488 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 15 * fem,
                        height: 15 * fem,
                        child: Container(
                          decoration: BoxDecoration(
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
                          decoration: BoxDecoration(
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
                          decoration: BoxDecoration(
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
                          decoration: BoxDecoration(
                            color: Color(0xff64ace6),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // ellipse1iCP (13:19)
                    left: 100 * fem,
                    top: 342 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 92 * fem,
                        height: 92 * fem,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(46 * fem),
                            border: Border.all(color: Color(0xff33d48e)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // ellipse2cHm (14:95)
                    left: 349 * fem,
                    top: 342 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 92 * fem,
                        height: 92 * fem,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(46 * fem),
                            border: Border.all(color: Color(0xff33d48e)),
                          ),
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
                  Positioned(
                    // group8cqV (21:35)
                    left: 25 * fem,
                    top: 1031 * fem,
                    child: Container(
                      width: 48 * fem,
                      height: 52 * fem,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // vectoriNj (16:107)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 6 * fem, 5 * fem),
                            width: 24 * fem,
                            height: 27 * fem,
                            child: Image.asset(
                              'assets/dashboard/images/vector.png',
                              width: 24 * fem,
                              height: 27 * fem,
                            ),
                          ),
                          Text(
                            // treatmentiJB (20:23)
                            'Treatment',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont(
                              'Poppins',
                              fontSize: 14 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.5 * ffem / fem,
                              color: Color(0xff96a2b8),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    // group5fUK (20:27)
                    left: 330 * fem,
                    top: 1031 * fem,
                    child: Container(
                      width: 46 * fem,
                      height: 53 * fem,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // iconnewspaperoaX (20:17)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 0 * fem, 6 * fem),
                            width: 24 * fem,
                            height: 26 * fem,
                            child: Image.asset(
                              'assets/dashboard/images/icon-newspaper.png',
                              width: 24 * fem,
                              height: 26 * fem,
                            ),
                          ),
                          Text(
                            // reporthvo (20:24)
                            'Report',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont(
                              'Poppins',
                              fontSize: 14 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.5 * ffem / fem,
                              color: Color(0xff96a2b8),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    // group4rHu (20:26)
                    left: 419 * fem,
                    top: 1032 * fem,
                    child: Container(
                      width: 92 * fem,
                      height: 52 * fem,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // iconcalendarC6s (20:20)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 0 * fem, 4 * fem),
                            width: 24 * fem,
                            height: 27 * fem,
                            child: Image.asset(
                              'assets/dashboard/images/icon-calendar.png',
                              width: 24 * fem,
                              height: 27 * fem,
                            ),
                          ),
                          Text(
                            // appointmenthJX (20:25)
                            'Appointment',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont(
                              'Poppins',
                              fontSize: 14 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.5 * ffem / fem,
                              color: Color(0xff96a2b8),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    // group9SX1 (21:50)
                    left: 420 * fem,
                    top: 35 * fem,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(
                          18 * fem, 19 * fem, 17.85 * fem, 20 * fem),
                      width: 80 * fem,
                      height: 80 * fem,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffffffff)),
                        color: Color(0xffe7ecff),
                        borderRadius: BorderRadius.circular(40 * fem),
                      ),
                      child: Center(
                        // iconuser7d9 (21:44)
                        child: SizedBox(
                          width: 44.15 * fem,
                          height: 41 * fem,
                          child: Image.asset(
                            'assets/dashboard/images/icon-user.png',
                            width: 44.15 * fem,
                            height: 41 * fem,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // group10QcF (21:57)
                    left: 207 * fem,
                    top: 758 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 126 * fem,
                        height: 126 * fem,
                        child: Image.asset(
                          'assets/dashboard/images/group-10.png',
                          width: 126 * fem,
                          height: 126 * fem,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
