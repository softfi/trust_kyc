import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trust_money/screens/kyc/profile/my_profile.dart';
import '../../bottom_navigation/bottom_navigation.dart';
import '../../utils/images.dart';

class ChooseScreen extends StatefulWidget {
  const ChooseScreen({Key? key}) : super(key: key);

  @override
  State<ChooseScreen> createState() => _ChooseScreenState();
}

class _ChooseScreenState extends State<ChooseScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Image.asset(
                  ConstantImage.TrustIcon,
                  height: 100,
                  width: 100,
                ),
              ),
              SizedBox(
                height: height * 0.038,
              ),
              Center(
                child: Text(
                    "Complete Your KYC Online And Start Investing In Just Few Minutes",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                            color: Color(0xff22263D),
                            fontSize: 18,
                            fontWeight: FontWeight.w500))),
              ),
              Center(
                child: Image.asset(
                  ConstantImage.chooseImage,
                  height: 256,
                  width: 214,
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28.0),
                  child: Text(
                      "For Paperless KYC ensure that the following information is ready with you",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                              color: Color(0xff22263D),
                              fontSize: 16,
                              fontWeight: FontWeight.w500))),
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              GridView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1.7),
                children: [
                  SizedBox(
                    child: Column(
                      children: [
                        Center(
                          child: Image.asset(
                            ConstantImage.pan,
                            height: 41,
                            width: 48,
                            fit: BoxFit.fill,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 28.0),
                            child: Text("PAN Number",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                        color: Color(0xff22263D),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500))),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Column(
                      children: [
                        Center(
                          child: Image.asset(
                            ConstantImage.adhar,
                            height: 41,
                            width: 48,
                            fit: BoxFit.fill,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 28.0),
                            child: Text("Aadhaar Number",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                        color: Color(0xff22263D),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500))),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Column(
                      children: [
                        Center(
                          child: Image.asset(
                            ConstantImage.bank,
                            height: 41,
                            width: 48,
                            fit: BoxFit.fill,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 28.0),
                            child: Text("Bank Details",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                        color: Color(0xff22263D),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500))),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Column(
                      children: [
                        Center(
                          child: Image.asset(
                            ConstantImage.demat,
                            height: 41,
                            width: 48,
                            fit: BoxFit.fill,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 28.0),
                            child: Text("Demat Details",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                        color: Color(0xff22263D),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500))),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CustomBottomNavigation(
                                      currentIndex: 0,
                                    )));
                      },
                      child: Container(
                        height: 45,
                        width: 140,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1.5, color: Color(0xff23263B))),
                        child: Center(
                            child: Text(
                          "Go to Home",
                          style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                                  color: Color(0xff22263D),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500)),
                        )),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyProfile()));
                      },
                      child: Container(
                        height: 45,
                        width: 140,
                        decoration:
                            const BoxDecoration(color: Color(0xffFF405A)),
                        child: Center(
                            child: Text(
                          "Continue to KYC",
                          style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500)),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget get _space => const SizedBox(height: 20);

  Widget get _space1 => const SizedBox(height: 8);
}
