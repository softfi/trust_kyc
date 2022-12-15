import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../getx_controller/personal_details_controller.dart';
import '../../../../utils/strings.dart';
import '../../../../utils/styles.dart';
import '../personal_detals/app_textfield.dart';

class IPVVerification extends StatelessWidget {
   IPVVerification({Key? key}) : super(key: key);
  PersonalDetailsController _personalDetailsController =
  Get.put(PersonalDetailsController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _personalDetailsController.isVisible.value = 2;
        return false;
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          padding: const EdgeInsets.all(12),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: const Color(0xffF7F7FA).withOpacity(0.35),
              border: Border.all(width: 1.2, color: const Color(0xffbcbcbc))),
          child: Column(
            children: [
              ipvWidget(context),
            ],
          ),
        ),
      ),
    );
  }
  Widget ipvWidget(BuildContext context){
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            Text(
              "Personal Details",
              style: ConstStyle.quickMedium,
            ),
            const SizedBox(
              width: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                "STEP 2 of 2",
                style: GoogleFonts.quicksand(
                  textStyle: const TextStyle(
                      color: Color(0xffFF405A),
                      fontWeight: FontWeight.w400,
                      fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      ),
      const Divider(
        thickness: 0.7,
        indent: 5,
        endIndent: 5,
      ),
      _space,
      Text(
        Strings.identity,
        style: GoogleFonts.quicksand(
          textStyle: const TextStyle(
              color: Color(0xff22263D),
              fontWeight: FontWeight.w500,
              fontSize: 20),
        ),
      ),
      _space,

      Text(
        Strings.identity_text,
        style: GoogleFonts.sourceSansPro(
          textStyle: const TextStyle(
              color: Color(0xff22263D),
              fontWeight: FontWeight.w500,
              fontSize: 15),
        ),
      ),
      _space,
      Text(
        Strings.note,
        textAlign: TextAlign.center,
        style: GoogleFonts.sourceSansPro(
          textStyle: const TextStyle(
              color: Color(0xffFF405A),
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
              fontSize: 12),
        ),
      ),







      _space,
      _space,
      _space,

      _space1,
      _space1,
      Center(
        child: Text(
          "Save & Complete Later",
          style: GoogleFonts.sourceSansPro(
            textStyle: const TextStyle(
                color: Color(0xff22263D),
                fontWeight: FontWeight.w500,
                fontSize: 15),
          ),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
    ]);
  }

   Widget get _space => const SizedBox(height: 16);

   Widget get _space1 => const SizedBox(height: 5);
}
