import 'package:custom_switch/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trust_money/utils/images.dart';



class ProfileCardUi extends StatefulWidget {
  const ProfileCardUi({Key? key}) : super(key: key);

  @override
  State<ProfileCardUi> createState() => _ProfileCardUiState();
}
bool itrValue = false;
int itrValueInt = 0;
class _ProfileCardUiState extends State<ProfileCardUi> {
  @override
  Widget build(BuildContext context) {
    return

      Padding(
      padding: const EdgeInsets.only(top: 28.0),
      child: SingleChildScrollView(child:Column(
        children: [
          function(),
          SizedBox(height: 20,),
          factaDetails(),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: tmAccountDetails(),
          ),
          SizedBox(height: 20,)
        ],
      )

      )
    );
  }

  Widget function()
  {return ListView.builder(
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
        itemCount: 3,
        itemBuilder:(context,index) {
      return
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [

                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width / 5,
                          child: Text("Add", style: TextStyle(
                              color: Colors.white, fontSize: 12)),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(6),
                                  bottomLeft: Radius.circular(6))
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width / 5,
                          child: Text("Edit", style: TextStyle(
                              color: Colors.white, fontSize: 12),),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(6),
                                  bottomLeft: Radius.circular(6))
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10,),

                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("1. Nominee Details", style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                                color: Color(0xff22263D),
                                fontSize: 20,
                                fontWeight: FontWeight.bold))
                          ,),
                        Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width / 2,
                            child: Divider(color: Colors.black, thickness: 2,))
                      ],
                    ),
                  ),

                  SizedBox(height: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text("Title", style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                              color: Color(0xff22263D),
                              fontWeight: FontWeight.w400,
                              fontSize: 12),
                        ),),
                      ),
                      SizedBox(height: 5,),
                      Container(
                          child: Text("Mrs", style: GoogleFonts.sourceSansPro(
                              textStyle: const TextStyle(
                                  color: Color(0xff22263D),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15)),
                          ))
                    ],
                  ),
                  SizedBox(height: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text("Full Name", style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                              color: Color(0xff22263D),
                              fontWeight: FontWeight.w400,
                              fontSize: 12),
                        ),),
                      ),
                      SizedBox(height: 5,),
                      Container(
                          child: Text(
                            "Veena Jairaj", style: GoogleFonts.sourceSansPro(
                              textStyle: const TextStyle(
                                  color: Color(0xff22263D),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15)),
                          ))
                    ],
                  ),

                  SizedBox(height: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text("Relationship with Application",
                          style: GoogleFonts.sourceSansPro(
                            textStyle: const TextStyle(
                                color: Color(0xff22263D),
                                fontWeight: FontWeight.w400,
                                fontSize: 12),
                          ),),
                      ),
                      SizedBox(height: 5,),
                      Container(
                          child: Text("Wife", style: GoogleFonts.sourceSansPro(
                              textStyle: const TextStyle(
                                  color: Color(0xff22263D),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15)),
                          ))
                    ],
                  ),

                  SizedBox(height: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          "PAN Number", style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                              color: Color(0xff22263D),
                              fontWeight: FontWeight.w400,
                              fontSize: 12),
                        ),),
                      ),
                      SizedBox(height: 5,),
                      Container(
                          child: Text(
                            "AMGPP12345", style: GoogleFonts.sourceSansPro(
                              textStyle: const TextStyle(
                                  color: Color(0xff22263D),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15)),
                          ))
                    ],
                  ),

                  SizedBox(height: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          "Mobile Number", style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                              color: Color(0xff22263D),
                              fontWeight: FontWeight.w400,
                              fontSize: 12),
                        ),),
                      ),
                      SizedBox(height: 5,),
                      Container(
                          child:
                          Row(children: [
                            Image(image: AssetImage(ConstantImage.india),
                              width: 19,
                              height: 13,),
                            SizedBox(width: 7,),
                            Text("+91 9820098200", style: GoogleFonts
                                .sourceSansPro(
                                textStyle: const TextStyle(
                                    color: Color(0xff22263D),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15)),
                            )
                          ]))


                    ],
                  ),

                  SizedBox(height: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text("Date of Birth - Should be as per Aadhar",
                          style: GoogleFonts.sourceSansPro(
                            textStyle: const TextStyle(
                                color: Color(0xff22263D),
                                fontWeight: FontWeight.w400,
                                fontSize: 12),
                          ),),
                      ),
                      SizedBox(height: 5,),
                      Container(
                          child:
                          Text("03/09/1900", style: GoogleFonts.sourceSansPro(
                              textStyle: const TextStyle(
                                  color: Color(0xff22263D),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15)),
                          ))


                    ],
                  ),

                  SizedBox(height: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text("Address (Same as the Applicant)",
                          style: GoogleFonts.sourceSansPro(
                            textStyle: const TextStyle(
                                color: Color(0xff22263D),
                                fontWeight: FontWeight.w400,
                                fontSize: 12),
                          ),),
                      ),
                      SizedBox(height: 5,),
                      Padding(padding: EdgeInsets.all(8),
                          child: Card(
                            child: Container(
                                child:
                                Text(
                                  "A 1XX4, XXXXX XXXXX XXX, XXXXX XXXXX XXXXX, XXXXX - XXXXX, XXXXX - XXXX64, XXXXXXXXXX, XXXXX.",
                                  style: GoogleFonts.sourceSansPro(
                                      textStyle: const TextStyle(
                                          color: Color(0xff22263D),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15)),
                                )),
                          ))


                    ],
                  )
                ],
              ),
            ),
          ),
        );
    });}



