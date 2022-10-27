import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trust_money/utils/images.dart';

class SetAlert extends StatefulWidget {
  const SetAlert({Key? key}) : super(key: key);

  @override
  State<SetAlert> createState() => _SetAlertState();
}

class _SetAlertState extends State<SetAlert> {
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
    Navigator.pop(context);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Image.asset(ConstantImage.alert,scale: 3,)),
            const SizedBox(height: 25,),
            Center(
              child: Text("Alerts Set!",style: GoogleFonts.quicksand(
                textStyle: const TextStyle(
                    color: Color(0xff22263D), fontWeight: FontWeight.w500, fontSize: 30),
              ),),
            )
          ],
        )
      ),
    );
  }
}
