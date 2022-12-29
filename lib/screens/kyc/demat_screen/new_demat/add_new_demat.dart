

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/styles.dart';

class AddNewDemat extends StatelessWidget {
  const AddNewDemat({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        height: MediaQuery.of(context).size.height / 1.4,
        padding: const EdgeInsets.all(12),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: const Color(0xffF7F7FA).withOpacity(0.35),
            border: Border.all(width: 1.2, color: const Color(0xffbcbcbc))),
        child: Column(
          children: [
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 4.0, vertical: 3),
              child: Text(
                "Demat Details",
                style: ConstStyle.quickMedium,
              ),
            ),
            const Divider(
              thickness: 0.7,
              indent: 5,
              endIndent: 5,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Hey Jairaj, Enter Your Demat Account Information",
              style: GoogleFonts.quicksand(
                textStyle: const TextStyle(
                    color: Color(0xff22263D),
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
            ),
            _space,
            _space,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                  },
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            width: 1.5, color: Color(0xff23263B))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 15),
                      child: Center(
                          child: Text(
                            "Existing Demat",
                            style: ConstStyle.quickStandBtn,
                          )),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                  },
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            width: 1.5, color: Color(0xff23263B))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 15),
                      child: Center(
                          child: Text(
                            "Open New Demat",
                            style: ConstStyle.quickStandBtn,
                          )),
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

  Widget get _space => const SizedBox(height: 16);

  Widget get _space1 => const SizedBox(height: 5);
}
