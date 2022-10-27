import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rotated_corner_decoration/rotated_corner_decoration.dart';
import 'package:trust_money/utils/styles.dart';

import '../../utils/colorsConstant.dart';
import '../../utils/strings.dart';

class TermsConditons extends StatelessWidget {
  const TermsConditons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          "TERMS AND CONDITIONS",
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
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Strings.term1,
                  style: GoogleFonts.sourceSansPro(
                      textStyle: const TextStyle(
                          height: 1.4,
                          color: AppColors.textColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 16)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  Strings.term2,
                  style: GoogleFonts.sourceSansPro(
                      textStyle: const TextStyle(
                          height: 1.4,
                          color: AppColors.textColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 16)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  Strings.term3,
                  style: GoogleFonts.sourceSansPro(
                      textStyle: const TextStyle(
                          height: 1.4,
                          color: AppColors.textColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 16)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Acceptance Of Terms And Conditions",
                  style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                          color: Color(0xff22263D),
                          fontSize: 19,
                          fontWeight: FontWeight.w600)),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Text(
                        "1. DEFINITIONS",
                        style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                                color: Color(0xff22263D),
                                fontSize: 19,
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                        "The below enumerated terms shall have the following meanings:  a. “Applicable Law(s)” means any laws, statutes, rules, regulations, orders, circulars, decrees, directives, judgments, decisions or other similar mandates of central, state or local governmental authority having competent jurisdiction in the territory of India; or laws application to the Party or subject matter in question. b. “Document” shall mean and include the “Terms of Use including Disclaimer and Disclosure statement,” “Privacy Policy”, as provided on this Platform. c. Intellectual Property” / “Intellectual Property Rights” means all current and future copyright, patents, trademarks (whether or not registered) or any other rights in databases, computer program, source code, process inventions or trade secrets, know-how, rights in designs, topographies, trade and business names, domain names, logo and all other intellectual and property rights and applications for any of those rights (where such applications can be made) capable of protection under the Applicable Laws for the time being in force. d. “Services” shall mean Services of every description as available on the Platform for Users (including potential users). e. “Users” shall mean the person(s) accessing/ visiting/ using this Platform. f. “Vendor” shall mean the entities empanelled with the Company to display their products/ offerings and educative initiatives etc. on this Platform. g. “Terms of Use” shall mean the terms and conditions set out herein regarding the use of the Platform.",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                            color: Color(0xff9199A1),
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "2. INTERPRETATIONS:",
                      style: GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                              color: Color(0xff22263D),
                              fontSize: 20,
                              fontWeight: FontWeight.w500)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                        "a. The use of terms “We”, “Our”, or “Us” in this Document refers to the Company along with its representatives and this Platform. ",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                            color: Color(0xff9199A1),
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                        " b. The use of terms “You”, “Your”, “User” or “Visitor” in this Document refers to the Users accessing/visiting/using this Platform.",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                            color: Color(0xff9199A1),
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                        " c. “Comments” are all reviews, comments, feedback, postcards, suggestions, ideas, and other submissions disclosed, submitted or offered relating to our Services. ",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                            color: Color(0xff9199A1),
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                        "d. Where the Platform may allow the User to initiate transactions in some or all of the financial instruments, it will be referred to as “Transaction Services”.",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                            color: Color(0xff9199A1),
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "3. BOND INFORMATION",
                      style: GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                              color: Color(0xff22263D),
                              fontSize: 20,
                              fontWeight: FontWeight.w500)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                        "a. All information available on platform is to the best of our knowledge. We do not guarantee accuracy of the bond information provided on our platform. Please bring it to our notice if there is any discrepancy in information provided on our platform.  ",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                            color: Color(0xff9199A1),
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                        " b. All information regarding security offers (rate levels) are indicative only and not in binding nature for the Company. Your order will be confirmed based on availability of stock and prevailing market level (level on platform will improve if market level is improved), which may differ from original offer reflected on application/web. ",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                            color: Color(0xff9199A1),
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                        ". c. Any information or data available on our Platform may contain inaccuracies and/or typographical errors. The Company does not warrant that the Platform or functions thereof will be uninterrupted or free of any error or defect or that information on the Platform will satisfy any intended purpose or requirement of the User. ",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                            color: Color(0xff9199A1),
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "4. ADDITIONAL TERMS AND CONDITIONS",
                      style: GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                              color: Color(0xff22263D),
                              fontSize: 20,
                              fontWeight: FontWeight.w500)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                        "a. We reserve right to make change(s) to the Platform, related policies, terms of use, disclaimer, and Privacy Policy at any point in time as we may deem fit and proper, without prior notice/ intimation to the User.  ",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                            color: Color(0xff9199A1),
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                        " b. Your continued use of the Services constitutes acceptance of the changes and an agreement to be bound by Terms, as amended. If you do not agree to the changes, you may please discontinue your use of the services and ancillary Services. We reserve the right to discontinue or suspend, temporarily or permanently the access of this Platform, at any point of time without giving notice or reasons for the same.  ",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                            color: Color(0xff9199A1),
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                        "c. We are under no obligation to monitor the communication transmitted using this Platform. However, we reserve the right to review information posted/ selected/ transmitted at our sole discretion. ",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                            color: Color(0xff9199A1),
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "5. FORM OF COMMUNICATION",
                      style: GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                              color: Color(0xff22263D),
                              fontSize: 20,
                              fontWeight: FontWeight.w500)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        "Documents sent by electronic means viz. by electronic e-mail (including any auto replies from the system), an electronic mail attachment, or in the form of an available download option from the Platform shall deemed to have fulfilled any obligation (legal or otherwise) to deliver such document. ",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                            color: Color(0xff9199A1),
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "6. WAIVER",
                      style: GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                              color: Color(0xff22263D),
                              fontSize: 20,
                              fontWeight: FontWeight.w500)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        "Any failure of the Company to exercise or enforce any right or provision of these Terms & Conditions shall not operate as a waiver of such right or provision.",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                            color: Color(0xff9199A1),
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "7. FORCE MAJEURE",
                      style: GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                              color: Color(0xff22263D),
                              fontSize: 20,
                              fontWeight: FontWeight.w500)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        "The Company, its affiliates, and their respective officers, owners, directors, employees, agents, consultants, or contractors and service providers shall be relieved of all responsibilities/ obligations, in the event of failure of performance is resulting directly or indirectly due to act of Force Majeure or causes beyond our reasonable control. You further acknowledge and agree that neither we, nor any of the foregoing entities are responsible or liable for (a) any incompatibility between the Platform and any other platform, service, software or hardware or (b) any delays or failures you may experience with any transmissions or transactions relating to the Platform in an accurate or timely manner.",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                            color: Color(0xff9199A1),
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "8. COOKIES",
                      style: GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                              color: Color(0xff22263D),
                              fontSize: 20,
                              fontWeight: FontWeight.w500)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        "a. Our Portal contains links to third party websites. The fact that we link to a website is not an endorsement, authorization or representation of our affiliation with that third party. We do not   exercise control over third party websites. These other websites may place their own cookies or other files on your computer, collect data or solicit Personal Information from you. Other sites follow different rules regarding the use or disclosure of the Personal Information you submit to them. We are not responsible for the content, privacy and security practices, and policies of third-party sites or services to which links or access are provided through the Service. We encourage you to read the privacy policies or statements of the other websites you visit.",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                            color: Color(0xff9199A1),
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        " b. Most browsers allow you to refuse to accept cookies and to delete cookies. The methods for doing so vary from browser to browser, and from version to version.",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                            color: Color(0xff9199A1),
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
