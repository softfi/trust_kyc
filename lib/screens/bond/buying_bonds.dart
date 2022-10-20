import 'package:flutter/material.dart';
import 'package:trust_money/utils/styles.dart';

bool is_switch_on = true;
var container_garidiant = LinearGradient(
    colors: [Color(0xff58C3D5), Color(0xffEC515F)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight);

class BuyingBonds extends StatefulWidget {
  const BuyingBonds({Key? key}) : super(key: key);

  @override
  State<BuyingBonds> createState() => _BuyingBondsState();
}

class _BuyingBondsState extends State<BuyingBonds> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bonds",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leadingWidth: 100,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.start,

          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back),
              color: Colors.white,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu),
              color: Colors.white,
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.person),
            color: Colors.white,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.yellow.shade50),

              ///give image here for the background images
              // height: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Invest in",
                              style: ConstStyle.quickStandBold,
                            ),
                            Text(
                              "Sovereign Gold Bond",
                              style: ConstStyle.sourceSans2,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Apply online through your Demat account and save ₹50 per gram",
                              maxLines: 3,
                            ),
                          ])),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 25,
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(gradient: container_garidiant),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Center(
                            child: Text(
                          "Listed on BSE/NSE",
                          style: TextStyle(color: Colors.white),
                        )),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icons.check_circle,
                            color: Colors.greenAccent,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 25,
                    width: MediaQuery.of(context).size.width / 1.9,
                    decoration: BoxDecoration(gradient: container_garidiant),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Center(
                            child: Text(
                          "+2.5% Interst Extra",
                          style: TextStyle(color: Colors.white),
                        )),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icons.check_circle,
                            color: Colors.greenAccent,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 25,
                    width: MediaQuery.of(context).size.width / 1.6,
                    decoration: BoxDecoration(gradient: container_garidiant),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Center(
                            child: Text(
                          "+ Capital Gains Tax Benefit",
                          style: TextStyle(color: Colors.white),
                        )),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icons.check_circle,
                            color: Colors.greenAccent,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 25,
                    width: MediaQuery.of(context).size.width / 1.5,
                    decoration: BoxDecoration(gradient: container_garidiant),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Center(
                            child: Text(
                          "36.741.27 Crore already Invested",
                          style: TextStyle(color: Colors.white),
                        )),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icons.check_circle,
                            color: Colors.greenAccent,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 25,
                    width: MediaQuery.of(context).size.width / 1.3,
                    decoration: BoxDecoration(gradient: container_garidiant),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Center(
                            child: Text(
                          "Issued by the Government of India",
                          style: TextStyle(color: Colors.white),
                        )),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icons.check_circle,
                            color: Colors.greenAccent,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 30,
                    width: MediaQuery.of(context).size.width / 2,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: LinearGradient(
                            colors: [Colors.red.shade900, Colors.red],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight)),
                    child: Text(
                      "Buy this BOND now!",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Column(
                children: [
                  Text(
                    "Investing in Sovereign Gold Bond (Sgbs",
                    style: ConstStyle.quickStandBold,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                      "Issued br Reserve Bank Of India on behalf of Government of India , SOvereign Gold Bonds(SGBs) are the perfectg alternative to investment in physical gold. with these bonds , you can enjoy capital appreciation and also earn interst every year. These bonds , issued by the Government Of India , also eliminate several riosk associated with physical gold")
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Column(
                children: [
                  Text(
                    "Sovereign Gold Bond Benefits",
                    style: ConstStyle.quickStandBold,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    color: Color(0xff9BA9AD),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.image,
                          size: 50,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Hassle-Free",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white)),
                              Text(
                                "Ownership of gold without any physical possession (No risks and no cost of storage)",
                                softWrap: true,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    color: Color(0xff6B5B6EFF),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.image,
                          size: 50,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Tax Treatmant",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white)),
                              Text(
                                "The capital gains tax arising on redemption of SGB to an individual has been exempted. The indexation benefits will be provided to long term capital gains arising to any person on transfer of bond.",
                                softWrap: true,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    color: Color(0xffCA8386),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.image,
                          size: 50,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Tradability",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white)),
                              Text(
                                "Bonds will be tradable on stock exchanges within a fortnight of the issuance on a date as notified by the RBI.",
                                softWrap: true,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    color: Color(0xffD67278),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.image,
                          size: 50,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("Transferability",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white)),
                              Text(
                                "Bonds shall be transferable by execution of an Instrument of transfer in accordance with the provisions of the Government Securities Act.",
                                softWrap: true,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xff58C3D5), Color(0xffEC515F)],
                            end: Alignment.topCenter,
                            begin: Alignment.bottomCenter)),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Your Investmemnt Calculator",
                          style: ConstStyle.quickStandBold,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          color: Colors.white,
                          child: Text(
                            "The maximum limit of subscription shall be 4 kg for individuals, 4 kg for Hindu Undivided Family (HUF) and 20 kg for trusts and similar entities notified by the government from time to time",
                            softWrap: true,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Mode Of Investment",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 20),
                                  ),
                                  Switch(
                                    value: is_switch_on,
                                    onChanged: (value) {
                                      setState(() {
                                        is_switch_on = false;
                                      });
                                    },
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text("Enter gold quantity(A)",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 20)),
                                      Text("Range: 1gm-4000gm",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14))
                                    ],
                                  ),
                                  Row(children: [
                                    Container(
                                      height: 30,
                                      width: 30,
                                      color: Colors.white,
                                      child: Text("2"),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      height: 30,
                                      color: Colors.white,
                                      child: Text("Gram "),
                                    )
                                  ])
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Issue Price(B)",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 20)),
                                      Text("Price o f1 gram of gold -₹50 ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 13)),
                                      Text("Discount for online Transaction",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 13))
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: 30,
                                    color: Colors.white,
                                    child: Text("₹5,059 "),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Total Insvestment",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 20)),
                                      // Text("Price o f1 gram of gold -₹50 "),
                                      Text("Gold Quantity(A) x Issue Price(B)",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 13))
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: 30,
                                    color: Colors.white,
                                    child: Text("₹10,118 "),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 30,
                          width: MediaQuery.of(context).size.width / 2,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              gradient: LinearGradient(
                                  colors: [Colors.red.shade900, Colors.red],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight)),
                          child: Text(
                            "Buy this BOND now!",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 50,
                          color: Colors.black,
                          child: Center(
                            child: Text(
                              "WHAT WILL I LEARN ",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    color: Colors.red.shade400,
                    child: Row(
                      children: [
                        Icon(
                          Icons.account_balance,
                          size: 50,
                        ),
                        Column(
                          children: [
                            Text(
                              "Download Issue Documnet",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                                "The document contains high-quality data which is fetched from SEBI and Exchange websites to help you make an informed decision.")
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(
                          "Upcoming issues",
                          style: ConstStyle.quickStandBold,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                            "As declared by RBI, Gold bonds are issued every month. You can also easily plan your gold investments.")
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 200,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
