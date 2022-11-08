import 'package:flutter/material.dart';
import 'package:trust_money/utils/images.dart';
import 'package:trust_money/utils/styles.dart';

import 'complete_profile_animation.dart';

class ContinueAnimation extends StatefulWidget {
  const ContinueAnimation({Key? key}) : super(key: key);

  @override
  State<ContinueAnimation> createState() => _ContinueAnimationState();
}

class _ContinueAnimationState extends State<ContinueAnimation> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () async{
      Navigator.pop(context);
      await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const ProfileAnimation()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ConstantImage.thumb,
              height: 108,
              width: 114,
            ),
            _space,
            Center(
                child: Text(
                  "Alright, let's continue",
                  style: ConstStyle.quickStandBtn,
                )),
          ],
        ),
      ),
    );
  }

  Widget get _space => const SizedBox(height: 30);
}
