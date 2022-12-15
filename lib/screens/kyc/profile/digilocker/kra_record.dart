import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../utils/styles.dart';
import '../personal_detals/app_textfield.dart';

class KRARecord extends StatelessWidget {
  const KRARecord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: const Color(0xffF7F7FA).withOpacity(0.35),
            border: Border.all(width: 1.2, color: const Color(0xffbcbcbc))),
        child: Column(
          children: [
            kraWidget(),
          ],
        ),
      ),
    );
  }

  Widget kraWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                  "STEP 1 of 2",
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
          "Hey Jairaj, Please Verify, We Fetched This Information From Pan And KRA Records, As Provided By You.",
          style: ConstStyle.quickMedium,
        ),
        _space,
        AppText(
          title: 'Last Name* ',
        ),
        _space1,
        TextContainer(
          color: Color(0xffF7F7FA),
          titleText: "5436 7658 7658",
          perfixIcon: Container(),
          postfixIcon: Container(),
        ),
      ],
    );
  }

  Widget get _space => const SizedBox(height: 16);

  Widget get _space1 => const SizedBox(height: 5);
}
