import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rotated_corner_decoration/rotated_corner_decoration.dart';
import 'package:trust_money/utils/styles.dart';

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


      // AppBar(
      //   iconTheme: IconThemeData(color: Color(0xffffFFFFFF)),
      //   backgroundColor: Color(0xff00C6D8),
      //   title: Text("TERMS & CONDITIONS",
      //       style: GoogleFonts.quicksand(
      //         textStyle: const TextStyle(
      //             color: Color(0xffffFFFFFF),
      //             fontWeight: FontWeight.w500,
      //             fontSize: 19),
      //       )),
      //   actions: [
      //     IconButton(
      //         onPressed: () {},
      //         icon: Icon(
      //           Icons.person_pin,
      //           color: Color(0xffffFFFFFF),
      //         ))
      //   ],
      // ),


      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0,right: 12,top: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text("Welcome to our Website. These terms and conditions apply to the access and use of the Website https://www.trustmoney.com and its Mobile Application (collectively be referred to as Platform), which is managed and operated by Techwealth Capital Services Private Limited, a company incorporated under the Companies Act, 2013 having its Registered Office at 3rd Floor, Sheraton House, opposite Ketav Petrol Pump, Polytechnic road, Ambawadi, Ahmedabad 380015 (hereinafter referred to as the Company). The Company is in the business of enabling users to make investments in financial instruments as offered by the Company on the platform either (i) by acting as an intermediary through financial institutions and the users; or (ii) by enabling the user to make an investment in a financial instrument directly with the Company. (Here in after referred to as our “Services”). The Company can be contacted through mail at connect@tipsons.com We have entered in to Technology Service Agreement with Tipsons Financial Services Private Limited, a company incorporated under the Companies Act 1956 having its Registered Office at 401, Sheraton House, opposite Ketav Petrol Pump, Polytechnic road, Ambawadi, Ahmedabad 380015 for outsourcing this platform for providing the financial services and solutions to their clients. Hence all this terms and conditions enumerated below will be applicable to all those accessing and using this platform. This document is an electronic record in terms of Information Technology Act, 2000 and generated by a computer system and does not require any physical or digital signatures. This document is published in accordance with the provisions of Rule 3 of the Information Technology (Intermediaries guidelines) 2011, that provides for the due diligence to be exercised for the access or usage of Platform.",style:  GoogleFonts.sourceSansPro(
                    textStyle: const TextStyle(
                      color: Color(0xff22263D), fontWeight: FontWeight.w400, fontSize: 16,),
                  ),),
                ),
                SizedBox(height: 20,),

                Container(
                  child: Text(
                    "Acceptance Of Terms And Conditions",style:  GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                          color: Color(0xff22263D), fontSize: 20, fontWeight: FontWeight.bold))
                    ,
                  ),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Container(
                      child: Text("1. DEFINITIONS",style: GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                              color: Color(0xff22263D), fontSize: 20, fontWeight: FontWeight.bold)),),
                    ),
SizedBox(height: 10,),
                    Container(
                      child: Text(
                        "The below enumerated terms shall have the following meanings:  a. “Applicable Law(s)” means any laws, statutes, rules, regulations, orders, circulars, decrees, directives, judgments, decisions or other similar mandates of central, state or local governmental authority having competent jurisdiction in the territory of India; or laws application to the Party or subject matter in question. b. “Document” shall mean and include the “Terms of Use including Disclaimer and Disclosure statement,” “Privacy Policy”, as provided on this Platform. c. Intellectual Property” / “Intellectual Property Rights” means all current and future copyright, patents, trademarks (whether or not registered) or any other rights in databases, computer program, source code, process inventions or trade secrets, know-how, rights in designs, topographies, trade and business names, domain names, logo and all other intellectual and property rights and applications for any of those rights (where such applications can be made) capable of protection under the Applicable Laws for the time being in force. d. “Services” shall mean Services of every description as available on the Platform for Users (including potential users). e. “Users” shall mean the person(s) accessing/ visiting/ using this Platform. f. “Vendor” shall mean the entities empanelled with the Company to display their products/ offerings and educative initiatives etc. on this Platform. g. “Terms of Use” shall mean the terms and conditions set out herein regarding the use of the Platform.",style:  GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                            color: Color(0xff22263D), fontWeight: FontWeight.w400, fontSize: 16,),)
                      ),
                    ),
                  ],
                ),


