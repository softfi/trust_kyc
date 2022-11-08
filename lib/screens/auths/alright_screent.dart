import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trust_money/screens/home/home_page.dart';
import 'package:trust_money/utils/images.dart';
import 'package:trust_money/utils/strings.dart';
import 'package:trust_money/utils/styles.dart';


class AllRight extends StatefulWidget {
  const AllRight({Key? key}) : super(key: key);

  @override
  State<AllRight> createState() => _AllRightState();
}

class _AllRightState extends State<AllRight> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomePage()));
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                Strings.Congrats,
                style: ConstStyle.quickStandMedium,
                textAlign:TextAlign.center,
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
