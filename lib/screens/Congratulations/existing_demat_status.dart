import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trust_money/screens/profile/my_profile.dart';
import 'package:trust_money/utils/colorsConstant.dart';
import 'package:trust_money/utils/images.dart';

class DematStatus extends StatefulWidget {
  const DematStatus({Key? key}) : super(key: key);

  @override
  State<DematStatus> createState() => _DematStatusState();
}

class _DematStatusState extends State<DematStatus> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4), () async{
     await Navigator.push(context,
          MaterialPageRoute(builder: (context) => const MyProfile()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width*0.20,
            ),
            Text(
              "List of Documents Collected",
              style: GoogleFonts.quicksand(
                textStyle: const TextStyle(
                    color: Color(0xff22263D),
                    fontWeight: FontWeight.w600,
                    fontSize: 19),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/images/done1.png",
                  color: AppColors.textColor,
                  scale: 6,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "PAN Card",
                  style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 18),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 13,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/images/done1.png",
                  color: AppColors.textColor,
                  scale: 6,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Aadhaar Card",
                  style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 18),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 13,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/images/done1.png",
                  color:AppColors.textColor,
                  scale: 6,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Canceled Cheque",
                  style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 18),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 13,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/images/done1.png",
                  color:AppColors.textColor,
                  scale: 6,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Signature",
                  style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 18),
                  ),
                )
              ],
            ),
             SizedBox(
              height: MediaQuery.of(context).size.width*0.40,
            ),
            Center(
              child: Image.asset(
                ConstantImage.thumb,
                height: 108,
                width: 114,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
                child: Text(
                    "Congratulation for successfully \ncompleting your KYC process.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                          color: Color(0xff22263D),
                          fontWeight: FontWeight.w400,
                          fontSize: 20),
                    )))
          ],
        ),
      ),
    );
  }
}
