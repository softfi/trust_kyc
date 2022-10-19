import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rotated_corner_decoration/rotated_corner_decoration.dart';
import 'package:trust_money/utils/images.dart';
import 'package:trust_money/utils/styles.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);
  // static final CameraPosition _kGooglePlex = CameraPosition(
  //   target: LatLng(37.42796133580664, -122.085749655962),
  //   zoom: 14.4746,
  // );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: Column(
          children: [
            Container(
              height: 80,
              color: Color(0xff00C6D8),
              child: Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon:
                          const Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        Text(
                          "CONTACT US",
                          style: ConstStyle.quickStandSmall11,
                        ),

                        IconButton(
                          icon:
                          const Icon(Icons.notifications_none, color: Colors.white),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        // Container(
                        //   width: 50,
                        // )
                      ],
                    ),
                    Positioned(
                      left: 0,
                      bottom: -1,
                      child: RotatedBox(
                        quarterTurns: 2,
                        child: Material(
                          elevation: 0,
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: const BoxDecoration(
                              color: Color(0xff00C6D8),
                            ),
                            foregroundDecoration: const RotatedCornerDecoration(
                              color: Colors.redAccent,
                              geometry: BadgeGeometry(
                                  width: 20, height: 20, cornerRadius: 0),
                            ),
                            child: Container(),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: -1,
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: Material(
                          elevation: 0,
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: const BoxDecoration(
                              color: Color(0xff00C6D8),
                            ),
                            foregroundDecoration: const RotatedCornerDecoration(
                              color: Colors.redAccent,
                              geometry: BadgeGeometry(
                                  width: 20, height: 20, cornerRadius: 0),
                            ),
                            child: Container(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Color(0xffE8E8E8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RotatedBox(
                    quarterTurns: 1,
                    child: Material(
                      elevation: 0,
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                          color: Colors.redAccent,
                        ),
                        foregroundDecoration: const RotatedCornerDecoration(
                          color: Color(0xffE8E8E8),
                          geometry: BadgeGeometry(
                              width: 30, height: 28, cornerRadius: 0),
                        ),
                        child: Container(),
                      ),
                    ),
                  ),
                  RotatedBox(
                    quarterTurns: 2,
                    child: Material(
                      elevation: 0,
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                          color: Colors.redAccent,
                        ),
                        foregroundDecoration: const RotatedCornerDecoration(
                          color: Color(0xffE8E8E8),
                          geometry: BadgeGeometry(
                              width: 28, height: 30, cornerRadius: 0),
                        ),
                        child: Container(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // AppBar(
      //   iconTheme: IconThemeData(color: Color(0xffffFFFFFF)),
      //   backgroundColor: Color(0xff00C6D8),
      //   title: Text("CONTACT US",
      //       style: GoogleFonts.quicksand(
      //         textStyle: const TextStyle(
      //             color: Color(0xffffFFFFFF),
      //             fontWeight: FontWeight.w500,
      //             fontSize: 19),
      //       )),
      //   actions: [
      //     IconButton(
      //         onPressed: () {},
      //         icon: Icon(
      //           Icons.notifications_none,
      //           color: Color(0xffffFFFFFF),
      //         ))
      //   ],
      // ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 11),
                height: 176.66,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(ConstantImage.contact_us))),
              ),
              Container(
                child: Text("Contact Us",
                    style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                          color: Color(0xff22263D),
                          fontWeight: FontWeight.w500,
                          fontSize: 19),
                    )),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  softWrap: true,
                  style: GoogleFonts.sourceSansPro(
                    textStyle: const TextStyle(
                      color: Color(0xff22263D),
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(child:Column(

                      children:[
                  Image(
                    image: AssetImage(ConstantImage.location_icon),
                    height: 67.51,
                    width: 48.97,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Our Location",
                      style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                            color: Color(0xff22263D),
                            fontWeight: FontWeight.w500,
                            fontSize: 21),
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    child: Text("Danmondi, 7563 King Meadow Suite 896, India",
                        style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                                color: Color(0xff22263D),
                                fontWeight: FontWeight.w500,
                                fontSize: 16))),
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 7,right:MediaQuery.of(context).size.width / 7 ),
                  ),
  ])),




                  SizedBox(height: 15,),




                  Container(child:Column(

                      children:[
                        Image(
                          image: AssetImage(ConstantImage.email_icon),
                          height: 67.51,
                          width: 48.97,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text("Email & Phone",
                            style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                                  color: Color(0xff22263D),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 21),
                            )),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          child: Text("Support@trustmoney.com 0428 6300 6300",
                              style: GoogleFonts.quicksand(
                                  textStyle: const TextStyle(
                                      color: Color(0xff22263D),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16))),
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 7,right:MediaQuery.of(context).size.width / 7 ),
                        ),
                      ])),




                  SizedBox(height: 15,),




                  Container(child:Column(

                      children:[
                        Image(
                          image: AssetImage(ConstantImage.get_in_touch),
                          height: 67.51,
                          width: 48.97,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text("Get In Touch",
                            style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                                  color: Color(0xff22263D),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 21),
                            )),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          child: Text("Also find us social media below",
                              style: GoogleFonts.quicksand(
                                  textStyle: const TextStyle(
                                      color: Color(0xff22263D),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16))),
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 7,right:MediaQuery.of(context).size.width / 7 ),
                        ),
                      ])),



                  SizedBox(height: 5,),

                  Row(

                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.facebook,color: Color(0xff000000),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(FontAwesomeIcons.twitter),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(FontAwesomeIcons.instagram),
                      ),
                    ],
                  ),




                  SizedBox(height: 20,),

                  Container(
                    alignment: Alignment.center,
                    height: 362,
                    color: Colors.grey.shade300,
                    child:Text("Map Will bw shown here"),
                    
                  ),

                  SizedBox(height: 15,),

                  Container(
                    child: Text("Don’t Hesitate To Drop Us A Line To Us.",style:GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                            color: Color(0xff22263D),
                            fontWeight: FontWeight.w500,
                            fontSize:22) ),
                  )),

                  SizedBox(height: 15,),
                  
                  Container(
                      alignment: Alignment.centerLeft,
                      child:Text("Your Name",style:GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                              color: Color(0xff22263D),
                              fontWeight: FontWeight.w500,
                              fontSize:14) ),)),



