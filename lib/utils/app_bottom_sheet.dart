import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colorsConstant.dart';

class AppBottomSheet {
   int investmentIndex = 0;
   void showSortingBottomSheet(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      isScrollControlled: true,
      shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(35),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (BuildContext context, State) {
          return Padding(
            padding: EdgeInsets.only(
                top: 0,
                right: 0,
                left: 0,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Wrap(
              children: [
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    color: AppColors.primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 80.0),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Align(
                            alignment: Alignment.topRight,
                            child: Icon(Icons.clear,
                                color: Colors.white, size: 25),
                          ),
                          Text(
                            "SORT BY",
                            style: GoogleFonts.quicksand(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                          ),
                          const SizedBox(height: 15,),
                          Text(
                            "Investment",
                            style: GoogleFonts.quicksand(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500)),
                          ),
                          const Divider(thickness: 1.5,color: AppColors.greyColor,),
                          const SizedBox(height: 15,),
                          Text(
                            "Investment",
                            style: GoogleFonts.quicksand(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500)),
                          ),
                          const Divider(thickness: 1.5,color: AppColors.greyColor,),

                          Row(mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  State(() {
                                    investmentIndex = 1;
                                  });
                                },
                                child: Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color(0x29000000),
                                          blurRadius: 6.0,
                                        ),
                                      ],
                                      border:
                                      Border.all(width: 1, color: Colors.white),
                                      color: investmentIndex == 1
                                          ? Colors.white
                                          : Color(0xff22263D)),
                                  child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12.0),
                                        child: Text(
                                          "Male",
                                          style: GoogleFonts.sourceSansPro(
                                            textStyle: TextStyle(
                                                color: investmentIndex == 1
                                                    ? Color(0xff22263D)
                                                    : Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15),
                                          ),
                                        ),
                                      )),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              InkWell(
                                onTap: () {
                                  State(() {
                                    investmentIndex = 2;
                                  });
                                },
                                child: Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color(0x29000000),
                                          blurRadius: 6.0,
                                        ),
                                      ],
                                      border:
                                      Border.all(width: 1, color: Colors.white),
                                      color: investmentIndex == 2
                                          ? Colors.white
                                          : Color(0xff22263D)),
                                  child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12.0),
                                        child: Text(
                                          "Female",
                                          style: GoogleFonts.sourceSansPro(
                                            textStyle: TextStyle(
                                                color: investmentIndex == 2
                                                    ? Color(0xff22263D)
                                                    : Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15),
                                          ),
                                        ),
                                      )),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          );
        });
      },
    );
  }
}
