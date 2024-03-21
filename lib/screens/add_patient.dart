import 'package:flutter/material.dart';
//import 'package:my_art/main.dart';
import 'package:my_art/utils.dart';

class AddPatient extends StatelessWidget {
  const AddPatient({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 498;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 235, 242, 255),
        title: Text(
          'Add Patient',
          style: SafeGoogleFont(
            'Poppins',
            fontSize: 21 * ffem,
            fontWeight: FontWeight.w600,
            height: 1.5 * ffem / fem,
            color: Color(0xff24284d),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Container(
            width: double.infinity,
            child: Container(
              // addpatientMzw (40:265)
              width: double.infinity,
              height: 1827 * fem,
              child: Container(
                // group17Wcw (40:264)
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xfff2f6ff),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // autogroup5uysSFh (KjiJiqmnHf7YMGL8Ce5uYs)
                      padding: EdgeInsets.fromLTRB(
                          14 * fem, 56 * fem, 28 * fem, 17 * fem),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // oiartnumberg3Z (40:232)
                            margin: EdgeInsets.fromLTRB(
                                14 * fem, 0 * fem, 0 * fem, 13 * fem),

                            child: Text(
                              'OI ART Number',
                              style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 20 * ffem,
                                fontWeight: FontWeight.w500,
                                height: 1.5 * ffem / fem,
                                color: Color(0xff24284d),
                              ),
                            ),
                          ),
                          Container(
                            // autogroupqcq7CGo (KjiFJwTY3MMacLLvjpqcQ7)
                            margin: EdgeInsets.fromLTRB(
                                13 * fem, 0 * fem, 0 * fem, 18 * fem),
                            padding: EdgeInsets.fromLTRB(
                                27 * fem, 16 * fem, 27 * fem, 23 * fem),
                            width: 443 * fem,
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xff96a2b8)),
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(24 * fem),
                            ),
                            child: Text(
                              'ART Number ',
                              style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 16 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.5 * ffem / fem,
                                color: Color(0xff96a2b8),
                              ),
                            ),
                          ),
                          Container(
                            // patientfullnamer6T (40:234)
                            margin: EdgeInsets.fromLTRB(
                                14 * fem, 0 * fem, 0 * fem, 10 * fem),
                            child: Text(
                              'Patient Full Name',
                              style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 20 * ffem,
                                fontWeight: FontWeight.w500,
                                height: 1.5 * ffem / fem,
                                color: Color(0xff24284d),
                              ),
                            ),
                          ),
                          Container(
                            // autogroupbtmdN4o (KjiFWgcy446qGYdRuYbtMd)
                            margin: EdgeInsets.fromLTRB(
                                13 * fem, 0 * fem, 0 * fem, 18 * fem),
                            padding: EdgeInsets.fromLTRB(
                                27 * fem, 18 * fem, 27 * fem, 21 * fem),
                            width: 443 * fem,
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xff96a2b8)),
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(24 * fem),
                            ),
                            child: Text(
                              'Full Name',
                              style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 16 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.5 * ffem / fem,
                                color: Color(0xff96a2b8),
                              ),
                            ),
                          ),
                          Container(
                            // contactnumberovo (40:235)
                            margin: EdgeInsets.fromLTRB(
                                14 * fem, 0 * fem, 0 * fem, 10 * fem),
                            child: Text(
                              'Contact Number',
                              style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 20 * ffem,
                                fontWeight: FontWeight.w500,
                                height: 1.5 * ffem / fem,
                                color: Color(0xff24284d),
                              ),
                            ),
                          ),
                          Container(
                            // autogroupzb5qiH5 (KjiFhBKUoscr2ZjYE6zB5q)
                            margin: EdgeInsets.fromLTRB(
                                13 * fem, 0 * fem, 0 * fem, 18 * fem),
                            padding: EdgeInsets.fromLTRB(
                                27 * fem, 17 * fem, 27 * fem, 22 * fem),
                            width: 443 * fem,
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xff96a2b8)),
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(24 * fem),
                            ),
                            child: Text(
                              'Contact Number',
                              style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 16 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.5 * ffem / fem,
                                color: Color(0xff96a2b8),
                              ),
                            ),
                          ),
                          Container(
                            // emailaddressNsR (40:236)
                            margin: EdgeInsets.fromLTRB(
                                14 * fem, 0 * fem, 0 * fem, 10 * fem),
                            child: Text(
                              'Email Address',
                              style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 20 * ffem,
                                fontWeight: FontWeight.w500,
                                height: 1.5 * ffem / fem,
                                color: Color(0xff24284d),
                              ),
                            ),
                          ),
                          Container(
                            // autogrouplsut6YX (KjiFrvYF1ZbiSsLDEmLsUT)
                            margin: EdgeInsets.fromLTRB(
                                13 * fem, 0 * fem, 0 * fem, 17 * fem),
                            padding: EdgeInsets.fromLTRB(
                                27 * fem, 17 * fem, 27 * fem, 22 * fem),
                            width: 443 * fem,
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xff96a2b8)),
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(24 * fem),
                            ),
                            child: Text(
                              'Email ',
                              style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 16 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.5 * ffem / fem,
                                color: Color(0xff96a2b8),
                              ),
                            ),
                          ),
                          Container(
                            // autogroup6iv5YQX (KjiG7VxHfsGBH7konz6iV5)
                            margin: EdgeInsets.fromLTRB(
                                14 * fem, 0 * fem, 143 * fem, 11 * fem),
                            width: double.infinity,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // agefV9 (40:237)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 184 * fem, 0 * fem),
                                  child: Text(
                                    'Age',
                                    style: SafeGoogleFont(
                                      'Poppins',
                                      fontSize: 20 * ffem,
                                      fontWeight: FontWeight.w500,
                                      height: 1.5 * ffem / fem,
                                      color: Color(0xff24284d),
                                    ),
                                  ),
                                ),
                                Text(
                                  // genderPg3 (40:244)
                                  'Gender',
                                  style: SafeGoogleFont(
                                    'Poppins',
                                    fontSize: 20 * ffem,
                                    fontWeight: FontWeight.w500,
                                    height: 1.5 * ffem / fem,
                                    color: Color(0xff24284d),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            // autogroupxcqfjzo (KjiGJfJMhMhenSRXVtxCQF)
                            margin: EdgeInsets.fromLTRB(
                                12 * fem, 0 * fem, 1 * fem, 7 * fem),
                            width: double.infinity,
                            height: 72 * fem,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  // autogroupi3qs5Hy (KjiGZEiQMfN7cgr847i3Qs)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 9 * fem, 9 * fem),
                                  padding: EdgeInsets.fromLTRB(
                                      28 * fem, 17 * fem, 28 * fem, 22 * fem),
                                  width: 217 * fem,
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Color(0xff96a2b8)),
                                    color: Color(0xffffffff),
                                    borderRadius:
                                        BorderRadius.circular(24 * fem),
                                  ),
                                  child: Text(
                                    'Age',
                                    style: SafeGoogleFont(
                                      'Poppins',
                                      fontSize: 16 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.5 * ffem / fem,
                                      color: Color(0xff96a2b8),
                                    ),
                                  ),
                                ),
                                Container(
                                  // autogroupxcyfYBZ (KjiGdEbjygtt6WDnNEXCYf)
                                  width: 217 * fem,
                                  height: double.infinity,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        // rectangle20VMh (39:208)
                                        left: 0 * fem,
                                        top: 0 * fem,
                                        child: Align(
                                          child: SizedBox(
                                            width: 217 * fem,
                                            height: 63 * fem,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        24 * fem),
                                                border: Border.all(
                                                    color: Color(0xff96a2b8)),
                                                color: Color(0xffffffff),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        // bQj (40:261)
                                        left: 165 * fem,
                                        top: 19 * fem,
                                        child: Align(
                                          child: SizedBox(
                                            width: 20 * fem,
                                            height: 53 * fem,
                                            child: Text(
                                              '<',
                                              style: SafeGoogleFont(
                                                'Poppins',
                                                fontSize: 35 * ffem,
                                                fontWeight: FontWeight.w400,
                                                height: 1.5 * ffem / fem,
                                                color: Color(0xff24284d),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        // genderWGo (39:224)
                                        left: 28 * fem,
                                        top: 17 * fem,
                                        child: Align(
                                          child: SizedBox(
                                            width: 60 * fem,
                                            height: 24 * fem,
                                            child: Text(
                                              'Gender',
                                              style: SafeGoogleFont(
                                                'Poppins',
                                                fontSize: 16 * ffem,
                                                fontWeight: FontWeight.w400,
                                                height: 1.5 * ffem / fem,
                                                color: Color(0xff96a2b8),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            // addresszhm (40:238)
                            margin: EdgeInsets.fromLTRB(
                                14 * fem, 0 * fem, 0 * fem, 13 * fem),
                            child: Text(
                              'Address',
                              style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 20 * ffem,
                                fontWeight: FontWeight.w500,
                                height: 1.5 * ffem / fem,
                                color: Color(0xff24284d),
                              ),
                            ),
                          ),
                          Container(
                            // autogrouphut5i7y (KjiGn9WZLnivagNC9THuT5)
                            margin: EdgeInsets.fromLTRB(
                                13 * fem, 0 * fem, 0 * fem, 14 * fem),
                            padding: EdgeInsets.fromLTRB(
                                27 * fem, 16 * fem, 27 * fem, 16 * fem),
                            width: 443 * fem,
                            height: 123 * fem,
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xff96a2b8)),
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(24 * fem),
                            ),
                            child: Text(
                              'Address',
                              style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 16 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.5 * ffem / fem,
                                color: Color(0xff96a2b8),
                              ),
                            ),
                          ),
                          Container(
                            // countryyJo (40:239)
                            margin: EdgeInsets.fromLTRB(
                                14 * fem, 0 * fem, 0 * fem, 13 * fem),
                            child: Text(
                              'Country',
                              style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 20 * ffem,
                                fontWeight: FontWeight.w500,
                                height: 1.5 * ffem / fem,
                                color: Color(0xff24284d),
                              ),
                            ),
                          ),
                          Container(
                            // autogroupkohz5Mq (KjiGx9DuPrYqnDoLvkKoHZ)
                            margin: EdgeInsets.fromLTRB(
                                13 * fem, 0 * fem, 0 * fem, 13 * fem),
                            padding: EdgeInsets.fromLTRB(
                                27 * fem, 19 * fem, 27 * fem, 20 * fem),
                            width: 443 * fem,
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xff96a2b8)),
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(24 * fem),
                            ),
                            child: Text(
                              'Zimbabwe',
                              style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 16 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.5 * ffem / fem,
                                color: Color(0xff96a2b8),
                              ),
                            ),
                          ),
                          Container(
                            // province8b1 (40:240)
                            margin: EdgeInsets.fromLTRB(
                                14 * fem, 0 * fem, 0 * fem, 12 * fem),
                            child: Text(
                              'Province',
                              style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 20 * ffem,
                                fontWeight: FontWeight.w500,
                                height: 1.5 * ffem / fem,
                                color: Color(0xff24284d),
                              ),
                            ),
                          ),
                          Container(
                            // autogroupe3soFQj (KjiHCoU9LcpzCtAmQWe3So)
                            margin: EdgeInsets.fromLTRB(
                                13 * fem, 0 * fem, 0 * fem, 14 * fem),
                            padding: EdgeInsets.fromLTRB(
                                27 * fem, 16 * fem, 27 * fem, 23 * fem),
                            width: 443 * fem,
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xff96a2b8)),
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(24 * fem),
                            ),
                            child: Text(
                              'Province',
                              style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 16 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.5 * ffem / fem,
                                color: Color(0xff96a2b8),
                              ),
                            ),
                          ),
                          Container(
                            // city7hq (40:241)
                            margin: EdgeInsets.fromLTRB(
                                14 * fem, 0 * fem, 0 * fem, 12 * fem),
                            child: Text(
                              'City',
                              style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 20 * ffem,
                                fontWeight: FontWeight.w500,
                                height: 1.5 * ffem / fem,
                                color: Color(0xff24284d),
                              ),
                            ),
                          ),
                          Container(
                            // autogrouphx3ywRy (KjiHMYia8oRfWERXLeHx3y)
                            margin: EdgeInsets.fromLTRB(
                                13 * fem, 0 * fem, 0 * fem, 14 * fem),
                            padding: EdgeInsets.fromLTRB(
                                27 * fem, 14 * fem, 27 * fem, 25 * fem),
                            width: 443 * fem,
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xff96a2b8)),
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(24 * fem),
                            ),
                            child: Text(
                              'City',
                              style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 16 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.5 * ffem / fem,
                                color: Color(0xff96a2b8),
                              ),
                            ),
                          ),
                          Container(
                            // autogroupq4muzv3 (KjiHW8JcN4nyckndRgq4Mu)
                            margin: EdgeInsets.fromLTRB(
                                14 * fem, 0 * fem, 123 * fem, 12 * fem),
                            width: double.infinity,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // covidvaccinatedvoh (40:246)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 40 * fem, 0 * fem),
                                  child: Text(
                                    'Covid vaccinated?',
                                    style: SafeGoogleFont(
                                      'Poppins',
                                      fontSize: 20 * ffem,
                                      fontWeight: FontWeight.w500,
                                      height: 1.5 * ffem / fem,
                                      color: Color(0xff24284d),
                                    ),
                                  ),
                                ),
                                Text(
                                  // diabetes3tK (40:247)
                                  'Diabetes',
                                  style: SafeGoogleFont(
                                    'Poppins',
                                    fontSize: 20 * ffem,
                                    fontWeight: FontWeight.w500,
                                    height: 1.5 * ffem / fem,
                                    color: Color(0xff24284d),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            // autogroupgyh5CWK (KjiHhHegPZET85TM8bgYH5)
                            margin: EdgeInsets.fromLTRB(
                                29 * fem, 0 * fem, 65 * fem, 38 * fem),
                            width: double.infinity,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // ellipse78Py (40:250)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 1 * fem, 12 * fem, 0 * fem),
                                  width: 17 * fem,
                                  height: 17 * fem,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(8.5 * fem),
                                    border:
                                        Border.all(color: Color(0xff4b57a8)),
                                  ),
                                ),
                                Container(
                                  // yes42j (39:228)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 23 * fem, 0 * fem),
                                  child: Text(
                                    'Yes',
                                    style: SafeGoogleFont(
                                      'Poppins',
                                      fontSize: 16 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.5 * ffem / fem,
                                      color: Color(0xff24284d),
                                    ),
                                  ),
                                ),
                                Container(
                                  // ellipse8mxj (40:254)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 1 * fem, 12 * fem, 0 * fem),
                                  width: 17 * fem,
                                  height: 17 * fem,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(8.5 * fem),
                                    border:
                                        Border.all(color: Color(0xff4b57a8)),
                                  ),
                                ),
                                Container(
                                  // noJSs (40:253)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 100 * fem, 0 * fem),
                                  child: Text(
                                    'No',
                                    style: SafeGoogleFont(
                                      'Poppins',
                                      fontSize: 16 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.5 * ffem / fem,
                                      color: Color(0xff24284d),
                                    ),
                                  ),
                                ),
                                Container(
                                  // ellipse9S3H (40:257)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 1 * fem, 12 * fem, 0 * fem),
                                  width: 17 * fem,
                                  height: 17 * fem,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(8.5 * fem),
                                    border:
                                        Border.all(color: Color(0xff4b57a8)),
                                  ),
                                ),
                                Container(
                                  // yesNBq (40:255)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 23 * fem, 0 * fem),
                                  child: Text(
                                    'Yes',
                                    style: SafeGoogleFont(
                                      'Poppins',
                                      fontSize: 16 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.5 * ffem / fem,
                                      color: Color(0xff24284d),
                                    ),
                                  ),
                                ),
                                Container(
                                  // ellipse10W39 (40:258)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 1 * fem, 12 * fem, 0 * fem),
                                  width: 17 * fem,
                                  height: 17 * fem,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(8.5 * fem),
                                    border:
                                        Border.all(color: Color(0xff4b57a8)),
                                  ),
                                ),
                                Text(
                                  // nodNf (40:256)
                                  'No',
                                  style: SafeGoogleFont(
                                    'Poppins',
                                    fontSize: 16 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.5 * ffem / fem,
                                    color: Color(0xff24284d),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            // allergiesP6w (40:245)
                            margin: EdgeInsets.fromLTRB(
                                14 * fem, 0 * fem, 0 * fem, 12 * fem),
                            child: Text(
                              'Allergies',
                              style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 20 * ffem,
                                fontWeight: FontWeight.w500,
                                height: 1.5 * ffem / fem,
                                color: Color(0xff24284d),
                              ),
                            ),
                          ),
                          Container(
                            // autogroupnmexi9D (KjiJ1CJWQDWDgqgzcanMEX)
                            margin: EdgeInsets.fromLTRB(
                                13 * fem, 0 * fem, 0 * fem, 21 * fem),
                            padding: EdgeInsets.fromLTRB(
                                28 * fem, 16 * fem, 28 * fem, 16 * fem),
                            width: 443 * fem,
                            height: 125 * fem,
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xff96a2b8)),
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(24 * fem),
                            ),
                            child: Text(
                              'Allergies',
                              style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 16 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.5 * ffem / fem,
                                color: Color(0xff96a2b8),
                              ),
                            ),
                          ),
                          Container(
                            // noteNUf (40:248)
                            margin: EdgeInsets.fromLTRB(
                                14 * fem, 0 * fem, 0 * fem, 5 * fem),
                            child: Text(
                              'Note',
                              style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 20 * ffem,
                                fontWeight: FontWeight.w500,
                                height: 1.5 * ffem / fem,
                                color: Color(0xff24284d),
                              ),
                            ),
                          ),
                          Container(
                            // autogroup2fkuHLj (KjiJAmrt2zFivKQ1nA2FKu)
                            margin: EdgeInsets.fromLTRB(
                                13 * fem, 0 * fem, 0 * fem, 0 * fem),
                            padding: EdgeInsets.fromLTRB(
                                28 * fem, 16 * fem, 28 * fem, 16 * fem),
                            width: 443 * fem,
                            height: 125 * fem,
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xff96a2b8)),
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(24 * fem),
                            ),
                            child: Text(
                              'Note',
                              style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 16 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.5 * ffem / fem,
                                color: Color(0xff96a2b8),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // autogroupe8eb983 (KjiJMbtAveEU3zHRnte8eb)
                      width: double.infinity,
                      height: 95 * fem,
                      decoration: BoxDecoration(
                        color: Color(0xffffffff),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            // rectangle27gdm (39:219)
                            left: 27 * fem,
                            top: 16 * fem,
                            child: ElevatedButton(
                              onPressed: () {
                                // Add functionality for the button press here
                              },
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                backgroundColor: Color(0xff303e9f),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24 * fem),
                                ),
                                elevation:
                                    0, // You can adjust the elevation as needed
                              ),
                              child: SizedBox(
                                width: 443 * fem,
                                height: 63 * fem,
                                child: Center(
                                  child: Text(
                                    'Save',
                                    style: SafeGoogleFont(
                                      'Poppins',
                                      fontSize: 20 * ffem,
                                      fontWeight: FontWeight.w500,
                                      height: 1.5 * ffem / fem,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
