import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trust_money/screens/Congratulations/existing_demat_status.dart';
import 'package:trust_money/utils/sharedPreference.dart';
import 'package:trust_money/utils/colorsConstant.dart';

import '../../utils/images.dart';

class DematAccountComplete extends StatefulWidget {
  const DematAccountComplete({Key? key}) : super(key: key);

  @override
  State<DematAccountComplete> createState() => _DematAccountCompleteState();
}

class _DematAccountCompleteState extends State<DematAccountComplete> {
  String panNumber = "";

  getPreferences() async {

    print("============pName $panNumber");
    setState(() {});
  }


  @override
  void initState() {
    getPreferences();
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        Navigator.pop(context);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const DematStatus()));
      });
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
              "Congratulations! $panNumber Demat Account Added Successfully",
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