SizedBox(height: 20,),


                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Container(
                      child: Text("2. INTERPRETATIONS:",style: GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                              color: Color(0xff22263D), fontSize: 20, fontWeight: FontWeight.bold)),),
                    ),
SizedBox(height: 10,),
                    Container(
                      child: Text(
                          "a. The use of terms “We”, “Our”, or “Us” in this Document refers to the Company along with its representatives and this Platform. ",style:  GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                          color: Color(0xff22263D), fontWeight: FontWeight.w400, fontSize: 16,),)
                      ),
                    ),SizedBox(height: 10,),
                    Container(
                      child: Text(
                          " b. The use of terms “You”, “Your”, “User” or “Visitor” in this Document refers to the Users accessing/visiting/using this Platform.",style:  GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                          color: Color(0xff22263D), fontWeight: FontWeight.w400, fontSize: 16,),)
                      ),
                    ),SizedBox(height: 10,),
                    Container(
                      child: Text(
                          " c. “Comments” are all reviews, comments, feedback, postcards, suggestions, ideas, and other submissions disclosed, submitted or offered relating to our Services. ",style:  GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                          color: Color(0xff22263D), fontWeight: FontWeight.w400, fontSize: 16,),)
                      ),
                    ),SizedBox(height: 10,),
                    Container(
                      child: Text(
                          "d. Where the Platform may allow the User to initiate transactions in some or all of the financial instruments, it will be referred to as “Transaction Services”.",style:  GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                          color: Color(0xff22263D), fontWeight: FontWeight.w400, fontSize: 16,),)
                      ),
                    ),
                  ],
                ),




                SizedBox(height: 20,),


                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Container(
                      child: Text("3. BOND INFORMATION",style: GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                              color: Color(0xff22263D), fontSize: 20, fontWeight: FontWeight.bold)),),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      child: Text(
                          "a. All information available on platform is to the best of our knowledge. We do not guarantee accuracy of the bond information provided on our platform. Please bring it to our notice if there is any discrepancy in information provided on our platform.  ",style:  GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                          color: Color(0xff22263D), fontWeight: FontWeight.w400, fontSize: 16,),)
                      ),
                    ),SizedBox(height: 10,),
                    Container(
                      child: Text(
                          " b. All information regarding security offers (rate levels) are indicative only and not in binding nature for the Company. Your order will be confirmed based on availability of stock and prevailing market level (level on platform will improve if market level is improved), which may differ from original offer reflected on application/web. ",style:  GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                          color: Color(0xff22263D), fontWeight: FontWeight.w400, fontSize: 16,),)
                      ),
                    ),SizedBox(height: 10,),
                    Container(
                      child: Text(
                          ". c. Any information or data available on our Platform may contain inaccuracies and/or typographical errors. The Company does not warrant that the Platform or functions thereof will be uninterrupted or free of any error or defect or that information on the Platform will satisfy any intended purpose or requirement of the User. ",style:  GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                          color: Color(0xff22263D), fontWeight: FontWeight.w400, fontSize: 16,),)
                      ),
                    ),SizedBox(height: 10,),

                  ],
                ),







                SizedBox(height: 20,),


                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Container(
                      child: Text("4. ADDITIONAL TERMS AND CONDITIONS",style: GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                              color: Color(0xff22263D), fontSize: 20, fontWeight: FontWeight.bold)),),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      child: Text(
                          "a. We reserve right to make change(s) to the Platform, related policies, terms of use, disclaimer, and Privacy Policy at any point in time as we may deem fit and proper, without prior notice/ intimation to the User.  ",style:  GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                          color: Color(0xff22263D), fontWeight: FontWeight.w400, fontSize: 16,),)
                      ),
                    ),SizedBox(height: 10,),
                    Container(
                      child: Text(
                          " b. Your continued use of the Services constitutes acceptance of the changes and an agreement to be bound by Terms, as amended. If you do not agree to the changes, you may please discontinue your use of the services and ancillary Services. We reserve the right to discontinue or suspend, temporarily or permanently the access of this Platform, at any point of time without giving notice or reasons for the same.  ",style:  GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                          color: Color(0xff22263D), fontWeight: FontWeight.w400, fontSize: 16,),)
                      ),
                    ),SizedBox(height: 10,),
                    Container(
                      child: Text(
                          "c. We are under no obligation to monitor the communication transmitted using this Platform. However, we reserve the right to review information posted/ selected/ transmitted at our sole discretion. ",style:  GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                          color: Color(0xff22263D), fontWeight: FontWeight.w400, fontSize: 16,),)
                      ),
                    ),SizedBox(height: 10,),

                  ],
                ),


                SizedBox(height: 20,),


                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Container(
                      child: Text("5. FORM OF COMMUNICATION",style: GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                              color: Color(0xff22263D), fontSize: 20, fontWeight: FontWeight.bold)),),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      child: Text(
                          "Documents sent by electronic means viz. by electronic e-mail (including any auto replies from the system), an electronic mail attachment, or in the form of an available download option from the Platform shall deemed to have fulfilled any obligation (legal or otherwise) to deliver such document. ",style:  GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                          color: Color(0xff22263D), fontWeight: FontWeight.w400, fontSize: 16,),)
                      ),
                    ),SizedBox(height: 10,),

                  ],
                ),



                SizedBox(height: 20,),


                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Container(
                      child: Text("6. WAIVER",style: GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                              color: Color(0xff22263D), fontSize: 20, fontWeight: FontWeight.bold)),),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      child: Text(
                          "Any failure of the Company to exercise or enforce any right or provision of these Terms & Conditions shall not operate as a waiver of such right or provision.",style:  GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                          color: Color(0xff22263D), fontWeight: FontWeight.w400, fontSize: 16,),)
                      ),
                    ),SizedBox(height: 10,),

                  ],
                ),


                SizedBox(height: 20,),


                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Container(
                      child: Text("7. FORCE MAJEURE",style: GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                              color: Color(0xff22263D), fontSize: 20, fontWeight: FontWeight.bold)),),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      child: Text(
                          "The Company, its affiliates, and their respective officers, owners, directors, employees, agents, consultants, or contractors and service providers shall be relieved of all responsibilities/ obligations, in the event of failure of performance is resulting directly or indirectly due to act of Force Majeure or causes beyond our reasonable control. You further acknowledge and agree that neither we, nor any of the foregoing entities are responsible or liable for (a) any incompatibility between the Platform and any other platform, service, software or hardware or (b) any delays or failures you may experience with any transmissions or transactions relating to the Platform in an accurate or timely manner.",style:  GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                          color: Color(0xff22263D), fontWeight: FontWeight.w400, fontSize: 16,),)
                      ),
                    ),SizedBox(height: 10,),

                  ],
                ),



                SizedBox(height: 20,),


                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Container(
                      child: Text("8. COOKIES",style: GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                              color: Color(0xff22263D), fontSize: 20, fontWeight: FontWeight.bold)),),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      child: Text(
                          "a. Our Portal contains links to third party websites. The fact that we link to a website is not an endorsement, authorization or representation of our affiliation with that third party. We do not   exercise control over third party websites. These other websites may place their own cookies or other files on your computer, collect data or solicit Personal Information from you. Other sites follow different rules regarding the use or disclosure of the Personal Information you submit to them. We are not responsible for the content, privacy and security practices, and policies of third-party sites or services to which links or access are provided through the Service. We encourage you to read the privacy policies or statements of the other websites you visit.",style:  GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                          color: Color(0xff22263D), fontWeight: FontWeight.w400, fontSize: 16,),)
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      child: Text(
                          " b. Most browsers allow you to refuse to accept cookies and to delete cookies. The methods for doing so vary from browser to browser, and from version to version.",style:  GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                          color: Color(0xff22263D), fontWeight: FontWeight.w400, fontSize: 16,),)
                      ),
                    ),
                    SizedBox(height: 10,),

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