SizedBox(height: 5,),

                  Container(
                      alignment: Alignment.centerLeft,
                      child:Text("Rashedul kabir",style:GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                              color: Color(0xff22263D),
                              fontWeight: FontWeight.w500,
                              fontSize:18) ),)),

Divider(color: Colors.black,thickness: 2,),

SizedBox(height: 25,),
                  Container(
                      alignment: Alignment.centerLeft,
                      child:Text("Email",style:GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                              color: Color(0xff22263D),
                              fontWeight: FontWeight.w500,
                              fontSize:14) ),)),




                  Container(
                      alignment: Alignment.centerLeft,
                      child:Text("rashedul@gmail.com",style:GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                              color: Color(0xff22263D),
                              fontWeight: FontWeight.w500,
                              fontSize:18) ),)),

Divider(color: Colors.black,thickness: 2,),






                  SizedBox(height: 25,),
                  Container(
                      alignment: Alignment.centerLeft,
                      child:Text("Your Message",style:GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                              color: Color(0xff22263D),
                              fontWeight: FontWeight.w500,
                              fontSize:14) ),)),


SizedBox(height: 5,),

                  Container(
                      alignment: Alignment.centerLeft,
                      child:Text("Hi, This is rashed, I need some urgent help about the recent Bonds...",style:GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                              color: Color(0xff22263D),
                              fontWeight: FontWeight.w500,
                              fontSize:18) ),)),
SizedBox(height: 50,),
                  Divider(color: Colors.black,thickness: 2,),




                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
