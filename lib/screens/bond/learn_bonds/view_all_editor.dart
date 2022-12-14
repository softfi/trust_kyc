import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trust_money/screens/bond/learn_bonds/view_all_list.dart';
import 'package:trust_money/screens/news_and_insights/explore.dart';

import '../../../utils/app_bar.dart';
import '../../../utils/colorsConstant.dart';
import '../../../utils/images.dart';
import '../bond_advantages.dart';
import '../common_widget.dart';

class ViewAllEditors extends StatelessWidget {
   ViewAllEditors({Key? key,required this.title}) : super(key: key);
  String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppToolbar.appBar(
          title,
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          IconButton(
            icon: Container(padding: const EdgeInsets.all(1),
                decoration:
                    const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: const Icon(
                  Icons.person,
                  size: 20,
                  color: const Color(0xff00C6D8),
                )),
            onPressed: () {},
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            editorList(),
            const SizedBox(
              height: 20,
            ),
            CommonWidget.subscribe(),
            const SizedBox(
              height: 20,
            ),
            CommonWidget.needHelp(),
          ],
        ),
      ),
    );
  }

  Widget editorList() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 8,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 12),
          child: InkWell(onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NewsAndInsightExplore()));
          },
            child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.11),
                      spreadRadius: 5,
                      blurRadius: 11,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      ConstantImage.dummy_pic,
                      height: 80,
                      width: MediaQuery.of(context).size.width * 0.26,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.60,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "What are 54EC Bonds or Capital Gain Bonds",
                              style: GoogleFonts.quicksand(
                                  textStyle: const TextStyle(
                                      color: AppColors.textColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Jan 24, 2022",
                                  style: GoogleFonts.sourceSansPro(
                                      textStyle: const TextStyle(
                                          color: AppColors.btnColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12)),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                ClipPath(
                                  clipper: Triangle(),
                                  child: Container(
                                    color: Color(0xffE1E0E7),
                                    height: 17,
                                    width: 75,
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          "5 min read",
                                          style: GoogleFonts.sourceSansPro(
                                              textStyle: const TextStyle(
                                                  color: AppColors.primaryColor,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 9)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ]),
                    )
                  ],
                )),
          ),
        );
      },
    );
  }
}
