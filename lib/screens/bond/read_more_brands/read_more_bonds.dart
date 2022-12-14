import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trust_money/bottom_sheets/bottom_sheet.dart';
import 'package:trust_money/screens/Congratulations/alert_dialog.dart';
import 'package:trust_money/screens/bond/ipo/buy_ipo_bonds/nonipo_buy_bonds.dart';
import 'package:trust_money/screens/bond/tringle.dart';
import 'dart:math' as math;
import '../../../getx_controller/bond/read_more_bond_controller.dart';
import '../../../utils/app_bar.dart';
import '../../../utils/colorsConstant.dart';
import '../../../utils/images.dart';
import '../../../utils/sharedPreference.dart';
import '../../home/custom_listtile.dart';
import '../../news_and_insights/explore.dart';
import '../common_widget.dart';
import '../ipo/buy_ipo_bonds/buy_ipo_bond.dart';
import '../ipo/buy_ipo_bonds/constWidget.dart';
import '../ipo/buy_ipo_bonds/ncds_series.dart';
import '../ipo/nonipo_ncds.dart';

class ReadMoreBonds extends StatefulWidget {
  ReadMoreBonds({Key? key, required this.isIPO, required this.isinNo})
      : super(key: key);
  int isIPO;
  String isinNo;

  @override
  State<ReadMoreBonds> createState() => _ReadMoreBondsState();
}

class _ReadMoreBondsState extends State<ReadMoreBonds> {

  BuyNonIpoBonds _buyNonIpoBonds=Get.put(BuyNonIpoBonds());
  List data = [
    "This bond can be considered for medium term Investment purpose with annual returns. Coupon is 13.75% i.e you will receive Rs. 137,500.0 annual interest for every 10 lac Investment. It has call option on 24-Jan-2025.",
    "The bond issuer is of type Private Sector Bank. The Issuer raised total Rs. 500.0 Cr for this bond.",
    "Use of Proceeds: Augmentation of tier-i capital to strengthen its capital adequacy and to enhance long-term resources.",
    "It is rated A- by IND with STABLE outlook.",
  ];

  bool userIsLoggedIn = false;
  ReadMoreBond _readMoreBond = Get.put(ReadMoreBond());
RxInt a=1.obs;
  getLoggedInState() async {
    await HelperFunctions.getuserLoggedInSharedPreference().then((value) {
      setState(() {
        userIsLoggedIn = value!;
        print("====00001 $userIsLoggedIn");
      });
    });
  }

