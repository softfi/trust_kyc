import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../utils/colorsConstant.dart';
import '../../../../../../utils/styles.dart';
import '../../app_textfield.dart';
import '../custom_container.dart';
import '../show_personal_details.dart';

class TmAccountDetails extends StatelessWidget {
  const TmAccountDetails({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 15),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: const Color(0xffF7F7FA).withOpacity(0.35),
            border: Border.all(width: 1.2, color: const Color(0xffbcbcbc))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [


                Text(
                  "TM Account Details",
                  style: ConstStyle.quickMedium,
                ),
              ],
            ),
            _space1,
            Container(
              height: 3,
              width: 180,
              color: AppColors.textColor,
            ),
            const SizedBox(
              height: 10,
            ),
            ShowTmAccountDetailsWidget()
          ],
        ),
      ),
    );
  }
  Widget get _space => const SizedBox(height: 16);
  Widget get _space1 => const SizedBox(height: 5);


  Widget ShowTmAccountDetailsWidget(){
    return Column( crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DesableAppText(
          title: 'Client ID',
        ),
        _space1,
        DesableTitleText(
            title:"18622340"),
        _space,
        DesableAppText(
          title: 'Activation Date',
        ),
        _space1,
        DesableTitleText(
            title:"12/09/2022"),
        _space,
        DesableAppText(
          title: 'Relationship Manager',
        ),
        _space1,
        DesableTitleText(
            title:"Pravin Parmar"),
        _space,
      ],
    );
  }
}
