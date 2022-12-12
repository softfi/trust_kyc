import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rotated_corner_decoration/rotated_corner_decoration.dart';
import 'package:trust_money/utils/images.dart';
import 'package:trust_money/utils/styles.dart';

import '../../utils/colorsConstant.dart';
import '../bond/common_widget.dart';
import '../home/custom_listtile.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: Column(
          children: [
            Container(
              height: 80,
              color: Color(0xff00C6D8),
              child: Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon:
                              const Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        Text(
                          "CONTACT US",
                          style: ConstStyle.quickStandSmall11,
                        ),

                        IconButton(
                          icon:
                              const Icon(Icons.person_pin, color: Colors.white),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        // Container(
                        //   width: 50,
                        // )
                      ],
                    ),
                    Positioned(
                      left: 0,
                      bottom: -1,
                      child: RotatedBox(
                        quarterTurns: 2,
                        child: Material(
                          elevation: 0,
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: const BoxDecoration(
                              color: Color(0xff00C6D8),
                            ),
                            foregroundDecoration: const RotatedCornerDecoration(
                              color: Colors.redAccent,
                              geometry: BadgeGeometry(
                                  width: 20, height: 20, cornerRadius: 0),
                            ),
                            child: Container(),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: -1,
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: Material(
                          elevation: 0,
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: const BoxDecoration(
                              color: Color(0xff00C6D8),
                            ),
                            foregroundDecoration: const RotatedCornerDecoration(
                              color: Colors.redAccent,
                              geometry: BadgeGeometry(
                                  width: 20, height: 20, cornerRadius: 0),
                            ),
                            child: Container(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RotatedBox(
                    quarterTurns: 1,
                    child: Material(
                      elevation: 0,
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                          color: Colors.redAccent,
                        ),
                        foregroundDecoration: const RotatedCornerDecoration(
                          color: Colors.white,
                          geometry: BadgeGeometry(
                              width: 30, height: 28, cornerRadius: 0),
                        ),
                        child: Container(),
                      ),
                    ),
                  ),
                  RotatedBox(
                    quarterTurns: 2,
                    child: Material(
                      elevation: 0,
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                          color: Colors.redAccent,
                        ),
                        foregroundDecoration: const RotatedCornerDecoration(
                          color: Colors.white,
                          geometry: BadgeGeometry(
                              width: 28, height: 30, cornerRadius: 0),
                        ),
                        child: Container(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            mainWidget(),
            const SizedBox(
              height: 35,
            ),
            CommonWidget.subscribe(),
            const SizedBox(
              height: 30,
            ),
            CommonWidget.needHelp(),
          ],
        ),
      ),
    );
  }

  Widget mainWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(child: Image.asset(ConstantImage.contact_us)),
          ),
          const SizedBox(
            height: 20,
          ),
          Text("Contact Us",
              style: GoogleFonts.quicksand(
                textStyle: const TextStyle(
                    color: Color(0xff22263D),
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
              )),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            softWrap: true,
            style: GoogleFonts.sourceSansPro(
              textStyle: const TextStyle(
                color: Color(0xff22263D),
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Center(
            child: Image(
              image: AssetImage(ConstantImage.location_icon),
              height: 67.51,
              width: 48.97,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Text("Our Location",
                style: GoogleFonts.quicksand(
                  textStyle: const TextStyle(
                      color: Color(0xff22263D),
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                )),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(
                  "1202, Naman Centre, Bandra Kurla Complex, Bandra (East), Mumbai -400 051",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                          color: Color(0xff8F919D),
                          fontWeight: FontWeight.w500,
                          fontSize: 16))),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Center(
            child: Image(
              image: AssetImage(ConstantImage.email_icon),
              height: 80,
              width: 60,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Text("Email & Phone",
                style: GoogleFonts.quicksand(
                  textStyle: const TextStyle(
                      color: Color(0xff22263D),
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                )),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(
                  "info@trustgroup.in 022 40845045, 022 40845070 022 42245246",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                          color: Color(0xff8F919D),
                          fontWeight: FontWeight.w500,
                          fontSize: 16))),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Center(
            child: Image(
              image: AssetImage(ConstantImage.get_in_touch),
              height: 80,
              width: 60,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Text("Get In Touch",
                style: GoogleFonts.quicksand(
                  textStyle: const TextStyle(
                      color: Color(0xff22263D),
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                )),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Text("Also find us social media below",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                          color: Color(0xff8F919D),
                          fontWeight: FontWeight.w500,
                          fontSize: 16))),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.facebook,
                  color: Color(0xff8F919D).withOpacity(0.45),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  FontAwesomeIcons.twitter,
                  color: Color(0xff8F919D).withOpacity(0.45),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  FontAwesomeIcons.instagram,
                  color: Color(0xff8F919D).withOpacity(0.45),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const Image(
            image: AssetImage(
              ConstantImage.map,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            "Don’t Hesitate To Drop Us A Line To Us.",
            style: GoogleFonts.quicksand(
                textStyle: const TextStyle(
                    color: Color(0xff22263D),
                    fontWeight: FontWeight.w600,
                    fontSize: 20)),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Your Name",
            style: GoogleFonts.quicksand(
                textStyle: const TextStyle(
                    color: Color(0xffB0B1B9),
                    fontWeight: FontWeight.w500,
                    fontSize: 15)),
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
              hintStyle: GoogleFonts.quicksand(
                  textStyle: const TextStyle(
                      color: Color(0xff22263D),
                      fontWeight: FontWeight.w500,
                      fontSize: 17)),
              hintText: 'Rashedul kabir',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Email",
            style: GoogleFonts.quicksand(
                textStyle: const TextStyle(
                    color: Color(0xffB0B1B9),
                    fontWeight: FontWeight.w500,
                    fontSize: 15)),
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintStyle: GoogleFonts.quicksand(
                  textStyle: const TextStyle(
                      color: Color(0xff22263D),
                      fontWeight: FontWeight.w500,
                      fontSize: 17)),
              hintText: 'rashedul@gmail.com',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Your Message",
            style: GoogleFonts.quicksand(
                textStyle: const TextStyle(
                    color: Color(0xffB0B1B9),
                    fontWeight: FontWeight.w500,
                    fontSize: 15)),
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              hintStyle: GoogleFonts.quicksand(
                  textStyle: const TextStyle(
                      color: Color(0xff22263D),
                      fontWeight: FontWeight.w500,
                      fontSize: 17)),
              hintMaxLines: 3,
              fillColor: Colors.white,
              hintText:
                  'Hi, This is rashed, I need some urgent help about the recent Bonds...',
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ViewAllWidget(
            title: 'Send',
            width: 145,
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
