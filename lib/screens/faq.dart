import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_bar.dart';
import '../utils/images.dart';

class FAQs extends StatelessWidget {
  FAQs({Key? key}) : super(key: key);
Rx<Icon> tileIcon=Icon(Icons.add).obs;
  List data = [
    [
      "Why should one invest in fixed income securities?",
      "While many investments provide some form of income, fixed income securities tend to offer fixed and the most reliable cash streams; these are rated by credit rating agencies, allowing investors to choose bonds from financially stable issuers. A diversified bond portfolio can provide decent yield with a lower level of volatility than equities or any other asset classes. Fixed income securities at maturity provide investors with the principal amount they had invested in addition to the interest they have received."
    ],
    [
      "What is a bond?",
      "Stability of principal : One advantage of investing in fixed income securities is peace of mind that comes from capital preservation. Investors benefit by investing in fixed income securities as they preserve and increase their invested capital. Generates a steady and regular income stream : Fixed income securities provide investors with a steady stream of income, For example, by investing Rs. 1,00,000/- in bond with 12% annual coupon rate, the investor has the assurance to get Rs. 12,000 directly in the bank account on yearly basis till the maturity of the bond. High priority claims to assets : Fixed income investors get benefit from their position in the capital structure of an entity (issuer) issuing both equity and debt investments. Investors in bonds of a corporation have a higher priority over common and preferred stockholders of the same entity (issuer). Nullify market volatility : The price of debt securities displays a very lower average volatility as compared to the price of equity or mutual funds and ensures the greater safety of the investment. Zero credit risk : Investors can neutralize the default risk on their investments by investing in government securities, which are normally referred to as risk-free investments due to the sovereign guarantee on these instruments. Efficient portfolio diversification : Fixed income securities enable efficient portfolio diversification and thus assist in portfolio risk mitigation."
    ],
    [
      "What is a maturity date?",
      "A bond is a fixed income instrument that represents a loan made by an investor (bond holder) to a borrower (bond issuer). Governments, corporates, banks, and municipalities issue bonds when they need capital. Bonds traditionally pay a fixed interest rate (coupon) to the debtholders along with the principal amount at maturity."
    ],
    [
      "What is a coupon rate?",
      "A bond pays interest periodically and repays the principal at a stated time, known as maturity."
          "What is the difference between yield to maturity (YTM) and current yield (CY)?",
      "Coupon rate is the periodic rate of interest paid by bond issuers to their purchasers. The coupon rate is calculated on the bond’s face value (or par value), not on the issue price or market value. For example, if you have a 10-year- Rs 2,000 bond with a coupon rate of 10%, you will get Rs 200 every year for 10 years, no matter what happens to the bond price in the market."
    ],
    [
      "What is the taxation aspect of bonds?",
      "Yield to maturity (YTM) is the total return anticipated on a bond if the bond is held until it matures. In other words, it is the internal rate of return (IRR) of an investment in a bond if the investor holds the bond until maturity. Current yield helps investors drill down on bonds that generate the greatest returns on investment each year, which is equal to an investment's annual income (coupon) divided by the current price of the bond."
    ],
    [
      "What is the difference between coupon rate and yield?",
      "The interest on bonds, except tax-free bonds, is taxable at the slab rates applicable to you. Any profit on sale/redemption will become taxable as long-term if the same is held for more than 36 months on the date of such sale/redemption whereas profits made on the sale of bonds shall be taxed as short-term, in case they have been held for 36 months or less, however in the case of the bonds which are listed on any stock exchange in India, the qualifying period is 12 months instead of 36 months."
    ],
    [
      "What is a call/put option?",
      "A coupon is the fixed interest rate paid to the bond holders, whereas a bond's yield refers to the expected earnings generated and realized on a fixed-income investment over a particular period of time, expressed as a percentage of interest rate."
    ],
    [
      "What do perpetual bonds mean?",
      "A bond option is a contract that gives an investor or issuer the right to buy or sell a bond by a particular date for a predetermined price. The call option allows the issuer the right to buy back the bond at a predetermined price at a certain time (call date) in the future, whereas a put option allows the holder right to demand early redemption at a predetermined price at a certain time (put date) in the future. The bond option can be used to protect an existing bond portfolio against adverse interest rate movements or to make a profit on favorable, short-term movements in prices."
    ],
    [
      "What type of fixed income instruments are available for investment?",
      "A perpetual bond is a bond with no fixed maturity date. While perpetual bonds can be understood to be debt obligations, the obligation here isn’t compulsory, this is owed to the fact that the debt isn’t required to be repaid by the issuer till they continue to make interest or coupon payments that are owed to those that hold perpetual bonds. Typically, these bonds are issued with call date and are callable at the predefined call date. The yield of a perpetual bond is therefore calculated up to the earliest call date."
    ]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppToolbar.appBar(
          "FAQS",
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          IconButton(
            icon: Container(
                padding: const EdgeInsets.all(1),
                decoration: const BoxDecoration(
                    color: Colors.white, shape: BoxShape.circle),
                child: const Icon(Icons.person,
                    size: 20, color: Color(0xff00C6D8))),
            onPressed: () {},
          )),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: const Image(
                image: AssetImage(
                  ConstantImage.faq,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                "FAQs",
                style: GoogleFonts.quicksand(
                  textStyle: TextStyle(
                      color: Color(0xff22263D),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                style: GoogleFonts.sourceSansPro(
                  textStyle: TextStyle(
                      color: Color(0xff22263D),
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            list(),
            /* SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 170,
              color: Color(0xffFF0023),
              child: Text(
                  "*Get Full Content On Https://Trustsecurities.In/Faq.Php",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.quicksand(
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  )),
            ),*/
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }

  Widget list() {
    return ListView.builder(
        itemCount: data.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12),
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.25),
                  spreadRadius: 3,
                  blurRadius: 11,
                  offset: const Offset(0, 1),
                ),
              ], color: Colors.white),
              child: Theme(

                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  onExpansionChanged: (a){
// tileIcon.value=Icon(Icons.minimize);
                  },
                  leading: Obx(() =>(tileIcon.value)),

                  childrenPadding: EdgeInsets.symmetric(vertical: 0),
                  title: Text('${data[index][0]}',
                      style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                          color: Color(0xff000000),
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      )),
                  controlAffinity: ListTileControlAffinity.leading,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 60.0),
                      child: ListTile(
                          title: Text('${data[index][1]}',
                              style: GoogleFonts.sourceSansPro(
                                textStyle: const TextStyle(
                                  color: Color(0xff000000),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10,
                                ),
                              ))),
                    ),
                  ],
                ),
              ),
              /* ListTile(
                minLeadingWidth: 30,
                contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
                dense: true,
                visualDensity:
                    const VisualDensity(vertical: -2, horizontal: -4),
                leading: const Icon(
                  Icons.add,
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
              ),*/
            ),
          );
        });
  }
}