Widget factaDetails()
{
  return  Card(
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //
          //     Padding(
          //       padding: const EdgeInsets.only(right: 8.0),
          //       child: Container(
          //         alignment: Alignment.center,
          //         width: MediaQuery
          //             .of(context)
          //             .size
          //             .width / 5,
          //         child: Text("Add", style: TextStyle(
          //             color: Colors.white, fontSize: 12)),
          //         decoration: BoxDecoration(
          //             color: Colors.black,
          //             borderRadius: BorderRadius.only(
          //                 bottomRight: Radius.circular(6),
          //                 bottomLeft: Radius.circular(6))
          //         ),
          //       ),
          //     ),
          //
          //     Padding(
          //       padding: const EdgeInsets.only(left: 8.0),
          //       child: Container(
          //         alignment: Alignment.center,
          //         width: MediaQuery
          //             .of(context)
          //             .size
          //             .width / 5,
          //         child: Text("Edit", style: TextStyle(
          //             color: Colors.white, fontSize: 12),),
          //         decoration: BoxDecoration(
          //             color: Colors.black,
          //             borderRadius: BorderRadius.only(
          //                 bottomRight: Radius.circular(6),
          //                 bottomLeft: Radius.circular(6))
          //         ),
          //       ),
          //     )
          //   ],
          // ),
          SizedBox(height: 10,),

          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(" FACTA Details", style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                        color: Color(0xff22263D),
                        fontSize: 20,
                        fontWeight: FontWeight.bold))
                  ,),
                Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width / 2,
                    child: Divider(color: Colors.black, thickness: 2,))
              ],
            ),
          ),

          SizedBox(height: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text("Where were you born?", style: GoogleFonts.sourceSansPro(
                  textStyle: const TextStyle(
                      color: Color(0xff22263D),
                      fontWeight: FontWeight.w400,
                      fontSize: 12),
                ),),
              ),
              SizedBox(height: 5,),
              Container(
                  child: Text("India", style: GoogleFonts.sourceSansPro(
                      textStyle: const TextStyle(
                          color: Color(0xff22263D),
                          fontWeight: FontWeight.bold,
                          fontSize: 15)),
                  ))
            ],
          ),
          SizedBox(height: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text("Your primary source of wealth?", style: GoogleFonts.sourceSansPro(
                  textStyle: const TextStyle(
                      color: Color(0xff22263D),
                      fontWeight: FontWeight.w400,
                      fontSize: 12),
                ),),
              ),
              SizedBox(height: 5,),
              Container(
                  child: Text(
                    "Salary", style: GoogleFonts.sourceSansPro(
                      textStyle: const TextStyle(
                          color: Color(0xff22263D),
                          fontWeight: FontWeight.bold,
                          fontSize: 15)),
                  ))
            ],
          ),

          SizedBox(height: 10,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              // Container(
              //   child:
              //   Text("Are You A Citizen Of The U.S.A?",
              //     style: GoogleFonts.sourceSansPro(
              //       textStyle: const TextStyle(
              //           color: Color(0xff22263D),
              //           fontWeight: FontWeight.w400,
              //           fontSize: 12),
              //     ),),
              // ),

              Container( padding: EdgeInsets.only(top: 10),
                alignment: Alignment.center,
                  child: Text("Are You A Citizen Of The U.S.A?", style: GoogleFonts.sourceSansPro(
                      textStyle: const TextStyle(
                          color: Color(0xff22263D),
                          fontWeight: FontWeight.bold,
                          fontSize: 15)),
                  )),

              CustomSwitch(
                activeColor: Colors.green,

                value: itrValue,
                onChanged: (value) {

                  setState(() {
                    itrValue = value;
                    if (value == true) {
                      itrValueInt = 1;
                    } else {
                      itrValueInt = 0;
                    }

                  });
                },
              )
            ],
          ),

          SizedBox(height: 10,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Container(
              //   child: Text(
              //     "Is Your Country Of Tax Residency, India?", style: GoogleFonts.sourceSansPro(
              //     textStyle: const TextStyle(
              //         color: Color(0xff22263D),
              //         fontWeight: FontWeight.w400,
              //         fontSize: 12),
              //   ),),
              // ),

              Container(
                padding: EdgeInsets.only(top: 6),
                  child: Text(
                    "Is Your Country Of Tax Residency, India?", style: GoogleFonts.sourceSansPro(
                      textStyle: const TextStyle(
                          color: Color(0xff22263D),
                          fontWeight: FontWeight.bold,
                          fontSize: 15)),
                  )),

              CustomSwitch(
                activeColor: Colors.green,

                value: itrValue,
                onChanged: (value) {

                  setState(() {
                    itrValue = value;
                    if (value == true) {
                      itrValueInt = 1;
                    } else {
                      itrValueInt = 0;
                    }

                  });
                },
              )
            ],
          ),

          SizedBox(height: 10,),





        ],
      ),
    ),
  );
}