  @override
  void initState() {
    getLoggedInState();
    debugPrint(widget.isIPO.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(()=>((_readMoreBond.allBondListOfIpoByBondId.value !=null))?Scaffold(
        backgroundColor: Colors.white,
        appBar: AppToolbar.appBar(
            "${_readMoreBond.allBondListOfIpoByBondId.value!.bondIssuerName??""}",
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
            Container(
              width: 50,
            )),
        body:
        Obx((){
          return (_readMoreBond.allBondListOfIpoByBondId.value !=null)?SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0x29000000),
                                      blurRadius: 5.0,
                                    ),
                                  ],
                                  color: Colors.white),
                              child: readBondWidget()),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: keyHighlightWidget() //investment(),
                            ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.0),
                          child: CommonWidget.issuer(context),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CommonWidget.invest(),
                        const SizedBox(
                          height: 30,
                        ),
                        CommonWidget.subscribe(),
                        const SizedBox(
                          height: 30,
                        ),
                        CommonWidget.needHelp(),
                      ],
                    ),
                  ):Center(child: CircularProgressIndicator());
        })):Center(child: CircularProgressIndicator(),));
  }

  Widget readBondWidget() {
    return Stack(
      children: [
        Positioned(
          top: 30,
          right: -4,
          child: Image.asset(
            ConstantImage.leaf,
            color: Color(0xff00C6D8),
            height: 400,
          ),
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 60,
                  width: 50,
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: (_readMoreBond.allBondListOfIpoByBondId.value!.bondLogo !=
                          null)
                      ? Image.network(
                      _readMoreBond.allBondListOfIpoByBondId.value!.bondLogo,
                          errorBuilder: (context, error, stackTrace) =>
                              Image.asset(ConstantImage.orderImg))
                      : Image.asset(ConstantImage.orderImg),
                ),
                const SizedBox(
                  width: 13,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: Text(
                      "${_readMoreBond.allBondListOfIpoByBondId.value!.bondIssuerName??""}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                          color: Color(0xff22263D),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      )),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                widget.isIPO == 3 || widget.isIPO==2
                    ? Container(
                        height: 35,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(12)),
                            color: AppColors.greenColor),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Center(
                            child: Text(
                              "Returns Based On Gold Prices",
                              style: GoogleFonts.sourceSansPro(
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    : Container(),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  height: 35,
                  decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(12)),
                      color: AppColors.greyColor),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "ISIN: ",
                                style: GoogleFonts.sourceSansPro(
                                  textStyle: const TextStyle(
                                    color: Color(0xffFF405A),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10,
                                  ),
                                )),
                            TextSpan(
                                text: _readMoreBond.allBondListOfIpoByBondId.value!.bondIsinNumber,
                                style: GoogleFonts.sourceSansPro(
                                  textStyle: const TextStyle(
                                    color: AppColors.textColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10,
                                  ),
                                )),
                          ]),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.file_copy,
                          color: Color(0xffFF405A),
                          size: 12,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Transform.rotate(
                    angle: -math.pi,
                    child: ClipPath(
                      clipper: Triangle(),
                      child: Container(
                        color: Color(0xff22263D),
                        height: 25,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 13.0, left: 21),
                          child: Center(
                            child: Transform.rotate(
                              angle: -math.pi,
                              child: Text(
                                "Eligible Investors*",
                                style: GoogleFonts.sourceSansPro(
                                  textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 25,
                    color: Color(0xffE1E0E7),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Center(
                        child: Text(
                          "Individual",
                          style: GoogleFonts.sourceSansPro(
                            textStyle: const TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 25,
                    color: Color(0xffE1E0E7),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Center(
                        child: Text(
                          "HUF",
                          style: GoogleFonts.sourceSansPro(
                            textStyle: const TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 25,
                    color: Color(0xffE1E0E7),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Center(
                        child: Text(
                          "Corporate",
                          style: GoogleFonts.sourceSansPro(
                            textStyle: const TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 25,
                    color: Color(0xffE1E0E7),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Center(
                        child: Text(
                          "Trust",
                          style: GoogleFonts.sourceSansPro(
                            textStyle: const TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 25,
                    color: Color(0xffE1E0E7),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Center(
                        child: Text(
                          "Minor",
                          style: GoogleFonts.sourceSansPro(
                            textStyle: const TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              "Key Points To Consider",
              style: GoogleFonts.quicksand(
                textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textColor),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              "Face Value (In INR) and Issue Size (In INR Crores)",
              style: GoogleFonts.sourceSansPro(
                textStyle: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff1D2B84)),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Visibility(
            child: widget.isIPO == 3 || widget.isIPO==2
                ? ConstWidget.keyPointsConsider(
                    context,_readMoreBond.allBondListOfIpoByBondId.value!
                  )
                : ConstWidget.keyPoints(context,_readMoreBond.allBondListOfIpoByBondId.value!),
          ),     //_readMoreBond.allBondListOfIpoByBondId.value!.bondLogo
          const SizedBox(
            height: 20,
          ),
          cardWidget(),
        ]),
      ],
    );
  }

  Widget cardWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Text("IPO???s Rating",
              style: GoogleFonts.quicksand(
                textStyle: const TextStyle(
                  color: Color(0xff22263D),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              )),
        ),
        const SizedBox(
          height: 6,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Image.asset(
                  "assets/images/meter.png",
                  fit: BoxFit.fill,
                  height: 90,
                  width: 164,
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 35,
                  width: 164,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Color(0xff707070)),
                      color: Color(0xffFDFDEB)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("CRISIL",
                          style: GoogleFonts.sourceSansPro(
                            textStyle: const TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                            ),
                          )),
                      Text("AA",
                          style: GoogleFonts.sourceSansPro(
                            textStyle: const TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                            ),
                          )),
                      Icon(
                        Icons.sim_card_download_rounded,
                        size: 18,
                        color: AppColors.btnColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Image.asset(
                  "assets/images/meter.png",
                  fit: BoxFit.fill,
                  height: 90,
                  width: 164,
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 35,
                  width: 164,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Color(0xff707070)),
                      color: Color(0xffFDFDEB)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("CARE",
                          style: GoogleFonts.sourceSansPro(
                            textStyle: const TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                            ),
                          )),
                      Text("AA",
                          style: GoogleFonts.sourceSansPro(
                            textStyle: const TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                            ),
                          )),
                      Icon(
                        Icons.sim_card_download_rounded,
                        size: 18,
                        color: AppColors.btnColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        InkWell(
          onTap: () {
            (isKycDone.value)?
            Navigator.push(context, MaterialPageRoute(
                    builder: (context) => BuyIPOBond(
                          isNonIPO: widget.isIPO == 3 || widget.isIPO==2,
                        ))):
            ShowBottomSheet().CommomBottomSheet(context, "Complete your kyc first","",Container());
          },
          child: Center(
            child: Container(
              height: 40,
              width: 210,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.btnColor,
              ),
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text("Buy this BOND now!",
                    style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                        color: Color(0xffFfffff),
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    )),
              )),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }

  Widget keyHighlightWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Key Highlights",
          style: GoogleFonts.quicksand(
            textStyle: const TextStyle(
              color: AppColors.textColor,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        ListView.builder(
            itemCount: data.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ListTile(
                minLeadingWidth: 30,
                contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
                dense: true,
                visualDensity:
                    const VisualDensity(vertical: -2, horizontal: -4),
                leading: const Icon(
                  Icons.done,
                  size: 20,
                  color: Color(0xffFF405A),
                ),
                title: Text(
                  "${data[index]}",
                  style: GoogleFonts.sourceSansPro(
                    textStyle: const TextStyle(
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
              );
            }),
        const SizedBox(
          height: 20,
        ),
        Visibility(
            child: widget.isIPO == 3 || widget.isIPO==2 ? NonIPONCDs() : NCDsSeries(isShow: true)),
        SizedBox(
          height: 10,
        ),
        /*Visibility(
            visible: widget.isIPO == 3 || widget.isIPO==2,
            child:Column(
    children: [
                BuyNonIpoBonds.nonIPOInvestCalculator(userIsLoggedIn, context,_readMoreBond.specificBondDataDetails.value!,true),
      BuyNonIpoBonds.whatIWillEarn(userIsLoggedIn, context,_readMoreBond.specificBondDataDetails.value!),
    ],
    )),*/

        const SizedBox(
          height: 25,
        ),
        Visibility(
          visible: widget.isIPO == 3 || widget.isIPO==2,
          child: InkWell(
            onTap: () {
              (isKycDone.value)?Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BuyIPOBond(
                            isNonIPO: widget.isIPO == 3 || widget.isIPO==2,
                          ))):ShowBottomSheet().CommomBottomSheet(context, "Complete your kyc first","",Container());
            },
            child: ViewAllWidget(
              title: 'Buy this BOND now!',
              width: 250,
            ),
          ),
        ),
        const SizedBox(
          height: 35,
        ),
        Text(
          widget.isIPO == 3 || widget.isIPO==2 ? "About This Bond" : "About This IPO",
          style: GoogleFonts.quicksand(
            textStyle: const TextStyle(
              color: AppColors.textColor,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        RichText(
            text: TextSpan(children: [
          TextSpan(
            text: "Credit Access Grameen Limited ",
            style: GoogleFonts.sourceSansPro(
              textStyle: const TextStyle(
                color: Color(0xff000000),
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
          TextSpan(
              text:
                  "is a multi-billion dollar, transnational conglomerate. The Group???s activities span three core areas: Investment Banking, International Trading and Global Investments. It also supports charitable and philanthropic activities across the world through the Mahindra & Mahindra Foundation.",
              style: GoogleFonts.sourceSansPro(
                textStyle: const TextStyle(
                  height: 1.1,
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              )),
        ])),
      ],
    );
  }

  static callBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Align(
                            alignment: Alignment.centerRight,
                            child: Icon(
                              Icons.clear,
                              color: Colors.white,
                              size: 25,
                            )),
                      ),
                      Text(
                        "DATES FOR CALL OPTION",
                        style: GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "02 Oct 2022",
                            style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SetAlert()));
                            },
                            child: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                color: AppColors.btnColor,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 14.0),
                                child: Center(
                                    child: Text("Set Alert",
                                        style: GoogleFonts.sourceSansPro(
                                          textStyle: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white),
                                        ))),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "02 Oct 2022",
                            style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                          Container(
                            height: 30,
                            decoration: BoxDecoration(
                              color: AppColors.btnColor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 14.0),
                              child: Center(
                                  child: Text("Set Alert",
                                      style: GoogleFonts.sourceSansPro(
                                        textStyle: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ))),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "02 Oct 2022",
                            style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                          Container(
                            height: 30,
                            decoration: BoxDecoration(
                              color: AppColors.btnColor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 14.0),
                              child: Center(
                                  child: Text("Set Alert",
                                      style: GoogleFonts.sourceSansPro(
                                        textStyle: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ))),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
      },
    );
  }

  static putBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Align(
                            alignment: Alignment.centerRight,
                            child: Icon(
                              Icons.clear,
                              color: Colors.white,
                              size: 25,
                            )),
                      ),
                      Text(
                        "DATES FOR PUT OPTION",
                        style: GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "02 Oct 2022",
                            style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SetAlert()));
                            },
                            child: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                color: AppColors.btnColor,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 14.0),
                                child: Center(
                                    child: Text("Set Alert",
                                        style: GoogleFonts.sourceSansPro(
                                          textStyle: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white),
                                        ))),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "02 Oct 2022",
                            style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                          Container(
                            height: 30,
                            decoration: BoxDecoration(
                              color: AppColors.btnColor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 14.0),
                              child: Center(
                                  child: Text("Set Alert",
                                      style: GoogleFonts.sourceSansPro(
                                        textStyle: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ))),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "02 Oct 2022",
                            style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                          Container(
                            height: 30,
                            decoration: BoxDecoration(
                              color: AppColors.btnColor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 14.0),
                              child: Center(
                                  child: Text("Set Alert",
                                      style: GoogleFonts.sourceSansPro(
                                        textStyle: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ))),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
      },
    );
  }
}
