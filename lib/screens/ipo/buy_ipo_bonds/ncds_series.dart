import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/colorsConstant.dart';
import '../pay_ipo.dart';

class NCDsSeries extends StatelessWidget {
   NCDsSeries({Key? key}) : super(key: key);

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
        /*Table(
            border: TableBorder.all(), // Allows to add a border decoration around your table
            children: [
              TableRow(children :[
                Text('Year'),
                Text('Lang'),
                Text('Author'),
              ]),
              TableRow(children :[
                Text('2011',),
                Text('Dart'),
                Text('Lars Bak'),
              ]),
              TableRow(children :[
                Text('1996'),
                Text('Java'),
                Text('James Gosling'),
              ]),
            ]
        ),*/
      ],
    );
  }

  Widget seriesWidget(BuildContext context) {
    addItems();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Text(
            "Select Series Of Ncds",
            style: GoogleFonts.quicksand(
              textStyle: const TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: SingleChildScrollView(
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
                child: Flexible(
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
                  ),
                )),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Container(
            height: 4,
            color: Colors.grey.withOpacity(0.35),
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          color: Color(0xff00C6D8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Grand Total (₹) ",
                    style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  Text(
                    "( A+B+C+D+E+F)",
                    style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                  ),
                ],
              ),
              Text(
                "2,00,000",
                style: GoogleFonts.quicksand(
                  textStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          alignment: Alignment.topLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Checkbox(
                checkColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                // color of tick Mark
                activeColor: AppColors.primaryColor,
                value: isChecked1,
                onChanged: (bool? value) {
                  isChecked1 = value!;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: "I have read and agreed to the ",
                          style: GoogleFonts.sourceSansPro(
                            textStyle: const TextStyle(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 12),
                          )),
                      TextSpan(
                          text: "disclaimer ",
                          style: GoogleFonts.sourceSansPro(
                            textStyle: const TextStyle(
                                decoration: TextDecoration.underline,
                                color: AppColors.btnColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 12),
                          )),
                      TextSpan(
                          text: "and ",
                          style: GoogleFonts.sourceSansPro(
                            textStyle: const TextStyle(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 12),
                          )),
                      TextSpan(
                          text: "terms & conditions",
                          style: GoogleFonts.sourceSansPro(
                            textStyle: const TextStyle(
                                decoration: TextDecoration.underline,
                                color: AppColors.btnColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 12),
                          )),
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 25,
        ),
        InkWell(onTap: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => PayIPO()));
        },
          child: Center(
            child: Container(
              width: 170,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color(0xffFF405A),
              ),
              child: Center(
                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric( vertical: 12),
                    child: Text("Continue to Buy",
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
          height: 20,
        ),
      ],
    );
  }
}
