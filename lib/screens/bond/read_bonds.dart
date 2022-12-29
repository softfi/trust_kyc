import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rotated_corner_decoration/rotated_corner_decoration.dart';
import 'package:trust_money/screens/bond/gold_bond.dart';
import 'package:trust_money/screens/bond/read_more_brands/read_more_bonds.dart';
import 'package:trust_money/bottom_sheets/bond_filter_bottom_sheet.dart';
import 'package:trust_money/utils/colorsConstant.dart';
import 'package:trust_money/utils/images.dart';
import 'package:trust_money/utils/styles.dart';

import '../../bottom_navigation/bottom_navigation.dart';
import '../../getx_controller/bond/bond_list_data_controller.dart';
import '../../getx_controller/bond/read_more_bond_controller.dart';
import '../../utils/app_bar.dart';

class ReadBonds extends StatefulWidget {
  const ReadBonds({Key? key}) : super(key: key);

  @override
  State<ReadBonds> createState() => _ReadBondsState();
}

class _ReadBondsState extends State<ReadBonds> {
  int investmentIndex = 0;
  int safetyIndex = 0;
  int yieldIndex = 0;
  int tenureIndex = 0;
  int paymentIndex = 0;
  BondListData _bondListData=Get.put(BondListData());
  ReadMoreBond _readMoreBond = Get.put(ReadMoreBond());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CustomBottomNavigation(
                      currentIndex: 0,
                    )));
      },
      child: Scaffold(
        backgroundColor: const Color(0xffffffff).withOpacity(0.50),
        appBar: AppToolbar.appBar(
            "EXPLORE BONDS",
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
            IconButton(
              icon: const Icon(Icons.notifications_none, color: Colors.white),
              onPressed: () {},
            )),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              children: [
                readBondWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget readBondWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 5,
        ),
        Container(
          height: 60,
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
              color: Color(0x29000000),
              blurRadius: 3.0,
            ),
          ], color: Colors.white),
          child: TextFormField(
            decoration: InputDecoration(
                fillColor: Colors.white54,
                filled: true,
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 20),
                hintText: "Bond name, issuer and bond type",
                hintStyle: GoogleFonts.sourceSansPro(
                  textStyle: const TextStyle(
                      color: Color(0xffC8C7CD),
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Color(0xffC8C7CD),
                ),
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
                        textStyle:
                            const TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    )),
                  ),
                )),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          height: 50,
          decoration: BoxDecoration(boxShadow: const [
            BoxShadow(
              color: Color(0x29000000),
              blurRadius: 3.0,
            ),
          ], color: Colors.white, borderRadius: BorderRadius.circular(5)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 13.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () async {
                    await AppBottomSheet.showFilterBottomSheet(
                        context,
                        investmentIndex,
                        safetyIndex,
                        paymentIndex,
                        yieldIndex,
                        tenureIndex);
                  },
                  child: Row(
                    children: [
                      Text(
                        "Filter",
                        style: GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                              color: Color(0xff22263D),
                              fontWeight: FontWeight.w600,
                              fontSize: 15),
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      SvgPicture.asset(ConstantImage.filter,
                          width: 20,
                          height: 20,
                          color: const Color(0xff22263D)),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () async {
                    await AppBottomSheet.showSortingBottomSheet(context,
                        investmentIndex, safetyIndex, yieldIndex, tenureIndex);
                  },
                  child: Row(
                    children: [
                      Text(
                        "Sort by ",
                        style: GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                              color: Color(0xff22263D),
                              fontWeight: FontWeight.w600,
                              fontSize: 15),
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      SvgPicture.asset(
                        ConstantImage.sorting,
                        width: 20,
                        height: 20,
                        color: Color(0xff22263D),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        bondList(),
      ],
    );
  }


  Widget bondList() {
    return ListView.builder(
        itemCount: _bondListData.bondList.value.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
            ),
            child: Container(
              padding: EdgeInsets.only(left: 8),
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(
                  color: Color(0x29000000),
                  blurRadius: 2.0,
                ),
              ], color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Image.asset(
                      ConstantImage.leaf,
                      color: Color(0xff58C3D5),
                      height: 280,
                      width: 143,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 12.0, left: 0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  child: Image.network(_bondListData.bondList.value[index].bondLogo,fit: BoxFit.cover,errorBuilder: (context, error, stackTrace) => Image.asset(
                                    (ConstantImage.orderImg),
                                    fit: BoxFit.cover,
                                  )),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    // image: DecorationImage(image: AssetImage(ConstantImage.collection_container_bg))
                                  ),
                                ),
                                // Text(
                                //   "M",
                                //   style: GoogleFonts.sourceSansPro(
                                //     textStyle: const TextStyle(
                                //       color: Color(0xff22263D),
                                //       fontWeight: FontWeight.bold,
                                //       fontSize: 22,
                                //     ),
                                //   ),
                                // ),
                                const SizedBox(
                                  width: 15,
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text("${_bondListData.bondList.value[index].bondIssuerName}",
                                      maxLines: 2,
                                      softWrap: true,
                                      style: GoogleFonts.quicksand(
                                        textStyle: const TextStyle(
                                          color: Color(0xff22263D),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      )),
                                ),
                              ],
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
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.55,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  color:
                                      const Color(0xffD67278).withOpacity(0.11),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0, vertical: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.28,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Coupon",
                                                style:
                                                    GoogleFonts.sourceSansPro(
                                                  textStyle: const TextStyle(
                                                      color: Color(0xff1D2B84),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 4,
                                              ),
                                              Text(
                                                "${_bondListData.bondList.value[index].bondCouponRate}",
                                                style:
                                                    GoogleFonts.sourceSansPro(
                                                  textStyle: const TextStyle(
                                                      color: Color(0xffFF405A),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Yield",
                                              style: GoogleFonts.sourceSansPro(
                                                textStyle: const TextStyle(
                                                    color: Color(0xff1D2B84),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              "${_bondListData.bondList.value[index].bondsYeild??"N/A"}",
                                              style: GoogleFonts.sourceSansPro(
                                                textStyle: const TextStyle(
                                                    color: Color(0xffFF405A),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  color:
                                      const Color(0xff9BA9AD).withOpacity(0.11),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0, vertical: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.28,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Interest Payment",
                                                style:
                                                    GoogleFonts.sourceSansPro(
                                                  textStyle: const TextStyle(
                                                      color: Color(0xff1D2B84),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 4,
                                              ),
                                              Text(
                                                "${_bondListData.bondList.value[index].bondInterestFrequency}",
                                                style:
                                                    GoogleFonts.sourceSansPro(
                                                  textStyle: const TextStyle(
                                                      color: Color(0xffFF405A),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Min. Invest",
                                              style: GoogleFonts.sourceSansPro(
                                                textStyle: const TextStyle(
                                                    color: Color(0xff1D2B84),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              "${_bondListData.bondList.value[index].bondMinimumApplication}",
                                              style: GoogleFonts.sourceSansPro(
                                                textStyle: const TextStyle(
                                                    color: Color(0xffFF405A),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.35,
                            child: Image.asset(
                              "assets/images/meter.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 35,
                              child: Text(
                                _bondListData.bondList.value[index].bondType==1?"IPO":"",
                                style: GoogleFonts.sourceSansPro(
                                  textStyle: const TextStyle(
                                      color: Color(0xffFF405A),
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                debugPrint(_bondListData.bondList.value[index].bondId.toString());

                                if(_bondListData.bondList.value[index].bondType==1){
                                  _readMoreBond.getReadMoreBondDetailsByBondID(_bondListData.bondList.value[index].bondId.toString());
                                }


                                _readMoreBond.getReadMoreBondDetails(_bondListData.bondList.value[index].bondIsinNumber);

                                _bondListData.bondList.value[index].bondIsinNumber=="4"
                                    ? Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const GoldBond()))
                                    : Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ReadMoreBonds(
                                                  isIPO: _bondListData.bondList.value[index].bondType,
                                              isinNo: _bondListData.bondList.value[index].bondIsinNumber,
                                                )));
                              },
                              child: Container(
                                height: 35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Color(0x29000000),
                                        blurRadius: 5.0,
                                      ),
                                    ],
                                    color: Color(0xffFF405A)
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
                                      horizontal: 40.0),
                                  child: Text("Read More",
                                      style: GoogleFonts.quicksand(
                                        textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                        ),
                                      )),
                                )),
                              ),
                            ),
                            Container(
                              width: 35,
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
        });
  }
}
