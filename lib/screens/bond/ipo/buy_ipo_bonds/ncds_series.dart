import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../utils/colorsConstant.dart';
import '../pay_ipo.dart';

class NCDsSeries extends StatelessWidget {
   NCDsSeries({Key? key,required this.isShow}) : super(key: key);
   bool? isShow;

   bool isChecked1 = false;
   List test = ["Series", "I", "II", "III", "IV", "V", "VI", "VII"];
   List<DataRow> _rowList = [
     DataRow(cells: <DataCell>[
       DataCell(Text('AAAAAA')),
       DataCell(Text('1')),
       DataCell(Text('Yes')),
       DataCell(Text('Yes')),
       DataCell(Text('Yes')),
       DataCell(Text('Yes')),
       DataCell(Text('Yes')),
       DataCell(Text('Yes')),
     ]),
   ];

   void addItems() {
     for (int i = 1; i < 5; i++) {
       _addRow();
     }
   }


   void _addRow() {
      _rowList.add(DataRow(cells: <DataCell>[
        DataCell(Text('AAAAAA')),
        DataCell(Text('1')),
        DataCell(Text('Yes')),
        DataCell(Text('Yes')),
        DataCell(Text('Yes')),
        DataCell(Text('Yes')),
        DataCell(Text('Yes')),
        DataCell(Text('Yes')),
      ]));

  }

  List Col1 = [
    "Serires",
    "Frequency of Interest Payment",
    "Minimum Application",
    "In Multiples of thereafter (₹)",
    "Face Value/ Issue Price of NCDs (`/ NCD)",
    "Tenor",
    "Coupon (% per annum)",
    "Effective Yield (% per annum)",
    "Mode of Interest Payment",
    "Redemption Amount (₹ / NCD) on Maturity",
    "Put and Call Option"
  ];
  List Col2 = [
    "I",
    "Monthly",
    "₹ 10,000",
    "₹ 10000(1NCD)",
    "₹ 1000",
    "24 Months",
    "9,45%",
    "9.83%",
    "N.A",
    "1,000,000",
    "N.A"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        seriesWidget(context),
      ],
    );
  }

  Widget seriesWidget(BuildContext context) {
    addItems();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Select Series Of Ncds",
          style: GoogleFonts.quicksand(
            textStyle: const TextStyle(
              color: AppColors.textColor,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
              height: 550,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.07),
                      spreadRadius: 5,
                      blurRadius: 3,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      width: 150,
                      decoration: const BoxDecoration(
                        color: Color(0xffFF405A),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomLeft: Radius.circular(12)),
                      ),
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: Col1.length,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              height: 50,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "${Col1[index]}",
                                  style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          })),
                  SizedBox(
                      width: 130,
                      // decoration: BoxDecoration(
                      //     color: Colors.,
                      //     borderRadius:
                      //     BorderRadius.only(topLeft: Radius.circular(12))),
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: Col2.length,
                          itemBuilder: (context, index) {
                            return Container(
                              alignment: Alignment.topCenter,
                              height: 50,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "${Col2[index]}",
                                  style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          })),
                  VerticalDivider(
                    width: 3,
                    color: Colors.grey.withOpacity(0.25),
                  ),
                  SizedBox(
                      width: 130,
                      // decoration: BoxDecoration(
                      //     color: Colors.,
                      //     borderRadius:
                      //     BorderRadius.only(topLeft: Radius.circular(12))),
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: Col2.length,
                          itemBuilder: (context, index) {
                            return Container(
                              alignment: Alignment.topCenter,
                              height: 50,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "${Col2[index]}",
                                  style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          })),
                  VerticalDivider(
                    width: 3,
                    color: Colors.grey.withOpacity(0.25),
                  ),
                  SizedBox(
                      width: 130,
                      // decoration: BoxDecoration(
                      //     color: Colors.,
                      //     borderRadius:
                      //     BorderRadius.only(topLeft: Radius.circular(12))),
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: Col2.length,
                          itemBuilder: (context, index) {
                            return Container(
                              alignment: Alignment.topCenter,
                              height: 50,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "${Col2[index]}",
                                  style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          })),
                  VerticalDivider(
                    width: 3,
                    color: Colors.grey.withOpacity(0.25),
                  ),
                  SizedBox(
                      width: 130,
                      // decoration: BoxDecoration(
                      //     color: Colors.,
                      //     borderRadius:
                      //     BorderRadius.only(topLeft: Radius.circular(12))),
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: Col2.length,
                          itemBuilder: (context, index) {
                            return Container(
                              alignment: Alignment.topCenter,
                              height: 50,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "${Col2[index]}",
                                  style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          })),
                  VerticalDivider(
                    width: 3,
                    color: Colors.grey.withOpacity(0.25),
                  ),
                  SizedBox(
                      width: 130,
                      // decoration: BoxDecoration(
                      //     color: Colors.,
                      //     borderRadius:
                      //     BorderRadius.only(topLeft: Radius.circular(12))),
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: Col2.length,
                          itemBuilder: (context, index) {
                            return Container(
                              alignment: Alignment.topCenter,
                              height: 50,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "${Col2[index]}",
                                  style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          })),
                  VerticalDivider(
                    width: 3,
                    color: Colors.grey.withOpacity(0.25),
                  ),
                  SizedBox(
                      width: 130,
                      // decoration: BoxDecoration(
                      //     color: Colors.,
                      //     borderRadius:
                      //     BorderRadius.only(topLeft: Radius.circular(12))),
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: Col2.length,
                          itemBuilder: (context, index) {
                            return Container(
                              alignment: Alignment.topCenter,
                              height: 50,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "${Col2[index]}",
                                  style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          })),
                  VerticalDivider(
                    width: 3,
                    color: Colors.grey.withOpacity(0.25),
                  ),
                  SizedBox(
                      width: 130,
                      // decoration: BoxDecoration(
                      //     color: Colors.,
                      //     borderRadius:
                      //     BorderRadius.only(topLeft: Radius.circular(12))),
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: Col2.length,
                          itemBuilder: (context, index) {
                            return Container(
                              alignment: Alignment.topCenter,
                              height: 50,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "${Col2[index]}",
                                  style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          })),
                ],
              )),
        ),

        SizedBox(
          height: 10,
        ),
        Visibility(visible: isShow!,
          child: Text(
            "*Company shall allocate and allot Series IV NCDs wherein the Applicants have not indicated the choice of the relevant NCD Series.",
            style: GoogleFonts.sourceSansPro(
              textStyle: const TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.w500,
                fontSize: 10,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          height: 4,
          color: Colors.grey.withOpacity(0.35),
        ),
        SizedBox(
          height: 25,
        ),

      ],
    );
  }
}
