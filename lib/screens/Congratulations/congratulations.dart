import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trust_money/screens/home/profile_page.dart';
import 'package:trust_money/screens/home/profile_screen.dart';

import '../../utils/images.dart';
import '../../utils/styles.dart';

class Congratulation extends StatefulWidget {
  const Congratulation({Key? key}) : super(key: key);
  @override
  State<Congratulation> createState() => _CongratulationState();
}

class _CongratulationState extends State<Congratulation> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3),(){
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const ProfilePage()));
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                ConstantImage.thumb,
                height: 108,
                width: 114,
              ),
            ),
            _space,
            Center(
              child: Text(
                "Congratulation for successfully \ncompleting your KYC process.",
                style: ConstStyle.quickStandMedium,
                textAlign: TextAlign.center,
              ),
            ),
            _space,
            _space,
          ],
        ),
      ),
    );
  }

  Widget get _space => const SizedBox(height: 30);
}
