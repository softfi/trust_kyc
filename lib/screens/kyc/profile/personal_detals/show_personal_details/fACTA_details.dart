import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../utils/colorsConstant.dart';
import '../../../../../../utils/styles.dart';
import '../app_textfield.dart';
import 'custom_container.dart';

class FactaDetails extends StatelessWidget {
  const FactaDetails({Key? key}) : super(key: key);

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
                  "FACTA Details",
                  style: ConstStyle.quickMedium,
                ),
              ],
            ),
            _space1,
            Container(
              height: 3,
              width: 130,
              color: AppColors.textColor,
            ),
            const SizedBox(
              height: 10,
            ),
            ShowFactaDetailsWidget()
          ],
        ),
      ),
    );
  }
  Widget get _space => const SizedBox(height: 16);
  Widget get _space1 => const SizedBox(height: 5);


  Widget ShowFactaDetailsWidget(){
    return Column( crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DesableAppText(
          title: 'Where were you born?',
        ),
        _space1,
        DesableTitleText(
            title:"India"),
        _space,
        DesableAppText(
          title: 'Your primary source of wealth?',
        ),
        _space1,
        DesableTitleText(
            title:"Salary"),
        _space,
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
          Expanded(
            child: DesableTitleText(
                title:"Are You A Citizen Of The U.S.A?"),
          ),


          Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            height: 40,
            width: 78,
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(25)),
            child: Row(
              children: [

                SizedBox(width: 3),
                Text(

                     "NO",
                  style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
                SizedBox(width: 3),
                Icon(
                  size: 30,
                  Icons.circle,
                  color: Colors.white,
                )

              ],
            ),
          ),

        ],),
        _space,
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
          Expanded(
            child: DesableTitleText(
                title:"Is Your Country Of Tax Residency, India?"),
          ),


          Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            height: 40,
            width: 78,
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(25)),
            child: Row(
              children: [

                SizedBox(width: 3),
                Text(

                  "NO",
                  style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
                SizedBox(width: 3),
                Icon(
                  size: 30,
                  Icons.circle,
                  color: Colors.white,
                )

              ],
            ),
          ),

        ],)
      ],
    );
  }
}
