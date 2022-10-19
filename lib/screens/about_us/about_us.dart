import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rotated_corner_decoration/rotated_corner_decoration.dart';
import 'package:trust_money/utils/colorsConstant.dart';
import 'package:trust_money/utils/images.dart';
import 'package:trust_money/utils/styles.dart';

class AboutUs extends StatelessWidget {
  // const AboutUs({Key? key}) : super(key: key);
final  pageviewController=PageController(
  initialPage: 0
);

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
                          "ABOUT US",
                          style: ConstStyle.quickStandSmall11,
                        ),

                        IconButton(
                          icon:
                          const Icon(Icons.person_pin, color: Colors.white),
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
              color: Colors.white,
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
                          color: Colors.white,
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
                          color: Colors.white,
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
      //   title: Text("ABOUT US",
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(
              image: AssetImage(ConstantImage.aboutUs1),
              height: 280,
            ),

            SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                  child: Text("Why We Are Starting Our Company?",style:  GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                        color: Color(0xff22263D),
                        fontWeight: FontWeight.bold,
                        fontSize: 19),
                  ),),
                  ),
                  Container(
                    child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",style:  GoogleFonts.sourceSansPro(
                      textStyle: const TextStyle(
                        color: Color(0xff22263D), fontWeight: FontWeight.w400, fontSize: 15,),
                    ),),
                  )
                ],
              ),
            ),



            Image(image: AssetImage(ConstantImage.aboutUs2),height: 302,),




            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text("Core Values",style:  GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                          color: Color(0xff22263D),
                          fontWeight: FontWeight.bold,
                          fontSize: 19),
                    ),),
                  ),
                  Container(
                    child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",style:  GoogleFonts.sourceSansPro(
                      textStyle: const TextStyle(
                        color: Color(0xff22263D), fontWeight: FontWeight.w400, fontSize: 15,),
                    ),),
                  )
                ],
              ),
            ),



            SizedBox(height: 20,),

            Text("What We Offer",style:  GoogleFonts.quicksand(
    textStyle: const TextStyle(
    color: Color(0xff22263D),
    fontWeight: FontWeight.w700,
    fontSize: 22),)),


            SizedBox(height: 2,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Text("Lorem ipsum dolor sit amet, consectetur adipisicing elit,",style:  GoogleFonts.quicksand(
                  textStyle: const TextStyle(
                      color: Color(0xffB0B1B9),
                      fontWeight: FontWeight.normal,
                      fontSize: 15),)),
              ),
            ),

            SizedBox(height:15 ,),


            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(

                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Container(
                        height: 155,
                        margin: EdgeInsets.only(left: 4,right: 4,top: 10,bottom: 15),
                        // width: MediaQuery.of(context).size.width/3.5,
                        child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image(image: AssetImage(ConstantImage.aboutUs3)),
                            ),
                            SizedBox(height: 5,),
                            Container(
                              child: Text("Curated Bonds",style: GoogleFonts.quicksand(
                                textStyle: const TextStyle(
                                    color: Color(0xff22263D),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14),),),
                            ),

                            Container(
                              // height:196,
                              width: 161,
                              child: Text("Our Team of Financial experts brings you a whole host of different categories of Bonds under a single roof.",style: GoogleFonts.quicksand(
                                textStyle: const TextStyle(
                                    color: Color(0xff8F919D),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 10),)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),



                  Padding(
                    padding: const EdgeInsets.all(8.0),

                    child: Card(
                      child: Container(
                        height: 155,
                        margin: EdgeInsets.only(left: 4,right: 4,top: 10,bottom: 15),
                        // width: MediaQuery.of(context).size.width/3.5,
                        child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image(image: AssetImage(ConstantImage.aboutUs4),height: 37,width: 40,),
                            ),
                            SizedBox(height: 5,),
                            Container(
                              child: Text("Bond Transaction",style: GoogleFonts.quicksand(
                                textStyle: const TextStyle(
                                    color: Color(0xff22263D),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14),),),
                            ),

                            Container(
                              // height:196,
                              width: 161,
                              child: Text("For hassle-free experience we facilitate our clients to buy or sell bonds in primary & Secondary market.",style: GoogleFonts.quicksand(
                                textStyle: const TextStyle(
                                    color: Color(0xff8F919D),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 10),)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),




                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Container(
                        height: 155,
                        margin: EdgeInsets.only(left: 4,right: 4,top: 10,bottom: 15),
                        // width: MediaQuery.of(context).size.width/3.5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image(image: AssetImage(ConstantImage.aboutUs5),height: 37,width: 40,),
                            ),
                            SizedBox(height: 5,),
                            Container(
                              child: Text("Detailed Information",style: GoogleFonts.quicksand(
                                textStyle: const TextStyle(
                                    color: Color(0xff22263D),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14),),),
                            ),

                            Container(
                              // height:196,
                              width: 161,
                              child: Text("Smart investment is about Knowledge and well informed decisions, we provide all the bond related info including Information Memorandum, Cash flows, Rating Rationales etc.",style: GoogleFonts.quicksand(
                                textStyle: const TextStyle(
                                    color: Color(0xff8F919D),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 10),)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )

                ],
              ),
            ),

            Container(
              height: 284.7,
              child:Image.asset(ConstantImage.aboutUs6)
            ),
            SizedBox(height: 15,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(

                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.centerLeft,
                    child: Text("Our Vision",style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                        color: Color(0xff22263D),
                      fontWeight: FontWeight.normal,
                      fontSize: 22),),
                  )),
SizedBox(height: 8,),
                  Container(
                    child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",style:  GoogleFonts.sourceSansPro(
                      textStyle: const TextStyle(
                        color: Color(0xff22263D), fontWeight: FontWeight.w400, fontSize: 15,),
                    ),),
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),

            Column(
              children: [
                Container(
                  child: Text("Our Leadership",style: GoogleFonts.quicksand(
              textStyle: const TextStyle(
                  color: Color(0xff22263D),
                  fontWeight: FontWeight.normal,
                  fontSize: 22),))),

                SizedBox(height: 5,),

                Padding(
                  padding: const EdgeInsets.only(left: 20.0,right: 20),
                  child: Container(
                    child: Text("We're a talented professional expert team ready to help you.",style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                          color: Color(0xff22263D),
                          fontWeight: FontWeight.normal,
                          fontSize: 15),),
                  )),

                ),


                SizedBox(height: 10,),


              ],
            ),


            Container(
              height:600,
              child: PageView(

                controller: pageviewController,
                reverse: true,
                children: [
                  Column(
                    children: [
                      // Container(
                      //     child: Text("Our Leadership",style: GoogleFonts.quicksand(
                      //       textStyle: const TextStyle(
                      //           color: Color(0xff22263D),
                      //           fontWeight: FontWeight.normal,
                      //           fontSize: 22),))),

                      SizedBox(height: 5,),

                      // Padding(
                      //   padding: const EdgeInsets.only(left: 20.0,right: 20),
                      //   child: Container(
                      //       child: Text("We're a talented professional expert team ready to help you.",style: GoogleFonts.quicksand(
                      //         textStyle: const TextStyle(
                      //             color: Color(0xff22263D),
                      //             fontWeight: FontWeight.normal,
                      //             fontSize: 15),),
                      //       )),
                      //
                      // ),
                      Container(
                        height: 450,
                        child: Image.asset(ConstantImage.aboutUs_pageView1),
                      ),

                      SizedBox(height: 10,),

                      Container(
                          child: Text("Hunter Kilos",style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                                color: Color(0xff000000),
                                fontWeight: FontWeight.normal,
                                fontSize: 26),),
                          )
                      ),
                      Text("Co-Founder",style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                            color: Color(0xffA5A5A5),
                            fontWeight: FontWeight.normal,
                            fontSize: 16),),)

                    ],
                  ),
                  Column(
                    children: [
                      // Container(
                      //     child: Text("Our Leadership",style: GoogleFonts.quicksand(
                      //       textStyle: const TextStyle(
                      //           color: Color(0xff22263D),
                      //           fontWeight: FontWeight.normal,
                      //           fontSize: 22),))),

                      SizedBox(height: 5,),

                      // Padding(
                      //   padding: const EdgeInsets.only(left: 20.0,right: 20),
                      //   child: Container(
                      //       child: Text("We're a talented professional expert team ready to help you.",style: GoogleFonts.quicksand(
                      //         textStyle: const TextStyle(
                      //             color: Color(0xff22263D),
                      //             fontWeight: FontWeight.normal,
                      //             fontSize: 15),),
                      //       )),
                      //
                      // ),
                      Container(
                        height: 450,
                        child: Image.asset(ConstantImage.aboutUs_pageView2),
                      ),

                      SizedBox(height: 10,),

                      Container(
                          child: Text("Hunter Kilos",style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                                color: Color(0xff000000),
                                fontWeight: FontWeight.normal,
                                fontSize: 26),),
                          )
                      ),
                      Text("Co-Founder",style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                            color: Color(0xffA5A5A5),
                            fontWeight: FontWeight.normal,
                            fontSize: 16),),)

                    ],
                  ),
                  Column(
                    children: [
                      // Container(
                      //     child: Text("Our Leadership",style: GoogleFonts.quicksand(
                      //       textStyle: const TextStyle(
                      //           color: Color(0xff22263D),
                      //           fontWeight: FontWeight.normal,
                      //           fontSize: 22),))),

                      SizedBox(height: 5,),

                      // Padding(
                      //   padding: const EdgeInsets.only(left: 20.0,right: 20),
                      //   child: Container(
                      //       child: Text("We're a talented professional expert team ready to help you.",style: GoogleFonts.quicksand(
                      //         textStyle: const TextStyle(
                      //             color: Color(0xff22263D),
                      //             fontWeight: FontWeight.normal,
                      //             fontSize: 15),),
                      //       )),
                      //
                      // ),
                      Container(
                        height: 450,
                        child: Image.asset(ConstantImage.aboutUs_pageView3),
                      ),

                      SizedBox(height: 10,),

                      Container(
                          child: Text("Hunter Kilos",style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                                color: Color(0xff000000),
                                fontWeight: FontWeight.normal,
                                fontSize: 26),),
                          )
                      ),
                      Text("Co-Founder",style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                            color: Color(0xffA5A5A5),
                            fontWeight: FontWeight.normal,
                            fontSize: 16),),)

                    ],
                  ),
                ],
              ),
            ),



            Container(
              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/17,right:  MediaQuery.of(context).size.width/14),
              child: Column(
                children: [
                  Text("We Have 7 Years Experienced See Our Company History",style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                        color: Color(0xff22263D),
                        fontWeight: FontWeight.normal,
                        fontSize: 22),)),

                  SizedBox(height: 10,),
                  Text("Lorem ipsum dolor sit amet, consectetur adipisicing elit,",style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                        color: Color(0xffB0B1B9),
                        fontWeight: FontWeight.normal,
                        fontSize: 15),))
                ],
              ),
            ),




            SizedBox(height: 15,),

            SizedBox(
              child: Container(
                child: ListFunction(),
              ),
            ),
