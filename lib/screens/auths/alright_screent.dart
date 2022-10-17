import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trust_money/screens/home/home_page.dart';
import 'package:trust_money/utils/images.dart';
import 'package:trust_money/utils/strings.dart';
import 'package:trust_money/utils/styles.dart';

import '../../utils/colorsConstant.dart';

class AllRight extends StatefulWidget {
  const AllRight({Key? key}) : super(key: key);

  @override
  State<AllRight> createState() => _AllRightState();
}

class _AllRightState extends State<AllRight> {
  @override
  Widget build(BuildContext context) {
    bool isButtonClick = false;
    return WillPopScope(
      onWillPop: () async {
        exit(0);
      },
      child: Scaffold(
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
              Text(
                Strings.Congrats,
                style: ConstStyle.quickStandMedium,
                textAlign:TextAlign.center,
              ),
              _space,
              _space,
              InkWell(onTap: (){
                setState((){
                  isButtonClick = true;
                });
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomePage()));

              },
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2,color: isButtonClick == false?AppColors.textColor:Color(0xffFF405A)),
                  color: isButtonClick == false
                      ? Colors.white
                      : Color(0xffFF405A),),
                  child: Center(
                      child: Text(
                    "Alright, Continue",
                        style: ConstStyle.quickStandBtn,
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget get _space => const SizedBox(height: 30);
}
