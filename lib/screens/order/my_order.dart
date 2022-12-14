import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rotated_corner_decoration/rotated_corner_decoration.dart';
import 'package:trust_money/utils/colorsConstant.dart';
import 'package:trust_money/utils/images.dart';
import 'package:trust_money/utils/styles.dart';

import '../../utils/app_bar.dart';

class Order extends StatefulWidget {
  const Order({Key? key}) : super(key: key);

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  bool _customTileExpanded = false;
  String value = 'Bonds';
  var items = [
    'Bonds',
    'Bonds1',
    'Bonds2',
    'Bonds3',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppToolbar.appBar(
          "Orders",
          Container(
            width: 50,
          ),
          IconButton(
            icon: Container(
                padding: const EdgeInsets.all(1),
                decoration: const BoxDecoration(
                    color: Colors.transparent, shape: BoxShape.circle),
                child: const Icon(
                  Icons.person,
                  size: 20,
                  color: Colors.transparent,
                )),
            onPressed: () {},
          )),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text("Recent Orders",
                  style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                        color: Color(0xff22263D),
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  )),
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "09/03/1900 to 09/03/2020",
                            style: ConstStyle.sourceSansPro,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(
                            Icons.calendar_today_outlined,
                            color: AppColors.primaryColor,
                            size: 15,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Container(
                        height: 0.4,
                        width: 170,
                        color: AppColors.primaryColor,
                      )
                    ],
                  ),
                  DropdownButton2(
                    isDense: true,
                    dropdownWidth: 80,
                    buttonWidth: 62,
                    value: value,
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      size: 15,
                    ),
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(
                          items,
                          style: ConstStyle.sourceSansPro,
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        value = newValue!;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            orderListTile(),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  Widget orderListTile() {
    return ListView.builder(
        itemCount: 15,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.15),
                      spreadRadius: 5,
                      blurRadius: 3,
                      offset: const Offset(0, 3),
                    ),
                  ]),
              child: ExpansionTile(
                backgroundColor: Colors.white,
                childrenPadding: const EdgeInsets.symmetric(vertical: 0),
                tilePadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 14.0),
                      child: Image.asset(
                        ConstantImage.orderImg,
                        height: 50,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.8,
                      child:
                          Text("Sovereign Gold Bonds Scheme 2021-22 - Series X",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: GoogleFonts.quicksand(
                                textStyle: const TextStyle(
                                    height: 1.3,
                                    color: Color(0xff22263D),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15),
                              )),
                    ),
                  ],
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const SizedBox(
                        width: 32,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Order no.",
                              style: GoogleFonts.sourceSansPro(
                                textStyle: const TextStyle(
                                  color: Color(0xffB0B1B9),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                ),
                              )),
                          const SizedBox(
                            height: 1,
                          ),
                          Text(
                            "000834287",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: const TextStyle(
                                color: Color(0xff22263D),
                                fontWeight: FontWeight.w400,
                                fontSize: 11.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Order Date",
                              style: GoogleFonts.sourceSansPro(
                                textStyle: const TextStyle(
                                  color: Color(0xffB0B1B9),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                ),
                              )),
                          const SizedBox(
                            height: 1,
                          ),
                          Text(
                            "March 6, 2022",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: const TextStyle(
                                color: Color(0xff22263D),
                                fontWeight: FontWeight.w400,
                                fontSize: 11.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 22,
                        width: 70,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                           // color: Color(0xffc8fcdb),
                            borderRadius: BorderRadius.circular(3),
                            border: Border.all(
                                width: 1, color: const Color(0xff02AD41))),
                        child: Center(
                          child: Text(
                            "Processed",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: const TextStyle(
                                color: Color(0xff02AD41),
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                trailing: Container(
                  height: double.infinity,
                  width: 25,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    gradient: LinearGradient(
                      colors: [
                        Color(0xffFFFFFF),
                        Color(0xffF3E2E5),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: _customTileExpanded
                      ? const Icon(
                          Icons.keyboard_arrow_up,
                          color: AppColors.primaryColor,
                          size: 20,
                        )
                      : const Icon(
                          Icons.keyboard_arrow_down,
                          color: AppColors.primaryColor,
                          size: 20,
                        ),
                ),
                children: <Widget>[
                  ListTile(
                    title: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.center,
                          height: 74,
                          color: Color(0xffF7F7FA),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("Amount Invested",
                                      style: GoogleFonts.sourceSansPro(
                                        textStyle: const TextStyle(
                                          color: Color(0xffB0B1B9),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10,
                                        ),
                                      )),
                                  const SizedBox(
                                    height: 1,
                                  ),
                                  Text(
                                    "??? 6,26,201",
                                    style: ConstStyle.sourceSans1,
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("Gold Quantity",
                                      style: GoogleFonts.sourceSansPro(
                                        textStyle: const TextStyle(
                                          color: Color(0xffB0B1B9),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10,
                                        ),
                                      )),
                                  const SizedBox(
                                    height: 1,
                                  ),
                                  Text(
                                    "20 Grams",
                                    style: ConstStyle.sourceSans1,
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("Payment Status",
                                      style: GoogleFonts.sourceSansPro(
                                        textStyle: const TextStyle(
                                          color: Color(0xffB0B1B9),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10,
                                        ),
                                      )),
                                  const SizedBox(
                                    height: 1,
                                  ),
                                  Text(
                                    "Successful",
                                    style: ConstStyle.sourceSans1,
                                  ),
                                ],
                              ),

                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                padding: EdgeInsets.only(left: 5,right: 5),
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Color(0xffFCEDEE)
                                ),
                                child: Row(
                                  children: [
                                    Text("Download Invoice"),
                                    SizedBox(width: 5,),
                                    Icon(Icons.download),
                                  ],
                                )),
                            Container(
                                padding: EdgeInsets.only(left: 5,right: 5),
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Color(0xffE7F8FA)
                                ),
                                child: Row(
                                  children: [
                                    Text("Download Form"),
                                    SizedBox(width: 5,),
                                    Icon(Icons.download),
                                  ],
                                )),

                          ],
                        )
                      ],
                    ),
                    subtitle: Stack(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 7,
                            ),
                            Container(
                              width: 5,
                              height: 95,
                              color: AppColors.greenColor,
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  "Money Receive Bid Requested Placed",
                                  style: ConstStyle.sourceSansPro,
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  "Bid forwarded to RBI and Stock Exchange approval.",
                                  style: ConstStyle.sourceSansPro,
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  "Bonds Credited to your Account",
                                  style: ConstStyle.sourceSansPro,
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Positioned(
                          top: 30,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.greenColor,
                            ),
                            width: 20,
                            height: 20,
                            child: const Center(
                                child: Icon(
                              Icons.done,
                              color: Colors.white,
                              size: 15,
                            )),
                          ),
                        ),
                        Positioned(
                          top: 75,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.greenColor,
                            ),
                            width: 20,
                            height: 20,
                            child: Center(
                                child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              height: 12,
                              width: 12,
                            )
                                //Icon(Icons.done,color: Colors.white,size: 15,)
                                ),
                          ),
                        ),
                        Positioned(
                          bottom: 30,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.greyColor,
                            ),
                            width: 20,
                            height: 20,
                            //child: Center(child: Icon(Icons.done,color: Colors.white,size: 15,)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                onExpansionChanged: (bool expanded) {
                  setState(() => _customTileExpanded = expanded);
                },
              ),
            ),
          );
        });
  }
}
