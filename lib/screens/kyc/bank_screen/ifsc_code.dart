import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rotated_corner_decoration/rotated_corner_decoration.dart';
import 'package:trust_money/utils/colorsConstant.dart';
import 'package:trust_money/utils/styles.dart';

import '../../../utils/app_bar.dart';

class SearchIFSC extends StatefulWidget {
  const SearchIFSC({Key? key}) : super(key: key);

  @override
  State<SearchIFSC> createState() => _SearchIFSCState();
}

class _SearchIFSCState extends State<SearchIFSC> {
  String? bankNames;
  String? branchNames;
  bool isIFSCDone = false;
  bool cardDetails = false;
  bool bankView = false;

  var bankList = [
    'Bank Option 1',
    'Bank Option 2',
    'Bank Option 3',
    'Bank Option 4',
    'Bank Option 5',
    'Bank Option 6',
  ];
  var branchList = [
    'Branch Option 1',
    'Branch Option 2',
    'Branch Option 3',
    'Branch Option 4',
    'Branch Option 5',
    'Branch Option 6',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppToolbar.appBar(
          "Search for IFSC",
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          IconButton(
            icon: Container(
                padding: const EdgeInsets.all(1),
                decoration: const BoxDecoration(
                    color: Colors.transparent, shape: BoxShape.circle),
                child: const Icon(Icons.person,
                    size: 20, color: Colors.transparent)),
            onPressed: () {},
          )),
 /*     appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: Column(
          children: [
            Container(
              height: 80,
              color: Color(0xff00C6D8),
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        Text(
                          "Search for IFSC",
                          style: ConstStyle.quickStandSmall11,
                        ),
                        Container(
                          width: 50,
                        )
                      ],
                    ),
                    Positioned(
                      left: 0,
                      bottom: -1,
                      child: RotatedBox(
                        quarterTurns: 2,
                        child: Material(
                          elevation: 0,
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: const BoxDecoration(
                              color: Color(0xff00C6D8),
                            ),
                            foregroundDecoration: const RotatedCornerDecoration(
                              color: Colors.redAccent,
                              geometry:
                              BadgeGeometry(width: 20, height: 20, cornerRadius: 0),
                            ),
                            child: Container(
                                color: Color(0xff00C6D8)
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: -1,
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: Material(
                          elevation: 0,
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: const BoxDecoration(
                              color: Color(0xff00C6D8),
                            ),
                            foregroundDecoration: const RotatedCornerDecoration(
                              color: Colors.redAccent,
                              geometry:
                              BadgeGeometry(width: 20, height: 20, cornerRadius: 0),
                            ),
                            child: Container(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RotatedBox(
                    quarterTurns: 1,
                    child: Material(
                      elevation: 0,
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                          color: Colors.redAccent,
                        ),
                        foregroundDecoration: const RotatedCornerDecoration(
                          color: Colors.white,
                          geometry: BadgeGeometry(
                              width: 30, height: 28, cornerRadius: 0),
                        ),
                        child: Container(),
                      ),
                    ),
                  ),
                  RotatedBox(
                    quarterTurns: 2,
                    child: Material(
                      elevation: 0,
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                          color: Colors.redAccent,
                        ),
                        foregroundDecoration: const RotatedCornerDecoration(
                          color: Colors.white,
                          geometry: BadgeGeometry(
                              width: 28, height: 30, cornerRadius: 0),
                        ),
                        child: Container(),
                      ),
                    ),
                  ),
                ],
              ),),
          ],
        ),
      ),*/
      body: Stack(
        fit: StackFit.expand,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 35.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  bankIFSC(),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            child: RotatedBox(
              quarterTurns: 2,
              child: Material(
                elevation: 0,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  foregroundDecoration: const RotatedCornerDecoration(
                    color: Colors.redAccent,
                    geometry:
                        BadgeGeometry(width: 25, height: 25, cornerRadius: 0),
                  ),
                  child: Container(),
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: RotatedBox(
              quarterTurns: 1,
              child: Material(
                elevation: 0,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  foregroundDecoration: const RotatedCornerDecoration(
                    color: Colors.redAccent,
                    geometry:
                        BadgeGeometry(width: 25, height: 25, cornerRadius: 0),
                  ),
                  child: Container(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bankIFSC() {
    return Padding(
      padding: const EdgeInsets.all(
        8.0,
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: const Color(0xffF7F7FA).withOpacity(0.35),
            border: Border.all(width: 1.2, color: const Color(0xffbcbcbc))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                "Bank Name ",
                style: GoogleFonts.sourceSansPro(
                  textStyle: const TextStyle(
                      color: Color(0xff22263D),
                      fontWeight: FontWeight.w500,
                      fontSize: 12),
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              Container(
                  height: 45,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border:
                        Border.all(width: 1.1, color: AppColors.borderColor),
                    color: Colors.white,
                  ),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14.0),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          hint: const Text("Please Select Bank",
                              style: TextStyle(
                                  color: Color(0xffC8C7CE), letterSpacing: 2)),
                          items: bankList.map((item) {
                            return DropdownMenuItem(
                                value: item, child: Text(item));
                          }).toList(),
                          onChanged: (String? newVal) {
                            setState(() {
                              bankNames = newVal;
                              print(bankNames.toString());
                            });
                          },
                          value: bankNames,
                        ),
                      ))),
              const SizedBox(
                height: 25,
              ),
              banks(),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Bank Branch ",
                style: GoogleFonts.sourceSansPro(
                  textStyle: const TextStyle(
                      color: Color(0xff22263D),
                      fontWeight: FontWeight.w500,
                      fontSize: 12),
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              Container(
                  height: 45,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border:
                        Border.all(width: 1.1, color: AppColors.borderColor),
                    color: Colors.white,
                  ),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14.0),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          hint: const Text("Select Branch",
                              style: TextStyle(
                                  color: Color(0xffC8C7CE), letterSpacing: 2)),
                          items: branchList.map((item) {
                            return DropdownMenuItem(
                                value: item, child: Text(item));
                          }).toList(),
                          onChanged: (String? newVal) {
                              setState(() {
                                branchNames = newVal;
                                print(branchNames.toString());
                                isIFSCDone = true;
                                bankView = true;
                              });
                          },
                          value: branchNames,
                        ),
                      ))),
              const SizedBox(
                height: 20,
              ),
              Visibility(visible: isIFSCDone,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Bank Detail ",
                      style: GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                            color: Color(0xff22263D),
                            fontWeight: FontWeight.w500,
                            fontSize: 12),
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Container( width: MediaQuery
                        .of(context)
                        .size
                        .width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(width: 1, color: const Color(0xffE1E0E6))),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("State Bank of India",style: GoogleFonts.sourceSansPro(
                              textStyle: const TextStyle(
                                  color: Color(0xff22263d), fontWeight: FontWeight.w500, fontSize: 20,letterSpacing: 1),
                            ),),
                            const SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "IFSC Code",
                                      style: GoogleFonts.sourceSansPro(
                                        textStyle: const TextStyle(
                                            color: Color(0xff90929E),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12),
                                      ),
                                    ),
                                    const SizedBox(height: 5,),
                                    Text(
                                      "SBIN0012782",
                                      style: GoogleFonts.sourceSansPro(
                                        textStyle: const TextStyle(
                                            color: Color(0xff22263D),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 13),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 120,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Branch",
                                      style: GoogleFonts.sourceSansPro(
                                        textStyle: const TextStyle(
                                            color: Color(0xff90929E),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12),
                                      ),
                                    ),
                                    const SizedBox(height: 5,),
                                    Text(
                                      "Fairlands",
                                      style: GoogleFonts.sourceSansPro(
                                        textStyle: const TextStyle(
                                            color: Color(0xff22263D),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 13),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(height: 16,),
                            Text(
                              "Address",
                              style: GoogleFonts.sourceSansPro(
                                textStyle: const TextStyle(
                                    color: Color(0xff90929E),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12),
                              ),
                            ),
                            const SizedBox(height: 5,),
                            Text(
                              "Bank House, Cherry Road, Salem 636007.",
                              style: GoogleFonts.sourceSansPro(
                                textStyle: const TextStyle(
                                    color: Color(0xff22263D),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.08,),
                    InkWell(onTap: (){
                      Navigator.pop(context);
                    },
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 2, color: AppColors.borderColor),
                        ),
                        child:Center(
                          child: Text(
                            "Continue",
                            style: GoogleFonts.quicksand(
                              textStyle: TextStyle(
                                  color: AppColors.textColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 25,),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget banks() {
    return GridView.builder(
      shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 2.66,
            mainAxisSpacing: 8,
            crossAxisSpacing: 10,
            crossAxisCount: 3),
        itemCount: 6,
        itemBuilder: (BuildContext ctx, index) {
          return Container(
            // height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 0.5, color: Color(0xffE1E0E6))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/sbi.png",height: 20,width: 20,),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "SBI Bank",
                    style: GoogleFonts.sourceSansPro(
                      textStyle: const TextStyle(
                        color: Color(0xff22263D), fontWeight: FontWeight.w500, fontSize: 15,),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
