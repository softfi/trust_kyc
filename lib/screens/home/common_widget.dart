import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trust_money/utils/images.dart';

import '../../getx_controller/bond/bond_list_data_controller.dart';
import '../../getx_controller/bond/read_more_bond_controller.dart';
import '../../utils/colorsConstant.dart';
import '../bond/bond_advantages.dart';
import '../bond/gold_bond.dart';
import '../bond/read_more_brands/read_more_bonds.dart';
import 'custom_listtile.dart';

class ReadMoreList extends StatelessWidget {
  ReadMoreList({Key? key}) : super(key: key);
  BondListData _bondListData=Get.put(BondListData());
  ReadMoreBond _readMoreBond = Get.put(ReadMoreBond());
  List data = [
    ["MAHINDRA & MAHINDRA FINANCIAL", ""],
    ["CREDITACCESS GRAMEEN LIMITED", "IPO"],
    ["Sovereign Gold Bonds Scheme 2021-22 - Series ", "IPO"],
    ["MAHINDRA & MAHINDRA FINANCIAL", ""],
    ["CREDITACCESS GRAMEEN LIMITED", "IPO"],
    ["Sovereign Gold Bonds Scheme 2021-22 - Series ", "IPO"],
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 445,
      width: double.infinity,
      child: Obx(()=>ListView.builder(
        itemCount: _bondListData.bondList.value.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding:
                const EdgeInsets.only(right: 4.0, top: 2, bottom: 2, left: 12),
            child: Container(
              width: 290,
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(
                  color: Color(0x29000000),
                  blurRadius: 4.0,
                ),
              ], color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: Stack(
                children: [
                  Positioned(
                    top: 20,
                    right: -40,
                    child: Image.asset(
                      ConstantImage.leaf,
                      color: Color(0xff58C3D5),
                      height: 380,
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 0, left: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 12.0),
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: const Color(0xff58C3D5)
                                        .withOpacity(0.35)),
                                child: Center(
                                  child: (_bondListData.bondList.value[index].bondLogo!=null)?Image.network(_bondListData.bondList.value[index].bondLogo,errorBuilder: (context, error, stackTrace) => Image.asset(
                                      ConstantImage.orderImg
                                  ),):Image.asset(
                                      ConstantImage.orderImg
                                  )
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 14.0),
                                child: Text("${_bondListData.bondList.value[index].bondIssuerName}",
                                    style: GoogleFonts.quicksand(
                                      textStyle: const TextStyle(
                                        color: Color(0xff22263D),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    )),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                height: 35,
                                width: 35,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(5)),
                                    color: AppColors.textColor),
                                child: const Center(
                                  child: Icon(
                                    Icons.share,
                                    color: Colors.white,
                                    size: 14,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        color: const Color(0xffD67278).withOpacity(0.11),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 150,
                                child: Column(
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
                                      height: 8,
                                    ),
                                    Text(
                                      "${_bondListData.bondList.value[index].bondCouponAmount}",
                                      style: GoogleFonts.sourceSansPro(
                                        textStyle: const TextStyle(
                                            color: Color(0xffFF405A),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                    ),
                                  ],
                                ),
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
                                    height: 8,
                                  ),
                                  Text(
                                    "${_bondListData.bondList.value[index].bondsYeild??"N/A"}",
                                    style: GoogleFonts.sourceSansPro(
                                      textStyle: const TextStyle(
                                          color: Color(0xffFF405A),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        color: const Color(0xff9BA9AD).withOpacity(0.11),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 150,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Interest Payment",
                                      style: GoogleFonts.sourceSansPro(
                                        textStyle: const TextStyle(
                                            color: Color(0xff1D2B84),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      "${_bondListData.bondList.value[index].bondInterestFrequency}",
                                      style: GoogleFonts.sourceSansPro(
                                        textStyle: const TextStyle(
                                            color: Color(0xffFF405A),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Min. Investment",
                                    style: GoogleFonts.sourceSansPro(
                                      textStyle: const TextStyle(
                                          color: Color(0xff1D2B84),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "${_bondListData.bondList.value[index].bondMinimumApplication}",
                                    style: GoogleFonts.sourceSansPro(
                                      textStyle: const TextStyle(
                                          color: Color(0xffFF405A),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Image.asset(
                        "assets/images/meter.png",
                        fit: BoxFit.fill,
                        height: 125,
                        width: 245,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 38,
                              child: Text(
                                _bondListData.bondList.value[index].bondType==1?"IPO":"",
                                style: GoogleFonts.sourceSansPro(
                                  textStyle: const TextStyle(
                                      color: Color(0xffFF405A),
                                      fontSize: 19,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                               /* // debugPrint("0909999009000090090000090909");
                                // debugPrint(_bondListData.bondList.value[index].bondIsinNumber);
                                _readMoreBond.getReadMoreBondDetails(_bondListData.bondList.value[index].bondIsinNumber);
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => ReadMoreBonds(
                                //               isIPO: _bondListData.bondList.value[index].bondType,
                                //             isinNo:_bondListData.bondList.value[index].bondIsinNumber
                                //             )));
                                _bondListData.bondList.value[index].bondType == 4
                                    ? Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        const GoldBond()))
                                    : Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ReadMoreBonds(
                                          isIPO:  _bondListData.bondList.value[index].bondType,
                                          isinNo: _bondListData.bondList.value[index].bondIsinNumber,
                                        )));*/
                                debugPrint("(_bondListData.bondList.value[index].bondId.toString()"+_bondListData
                                    .bondList.value[index].bondType
                                    .toString());

                                if (_bondListData
                                    .bondList.value[index].bondType ==
                                    1) {
                                  _readMoreBond.getReadMoreBondDetailsByBondID(
                                      _bondListData.bondList.value[index].bondId
                                          .toString());
                                } else if (_bondListData
                                    .bondList.value[index].bondType == 2 || _bondListData.bondList.value[index].bondType == 3) {
                                  _readMoreBond.getReadMoreBondDetails(
                                      _bondListData.bondList.value[index]
                                          .bondIsinNumber);
                                }
                                /*_readMoreBond.getReadMoreBondDetails(
                                   "INE296A07SD9");*/

                                _bondListData.bondList.value[index]
                                    .bondIsinNumber ==
                                    "4"
                                    ? Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        const GoldBond()))
                                    : Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ReadMoreBonds(
                                          /*isIPO: _bondListData.bondList
                                                      .value[index].bondType,*/
                                          isIPO: _bondListData
                                              .bondList.value[index].bondType,
                                          isinNo: _bondListData
                                              .bondList
                                              .value[index]
                                              .bondIsinNumber,
                                        )));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xffFF405A),
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0x29000000),
                                      blurRadius: 5.0,
                                    ),
                                  ],
                                  // gradient: const LinearGradient(
                                  //   colors: [
                                  //     Color(0xffEC515F),
                                  //     Color(0xffC4414D),
                                  //   ],
                                  //   begin: Alignment.centerRight,
                                  //   end: Alignment.centerLeft,
                                  // ),
                                ),
                                child: Center(
                                    child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 35.0, vertical: 12),
                                  child: Text("Read More",
                                      style: GoogleFonts.quicksand(
                                        textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                        ),
                                      )),
                                )),
                              ),
                            ),
                            const SizedBox(
                              width: 38,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      )),
    );
  }
}

class SeekhoWidget extends StatelessWidget {
  const SeekhoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Text("Seekho toh sirf",
              style: GoogleFonts.quicksand(
                textStyle: const TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
              )),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            children: [
              Text("Bond, Trust Bond ",
                  style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                        color: Color(0xffFF405A),
                        fontWeight: FontWeight.w700,
                        fontSize: 28),
                  )),
              Text("se",
                  style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 23),
                  )),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(
            "Learn your smart investment moves from the best so far???",
            style: GoogleFonts.quicksand(
                textStyle: const TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 15)),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 2,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
              child: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.20),
                    spreadRadius: 2,
                    blurRadius: 11,
                    offset: const Offset(0, 3),
                  ),
                ], color: Colors.white, borderRadius: BorderRadius.circular(8)),
                child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: CustomListTile(
                      readText: '5 min read',
                      title: 'What are 54EC Bonds or Capital Gain Bonds',
                      image: Image.asset(
                        ConstantImage.dummy_pic,
                      ),
                      date: 'Jan 24, 2022',
                    )),
              ),
            );
          },
        ),

      ],
    );
  }
}
