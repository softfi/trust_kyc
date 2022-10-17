import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colorsConstant.dart';
import '../../utils/images.dart';
import '../../utils/styles.dart';

class ExploreAllBonds extends StatefulWidget {
  final void Function() onClick;
  const ExploreAllBonds({Key? key, required this.onClick,}) : super(key: key);

  @override
  State<ExploreAllBonds> createState() => _ExploreAllBondsState();
}

class _ExploreAllBondsState extends State<ExploreAllBonds> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        readBondWidget(),
      ],
    );
  }

  Widget readBondWidget(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 5,),
        Container(
          height: 60,
          decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(0x29000000),
                  blurRadius: 3.0,
                ),
              ],
              color: Colors.white
          ),
          child: TextFormField(
            decoration: InputDecoration(
                fillColor: Colors.white54,
                filled: true,
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 20),
                hintText: "Bond name, issuer and bond type",
                prefixIcon: const Icon(Icons.search),
                suffixIcon: InkWell(
                  onTap: () {},
                  child: Container(
                    width: 100,
                    decoration: const BoxDecoration(
                      color: AppColors.textColor,
                      boxShadow: [],
                    ),
                    child: Center(
                        child: Text(
                          "Search",
                          style: GoogleFonts.sourceSansPro(
                            textStyle: const TextStyle(
                                color: Colors.white, fontSize: 15),
                          ),
                        )),
                  ),
                )),
          ),
        ),
        const SizedBox(height: 15,),
        Container(
          height: 50,
          decoration:  BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Color(0x29000000),
                  blurRadius: 3.0,
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(5)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text("Filter",style:ConstStyle.quickStandBtn ,),
                    const SizedBox(width: 6,),
                    SvgPicture.asset(
                      ConstantImage.filter,
                      width: 20,
                      height: 20,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text("Sort by",style:ConstStyle.quickStandBtn ,),
                    const SizedBox(width: 6,),
                    SvgPicture.asset(
                      ConstantImage.sorting,
                      width: 20,
                      height: 20,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        bondList(),


      ],
    );
  }

  Widget bondList(){
    return ListView.builder(
        itemCount: 15,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(
                  color: Color(0x29000000),
                  blurRadius: 2.0,
                ),
              ], color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 30,
                      width: 40,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(5)),
                          color: AppColors.textColor),
                      child: const Center(
                        child: Icon(
                          Icons.share,
                          color: Colors.white,
                          size: 14,
                        ),),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          "M",
                          style: GoogleFonts.sourceSansPro(
                            textStyle: const TextStyle(
                              color: Color(0xff22263D),
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20,),
                      Text("MAHINDRA & MAHINDRA FINANCIAL",
                          style: GoogleFonts.sourceSansPro(
                            textStyle: const TextStyle(
                              color: Color(0xff22263D),
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ))
                    ],
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.55,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Coupon",
                                        style: GoogleFonts.sourceSansPro(
                                          textStyle: const TextStyle(
                                              color: Color(0xff1D2B84),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        "8.00%",
                                        style: GoogleFonts.sourceSansPro(
                                          textStyle: const TextStyle(
                                              color: Color(0xffFF405A),
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
                                        "Yield",
                                        style: GoogleFonts.sourceSansPro(
                                          textStyle: const TextStyle(
                                              color: Color(0xff1D2B84),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        "10.60%",
                                        style: GoogleFonts.sourceSansPro(
                                          textStyle: const TextStyle(
                                              color: Color(0xffFF405A),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Invest Payment",
                                        style: GoogleFonts.sourceSansPro(
                                          textStyle: const TextStyle(
                                              color: Color(0xff1D2B84),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        "Annual",
                                        style: GoogleFonts.sourceSansPro(
                                          textStyle: const TextStyle(
                                              color: Color(0xffFF405A),
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
                                        "Min. Invest",
                                        style: GoogleFonts.sourceSansPro(
                                          textStyle: const TextStyle(
                                              color: Color(0xff1D2B84),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        "Annual",
                                        style: GoogleFonts.sourceSansPro(
                                          textStyle: const TextStyle(
                                              color: Color(0xffFF405A),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.35,
                        child: Image.asset(
                          "assets/images/meter.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),


                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      children: [
                        Text(
                          "IPO",
                          style: GoogleFonts.sourceSansPro(
                            textStyle: const TextStyle(
                                color: Color(0xffFF405A),
                                fontSize: 19,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 108,
                        ),
                        InkWell(onTap: () {
                          setState((){
                            widget.onClick();
                          });
                        },
                          child: Container(
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: const Color(0xffC4414D),
                            ),
                            child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                  child: Text("Read More",
                                      style: ConstStyle.quickStandSmall),
                                )),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