Widget tmAccountDetails()
{
  return Card(
    child: Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          SizedBox(height: 10,),

          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("TM Account Details", style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                        color: Color(0xff22263D),
                        fontSize: 20,
                        fontWeight: FontWeight.bold))
                  ,),
                Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width / 2,
                    child: Divider(color: Colors.black, thickness: 2,))
              ],
            ),
          ),

          SizedBox(height: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text("Client ID", style: GoogleFonts.sourceSansPro(
                  textStyle: const TextStyle(
                      color: Color(0xff22263D),
                      fontWeight: FontWeight.w400,
                      fontSize: 12),
                ),),
              ),
              SizedBox(height: 5,),
              Container(
                  child: Text("13232324", style: GoogleFonts.sourceSansPro(
                      textStyle: const TextStyle(
                          color: Color(0xff22263D),
                          fontWeight: FontWeight.bold,
                          fontSize: 15)),
                  ))
            ],
          ),
          SizedBox(height: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text("Activation Date", style: GoogleFonts.sourceSansPro(
                  textStyle: const TextStyle(
                      color: Color(0xff22263D),
                      fontWeight: FontWeight.w400,
                      fontSize: 12),
                ),),
              ),
              SizedBox(height: 5,),
              Container(
                  child: Text(
                    "12/09/2022", style: GoogleFonts.sourceSansPro(
                      textStyle: const TextStyle(
                          color: Color(0xff22263D),
                          fontWeight: FontWeight.bold,
                          fontSize: 15)),
                  ))
            ],
          ),

          SizedBox(height: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text("Relationship Manager",
                  style: GoogleFonts.sourceSansPro(
                    textStyle: const TextStyle(
                        color: Color(0xff22263D),
                        fontWeight: FontWeight.w400,
                        fontSize: 12),
                  ),),
              ),
              SizedBox(height: 5,),
              Container(
                  child: Text("Pravin Parmar", style: GoogleFonts.sourceSansPro(
                      textStyle: const TextStyle(
                          color: Color(0xff22263D),
                          fontWeight: FontWeight.bold,
                          fontSize: 15)),
                  ))
            ],
          ),

          SizedBox(height: 10,),


        ],
      ),
    ),
  );
}




}
