import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_art/src/constants/text_strings.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:share_plus/share_plus.dart';

Future<Uint8List> getImageFileFromAssets(String path) async {
  final byteData = await rootBundle.load('assets/$path');

  final file = File('${(await getTemporaryDirectory()).path}/$path');
  await file.writeAsBytes(byteData.buffer
      .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

  return File('${(await getTemporaryDirectory()).path}/$path')
      .readAsBytesSync();
}

getImageFile(String filename) {
  getImageFileFromAssets(filename).then((value) {
    return value;
  });
}

Future<bool> makeReport({item}) async {
  final User user = FirebaseAuth.instance.currentUser!;

  String dateTime = DateTime.now().toString().substring(0, 16);

  // Directory? appDocDirectory = await getExternalStorageDirectory();

  var downloads = "/storage/emulated/0/Download";

  // Permission permission1 = Permission.storage;

  // var dir;
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) => pw.Center(
        child: pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.center,
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Spacer(flex: 3),
              pw.Text(dateTime),
              pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                  children: [
                    pw.Spacer(),
                    pw.SizedBox(
                      height: 10,
                    ),
                    pw.Text("My_Art",
                        style: pw.TextStyle(
                            color: PdfColors.black,
                            fontSize: 40,
                            fontWeight: pw.FontWeight.bold)),
                    pw.Spacer(),
                  ]),
              pw.Spacer(flex: 2),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Padding(
                    padding:
                        pw.EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(item.fullname,
                            style: pw.TextStyle(
                                fontSize: 18, fontWeight: pw.FontWeight.bold)),
                        pw.SizedBox(height: 8),
                        pw.Row(
                          children: [
                            pw.SizedBox(width: 5),
                            pw.Text(item.city + " " + item.country),
                          ],
                        ),
                        pw.SizedBox(height: 10),
                        pw.Text('Patient Details',
                            style: pw.TextStyle(
                                fontSize: 16, fontWeight: pw.FontWeight.bold)),
                        pw.SizedBox(height: 10),
                        pw.Text("Oiart Number: ${item.oiartnumber}"),
                        pw.SizedBox(height: 10),
                        pw.Text("Phone Number: ${item.phoneNo}"),
                        pw.SizedBox(height: 10),
                        pw.Text("E-mail: ${item.email}"),
                        pw.SizedBox(height: 10),
                        pw.Text("Age: ${item.age}"),
                        pw.SizedBox(height: 10),
                        pw.Text("Gender: ${item.gender}"),
                        pw.SizedBox(height: 10),
                        pw.Text("Address: ${item.address}"),
                        pw.SizedBox(height: 10),
                        pw.Text("Province: ${item.province}"),
                        pw.SizedBox(height: 10),
                        pw.Text("City: ${item.city}"),
                        pw.SizedBox(height: 10),
                        pw.Text(
                            "Covid-19 Vaccinated: ${item.covidVaccination}"),
                        pw.SizedBox(height: 10),
                        pw.Text("Diabetic: ${item.diabetes}"),
                        pw.SizedBox(height: 10),
                        pw.Text('Patient Notes',
                            style: pw.TextStyle(
                                fontSize: 16, fontWeight: pw.FontWeight.bold)),
                        pw.SizedBox(height: 10),
                        pw.Text("${item.note}"),
                        pw.SizedBox(height: 10),
                        pw.Text('Patient Alleges',
                            style: pw.TextStyle(
                                fontSize: 16, fontWeight: pw.FontWeight.bold)),
                        pw.SizedBox(height: 10),
                        pw.Text("${item.allergies}"),
                      ],
                    ),
                  ),
                ],
              ),
              pw.Spacer(flex: 2),
              pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                  children: [
                    pw.Spacer(),
                    pw.SizedBox(
                      height: 10,
                    ),
                    pw.Text("Generated by: ${user.email}",
                        style: pw.TextStyle(
                            color: PdfColors.black,
                            fontSize: 10,
                            fontWeight: pw.FontWeight.bold)),
                    pw.Spacer(),
                  ]),
            ]),
      ),
    ),
  );

  String name = "${tAppName}_${dateTime}_"
      .replaceAll(' ', "_")
      .replaceAll(".", "_")
      .replaceAll(":", "_");

  var directry = await getTemporaryDirectory();
  var pathdir = directry.path;

  final file = File('$pathdir/Report_$name.pdf');
  final file2 = await file.writeAsBytes(await pdf.save());
  // ignore: deprecated_member_use
  // Share.shareFiles([file.path]);
  // Save pdf to Download folder
  await file2.copy('$downloads/Report_$name.pdf');

  return true;
}