SizedBox(height: 20,),


            subscribe(),

SizedBox(height: 10,),
            needHelp(),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }



  var headingList=["2016 TO 2018","2018 TO 2020","2020 TO 2022"];
  var dataList=["Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incidid labore dolore magna aliqua. enim ad minim veniam quis nostrud exercitation ullamco laboris nisi aliquip commodo consequat fugiat nulla.","Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incidid labore dolore magna aliqua. enim ad minim veniam quis nostrud exercitation ullamco laboris nisi aliquip commodo consequat fugiat nulla.","Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incidid labore dolore magna aliqua. enim ad minim veniam quis nostrud exercitation ullamco laboris nisi aliquip commodo consequat fugiat nulla."];




  ListFunction()
  {
    return
      ListView.builder(
        physics: NeverScrollableScrollPhysics(),
      itemCount:dataList.length,
      shrinkWrap: true,
      itemBuilder: (context,int index)
      {
        return Card(
          child:Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff58C3D5),Color(0xffEC515F)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight
              )
            ),
          child:ListTile(

              title:Text(headingList[index],style:GoogleFonts.quicksand(
                textStyle: const TextStyle(
                    color: Color(0xff22263D),
                    fontWeight: FontWeight.normal,
                    fontSize:22),) ,),
             subtitle: Text(dataList[index],style:GoogleFonts.quicksand(
                textStyle: const TextStyle(
                    color: Color(0xff22263D),
                    fontWeight: FontWeight.normal,
                    fontSize:12),) ,)

          )
          ),
        );
      },
    );
  }











