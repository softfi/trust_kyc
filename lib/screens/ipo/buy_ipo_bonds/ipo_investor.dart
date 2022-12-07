import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/colorsConstant.dart';
import '../../../utils/styles.dart';

class IPOsInvestor extends StatelessWidget {
  IPOsInvestor({Key? key}) : super(key: key);

  String individualText = "Individual";
  String catText = "Category IV";
  var individualLIst = [
    'Individual',
    'Text1',
    'Text2',
    'Text3',
  ];

  var categoryList = [
    'Category IV',
    'Category V',
    'Category VI',
    'Category VII',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "*Company shall allocate and allot Series IV NCDs wherein the Applicants have not indicated the choice of the relevant NCD Series.",
          style: GoogleFonts.sourceSansPro(
            textStyle: const TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.w500,
                fontSize: 12),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xffFFB4BB).withOpacity(0.11),
                Color(0xff84F5FF).withOpacity(0.11),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.50,
                      child: Text(
                        "INVESTOR Type",
                        style: GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 13),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 8),
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.33,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.11),
                            spreadRadius: 5,
                            blurRadius: 3,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          hint: const Text("Individual",
                              style: TextStyle(
                                  color: Color(0xffC8C7CE), letterSpacing: 2)),
                          items: individualLIst.map((item) {
                            return DropdownMenuItem(
                                value: item, child: Text(item));
                          }).toList(),
                          onChanged: (String? value) {
                            // This is called when the user selects an item.
                            print("==========upi $value");
                            print("==========upi $individualText");
                            individualText = value!;
                          },
                          value: individualText,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.50,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "INVESTOR CATEGORY",
                            style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13),
                            ),
                          ),
                          Text(
                            "For the Complete List of categories Click Here",
                            style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 8),
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.33,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.11),
                            spreadRadius: 5,
                            blurRadius: 3,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          hint: const Text("Individual",
                              style: TextStyle(
                                  color: Color(0xffC8C7CE), letterSpacing: 2)),
                          items: categoryList.map((item) {
                            return DropdownMenuItem(
                                value: item, child: Text(item));
                          }).toList(),
                          onChanged: (String? value) {
                            // This is called when the user selects an item.
                            print("==========upi $value");
                            print("==========upi $catText");
                            catText = value!;
                          },
                          value: catText,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.50,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "SUBCATEGORY",
                            style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13),
                            ),
                          ),
                          Text(
                            "For the Complete List of sub categories Click here",
                            style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 15),
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.33,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xffE3E2E5),
                            Color(0xffC8C7CE),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.11),
                            spreadRadius: 5,
                            blurRadius: 3,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Text(
                        "41",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 13),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50.0, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "First Applicant",
                          style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 12),
                          ),
                        ),
                        Text(
                          "Pravin Parmar",
                          style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 13),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "PAN",
                          style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 12),
                          ),
                        ),
                        Text(
                          "AGPP5456B",
                          style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 13),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  "Second Applicant",
                  style: ConstStyle.sourceSansPro,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                ),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 1, color: AppColors.borderColor),
                  ),
                  child: TextField(
                    autofocus: false,
                    style: ConstStyle.sourceSans5,
                    textCapitalization: TextCapitalization.words,
                    decoration: const InputDecoration(
                      hintStyle: TextStyle(color: Color(0xffC8C7CE)),
                      border: InputBorder.none,
                      fillColor: Colors.white,
                      contentPadding:
                          EdgeInsets.only(left: 14.0, bottom: 7.0, top: 6.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  "Second Applicant PAN",
                  style: ConstStyle.sourceSansPro,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                ),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 1, color: AppColors.borderColor),
                  ),
                  child: TextField(
                    autofocus: false,
                    style: ConstStyle.sourceSans5,
                    textCapitalization: TextCapitalization.words,
                    decoration: const InputDecoration(
                      hintStyle: TextStyle(color: Color(0xffC8C7CE)),
                      border: InputBorder.none,
                      fillColor: Colors.white,
                      contentPadding:
                          EdgeInsets.only(left: 14.0, bottom: 7.0, top: 6.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  "Third Applicant",
                  style: ConstStyle.sourceSansPro,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                ),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 1, color: AppColors.borderColor),
                  ),
                  child: TextField(
                    autofocus: false,
                    style: ConstStyle.sourceSans5,
                    textCapitalization: TextCapitalization.words,
                    decoration: const InputDecoration(
                      hintStyle: TextStyle(color: Color(0xffC8C7CE)),
                      border: InputBorder.none,
                      fillColor: Colors.white,
                      contentPadding:
                          EdgeInsets.only(left: 14.0, bottom: 7.0, top: 6.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  "Third Applicant PAN",
                  style: ConstStyle.sourceSansPro,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                ),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 1, color: AppColors.borderColor),
                  ),
                  child: TextField(
                    autofocus: false,
                    style: ConstStyle.sourceSans5,
                    textCapitalization: TextCapitalization.words,
                    decoration: const InputDecoration(
                      hintStyle: TextStyle(color: Color(0xffC8C7CE)),
                      border: InputBorder.none,
                      fillColor: Colors.white,
                      contentPadding:
                          EdgeInsets.only(left: 14.0, bottom: 7.0, top: 6.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ],
    );
    ;
  }
}
