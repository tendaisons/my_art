import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:my_art/src/features/portal/pages/patients/PatientDetailsPage.dart';
import 'package:my_art/src/models/patient_models.dart';
import 'package:my_art/src/constants/dimensions.dart';

import '../../../../../common_widgets/math.dart';
import '../../../../../constants/colors.dart';

class ListItemWidget extends StatelessWidget {
  final Patient item;
  const ListItemWidget(this.item, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => PatientDetailsPage(
                    // Send clicked record to details screen by id
                    item: item,
                  ))),
      child: Container(
        margin: EdgeInsets.only(
          top: getVerticalSize(6.0),
          bottom: getVerticalSize(6.0),
        ),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: const Color.fromARGB(179, 222, 221, 221),
          borderRadius: BorderRadius.circular(
            getHorizontalSize(
              12,
            ),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                CircleAvatar(
                  radius: getHorizontalSize(
                    30,
                  ),
                  backgroundColor: tPrimaryColor,
                  child: Icon(
                    LineAwesomeIcons.user,
                    //color: tWhiteColor,
                    size: getHorizontalSize(
                      30,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          item.fullname,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: getHorizontalSize(
                              4,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: getVerticalSize(
                          2,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  right: getHorizontalSize(
                                    10,
                                  ),
                                ),
                                child: Text(item.phoneNo,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: const TextTheme().bodyLarge),
                              ),
                              Text(
                                item.gender,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: 'General Sans',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(height: 8),
                Text("${item.city} | ${item.country}",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: const TextTheme().bodySmall),
                const Spacer(),
                InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => PatientDetailsPage(
                                // Send clicked record to details screen by id
                                item: item,
                              ))),
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(
                      left: getHorizontalSize(
                        16,
                      ),
                      top: getVerticalSize(
                        8,
                      ),
                      right: getHorizontalSize(
                        16,
                      ),
                      bottom: getVerticalSize(
                        8,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: tSecondaryColor,
                      //ColorConstant.whiteA700,
                      borderRadius: BorderRadius.circular(
                        getHorizontalSize(
                          50,
                        ),
                      ),
                    ),
                    child: Text(
                      'View Patient >',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                          color: tWhiteColor),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