Widget subscribe() {
  return Stack(
    children: [
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xffB2EEF8).withOpacity(0.10),
              const Color(0xffFFFFFF),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 38.0, horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Subscribe To",
                style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 20)),
              ),
              Text(
                "Bond Updates",
                style: GoogleFonts.quicksand(
                  textStyle: const TextStyle(
                      color: Color(0xffFF405A),
                      fontWeight: FontWeight.w600,
                      fontSize: 25),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Subscribe to get regular updates on the latest on Bonds from Trust Money",
                style: GoogleFonts.sourceSansPro(
                  textStyle: const TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 60,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: InputBorder.none,
                    hintText: "Enter your email here ",
                    contentPadding: EdgeInsets.only(left: 13, top: 10),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: 55,
                  width: 160,
                  decoration: const BoxDecoration(
                    color: AppColors.btnColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        bottomLeft: Radius.circular(50)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Subscribe",
                        style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 16)),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 20,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      Positioned(
        top: 8,
        right: 8,
        child: Image.asset(
          ConstantImage.leaf,
          color: Colors.black26,
          height: 300,
        ),
      )
    ],
  );
}

Widget needHelp(){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12.0),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Need Help?",
          style: GoogleFonts.quicksand(
            textStyle: const TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.w700,
                fontSize: 25),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 50,
          color: AppColors.textColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Speak to us",
                    style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    )),
                const Icon(Icons.arrow_forward_rounded,
                    size: 22, color: Colors.white)
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          height: 50,
          color: AppColors.textColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Assisted Buying / Spelling of Bond",
                    style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    )),
                const Icon(Icons.arrow_forward_rounded,
                    size: 22, color: Colors.white)
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          height: 50,
          color: AppColors.textColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("FAQ's",
                    style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    )),
                const Icon(Icons.arrow_forward_rounded,
                    size: 22, color: Colors.white)
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          height: 50,
          color: AppColors.textColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Learn from, Bond, Trust Bond",
                    style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    )),
                const Icon(Icons.arrow_forward_rounded,
                    size: 22, color: Colors.white)
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
}
