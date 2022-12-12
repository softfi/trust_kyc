import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_bar.dart';
import '../../utils/images.dart';



class PrivacyPolicy extends StatelessWidget {
  PrivacyPolicy({Key? key}) : super(key: key);

    var a="Trust Securities Services Private Limited and its group companies (we/us/our/Trust Group) is committed to protecting and respecting your privacy of personal information that you provide to us when using our website (www.trustsecurities.in) or any of our services thereat. This Privacy Policy (“Policy”) sets out the basis on which any personal data we collect from you or that you provide to us will be processed by us and the purpose for our collection of it.\n \n \n We need to collect, use and disclose personal information, in order to perform our business functions and activities, and render various services to you (our customer). We are firmly committed to protecting the privacy and confidentiality of personal information with various physical, electronic and procedural safeguards.\n \n \n By visiting this website, you are accepting and consenting to the practices described in this Policy. However, if you do not provide us with your personal information, or if you withdraw consent that you have given under this Policy, this may affect our ability to provide services to you or negatively impact the services we can provide to you. If you reached our site for availing products or services, we may become privy to the personal information of users, including information that is of a confidential and sensitive in nature.\n \n \n While information is the keystone of our ability to deliver superior service, our most essential asset is our clients’ trust. Keeping client information secure and using it only as our client would want us to, is a top priority for all of us at Trust Group.";
      var b="This Policy explains how we may collect and process personal data about: Clients and prospective clients; Visitors to our website and subscribers to our online services; Any other user whose personal data we may hold.";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppToolbar.appBar(
          "PRIVACY POLICY",
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          IconButton(
            icon: Container(
                padding: const EdgeInsets.all(1),
                decoration: const BoxDecoration(
                    color: Colors.white, shape: BoxShape.circle),
                child: const Icon(Icons.person,
                    size: 20, color: Color(0xff00C6D8))),
            onPressed: () {},
          )),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(a,
                style: GoogleFonts.sourceSansPro(
                  textStyle: TextStyle(
                      color: Color(0xff22263D),
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),)
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                "",
                style: GoogleFonts.quicksand(
                  textStyle: TextStyle(
                      color: Color(0xff9199A1),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
            b,
                style: GoogleFonts.sourceSansPro(
                  textStyle: TextStyle(
                      color: Color(0xff9199A1),
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
            "Depending On Our Relationship With You, This Policy May Be Supplemented With Additional Information, Policies Or Guidelines Relating To Our Use Of Your Personal Data.",
                style: GoogleFonts.quicksand(
                  textStyle: TextStyle(
                      color: Color(0xff22263D),
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
            "Information We Collect",
                style: GoogleFonts.quicksand(
                  textStyle: TextStyle(
                      color: Color(0xff22263D),
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 10),
              child: Text(
                "When you register, and at other times, we may collect personally identifiable information from you that may include but not be limited to your name, address, telephone number, e-mail address, and facts about your computer.",
                style: GoogleFonts.sourceSansPro(
                  textStyle: TextStyle(
                      color: Color(0xff9199A1),
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 120,
              color: Color(0xffFF0023),
              child: Text(
                  "*Get Full Content On Https://Trustsecurities.In/Faq.Php",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.quicksand(
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  )),
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }


}
