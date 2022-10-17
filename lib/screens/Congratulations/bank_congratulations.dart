import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trust_money/utils/sharedPreference.dart';
import 'package:trust_money/utils/colorsConstant.dart';

import '../../utils/images.dart';

class BankComplete extends StatefulWidget {
  const BankComplete({Key? key}) : super(key: key);

  @override
  State<BankComplete> createState() => _BankCompleteState();
}

class _BankCompleteState extends State<BankComplete> {

  String panNumber = "";

  getPreferences() async {
    panNumber = await HelperFunctions.getPanName();
    print("============Email $panNumber");
    setState(() {});
  }

  @override
  void initState() {
    getPreferences();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pop(context);
     // Navigator.pop(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              ConstantImage.profile,
              height: 150,
              width: 150,
            ),
          ),
        SizedBox(
          width: MediaQuery.of(context).size.width/1.3,
          child: Text(
            "Congratulations! $panNumber Bank Account Added Successfully",
            textAlign: TextAlign.center,
            style: GoogleFonts.quicksand(
              textStyle: const TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 18),
            ),
          ),
        ),
        ],
      ),
    );
  }
}
