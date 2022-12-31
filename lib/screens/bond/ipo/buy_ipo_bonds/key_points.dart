import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trust_money/utils/colorsConstant.dart';

import '../../../../model/bond/gold_bond.dart';

class KeyPoints extends StatelessWidget {
  const KeyPoints({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: const Color(0xffD67278).withOpacity(0.10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Issue Opens on",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: TextStyle(
                              color: AppColors.primaryColor.withOpacity(0.80),
                              fontWeight: FontWeight.w600,
                              fontSize: 12),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "14, Nov 2022 - 8.00 AM",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w600,
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
                      "Issue Closes on",
                      style: GoogleFonts.sourceSansPro(
                        textStyle: TextStyle(
                            color: AppColors.primaryColor.withOpacity(0.80),
                            fontWeight: FontWeight.w600,
                            fontSize: 12),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "02, Dec 2022 - 3 PM",
                      style: GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.w600,
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
          color: const Color(0xff9BA9AD).withOpacity(0.10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Coupon Rate (Returns)",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: TextStyle(
                              color: AppColors.primaryColor.withOpacity(0.80),
                              fontWeight: FontWeight.w600,
                              fontSize: 12),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "8.25% p.a",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.40,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Yeild",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: TextStyle(
                              color: AppColors.primaryColor.withOpacity(0.80),
                              fontWeight: FontWeight.w600,
                              fontSize: 12),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "10.60% (Min) - 11.71% (Max)",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          color: const Color(0xff9BA9AD).withOpacity(0.10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Face Value",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: TextStyle(
                              color: AppColors.primaryColor.withOpacity(0.80),
                              fontWeight: FontWeight.w600,
                              fontSize: 12),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "₹1,000.00",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.40,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Minimum Application",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: TextStyle(
                              color: AppColors.primaryColor.withOpacity(0.80),
                              fontWeight: FontWeight.w600,
                              fontSize: 12),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "₹ 10,000.00",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          color: const Color(0xff9BA9AD).withOpacity(0.10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Interest Payment Frequency",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: TextStyle(
                              color: AppColors.primaryColor.withOpacity(0.80),
                              fontWeight: FontWeight.w600,
                              fontSize: 12),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Annual",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.40,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Maturity Date",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: TextStyle(
                              color: AppColors.primaryColor.withOpacity(0.80),
                              fontWeight: FontWeight.w600,
                              fontSize: 12),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "13/Sep/2024",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          color: const Color(0xff9BA9AD).withOpacity(0.10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tax Free",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: TextStyle(
                              color: AppColors.primaryColor.withOpacity(0.80),
                              fontWeight: FontWeight.w600,
                              fontSize: 12),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "No",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.40,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Series",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: TextStyle(
                              color: AppColors.primaryColor.withOpacity(0.80),
                              fontWeight: FontWeight.w600,
                              fontSize: 12),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Series",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          color: const Color(0xff9BA9AD).withOpacity(0.10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Listing",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: TextStyle(
                                  color:
                                  AppColors.primaryColor.withOpacity(0.80),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "BSE and NSE",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: const TextStyle(
                                  color: AppColors.textColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.40,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Issue Size",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: TextStyle(
                                  color:
                                  AppColors.primaryColor.withOpacity(0.80),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "₹250 Crore with an option to retain oversubscription up to ₹250 Crore aggregating upto to ₹ 500 Crore",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: const TextStyle(
                                  color: AppColors.textColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class GoldKeyPoints extends StatelessWidget {
  const GoldKeyPoints( this._goldBondDetails, {Key? key}) : super(key: key);
  final GoldBondDetails? _goldBondDetails;
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Container(
          color: const Color(0xffD67278).withOpacity(0.10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Coupon Rate (Returns)",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: TextStyle(
                              color: AppColors.primaryColor.withOpacity(0.80),
                              fontWeight: FontWeight.w600,
                              fontSize: 12),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "${_goldBondDetails!.bondCouponAmount??"N/A"}%",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w600,
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
                      "Yeild",
                      style: GoogleFonts.sourceSansPro(
                        textStyle: TextStyle(
                            color: AppColors.primaryColor.withOpacity(0.80),
                            fontWeight: FontWeight.w600,
                            fontSize: 12),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "${_goldBondDetails!.bondsYeild??"N/A"}%",
                      style: GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.w600,
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
          color: const Color(0xff9BA9AD).withOpacity(0.10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Allotment Date",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: TextStyle(
                              color: AppColors.primaryColor.withOpacity(0.80),
                              fontWeight: FontWeight.w600,
                              fontSize: 12),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "${_goldBondDetails!.bondAllotmentDate??"N/A"}",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.40,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Issue Opening - Closing Dates",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: TextStyle(
                              color: AppColors.primaryColor.withOpacity(0.80),
                              fontWeight: FontWeight.w600,
                              fontSize: 12),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "${_goldBondDetails!.bondOpeningDate??"N/A"} - ${_goldBondDetails!.bondClosingDate??"N/A"}",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          color: const Color(0xff9BA9AD).withOpacity(0.10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Next Interest Payment Date",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: TextStyle(
                              color: AppColors.primaryColor.withOpacity(0.80),
                              fontWeight: FontWeight.w600,
                              fontSize: 12),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "${_goldBondDetails!.bondsNextInterestPaymentDate??"N/A"}",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.40,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Interest Payment Frequency",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: TextStyle(
                              color: AppColors.primaryColor.withOpacity(0.80),
                              fontWeight: FontWeight.w600,
                              fontSize: 12),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${_goldBondDetails!.bondInterestFrequency??"N/A"}",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: const TextStyle(
                                  color: AppColors.textColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                          ),
                          /*   Text(
                            "Every 6 Months",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: const TextStyle(
                                  color: AppColors.textColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10),
                            ),
                          ),*/
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          color: const Color(0xff9BA9AD).withOpacity(0.10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Maturity after",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: TextStyle(
                              color: AppColors.primaryColor.withOpacity(0.80),
                              fontWeight: FontWeight.w600,
                              fontSize: 12),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${_goldBondDetails!.bondMaturityDate??"N/A"}",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: const TextStyle(
                                  color: AppColors.textColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                          ),
                          Text(
                            "(1st Exit Date)",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: const TextStyle(
                                  color: AppColors.textColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.40,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Purchase Limit",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: TextStyle(
                              color: AppColors.primaryColor.withOpacity(0.80),
                              fontWeight: FontWeight.w600,
                              fontSize: 12),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${_goldBondDetails!.bondPurchaseLimit??"N/A"}KG/${_goldBondDetails!.bondPurchaseLimitMetric??"N/A"} units ",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: const TextStyle(
                                  color: AppColors.textColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                          ),
                          Text(
                            "During each financial year",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: const TextStyle(
                                  color: AppColors.textColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          color: const Color(0xff9BA9AD).withOpacity(0.10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Issuer",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: TextStyle(
                              color: AppColors.primaryColor.withOpacity(0.80),
                              fontWeight: FontWeight.w600,
                              fontSize: 12),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "${_goldBondDetails!.bondIssuerName??"N/A"}",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.40,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "RBI Notice",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: TextStyle(
                              color: AppColors.primaryColor.withOpacity(0.80),
                              fontWeight: FontWeight.w600,
                              fontSize: 12),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "${_goldBondDetails!.bondsBannerRcbNoticeLink??"N/A"}",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                              decoration: TextDecoration.underline,
                              color: AppColors.btnColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          color: const Color(0xff9BA9AD).withOpacity(0.10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Govt. Guarantee",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: TextStyle(
                                  color:
                                  AppColors.primaryColor.withOpacity(0.80),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "${_goldBondDetails!.bondGovtGuranatee??"N/A"}",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: const TextStyle(
                                  color: AppColors.textColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.40,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Exit Option Available",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: TextStyle(
                                  color:
                                  AppColors.primaryColor.withOpacity(0.80),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "{_goldBondDetails!.bondPurchaseLimit??}",
                                style: GoogleFonts.sourceSansPro(
                                  textStyle: const TextStyle(
                                      color: AppColors.textColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                ),
                              ),
                              Text(
                                "After the 5th year. Investors can exercise it on the next interest payment dates.",
                                style: GoogleFonts.sourceSansPro(
                                  textStyle: const TextStyle(
                                      color: AppColors.textColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}



