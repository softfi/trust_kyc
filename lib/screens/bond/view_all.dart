import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rotated_corner_decoration/rotated_corner_decoration.dart';
import 'package:trust_money/screens/bond/bond_advantages.dart';
import 'package:trust_money/utils/images.dart';

import '../../bottom_navigation/bottom_navigation.dart';
import '../../utils/app_bar.dart';
import '../../utils/colorsConstant.dart';
import '../../utils/styles.dart';
import 'common_widget.dart';
import 'learn_bonds/cutome_lists.dart';

class ViewAll extends StatefulWidget {
  const ViewAll({Key? key}) : super(key: key);

  @override
  State<ViewAll> createState() => _ViewAllState();
}

class _ViewAllState extends State<ViewAll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppToolbar.appBar(
          "INVEST IN INDIA",
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          IconButton(
            icon: Container(
                padding: const EdgeInsets.all(1),
                decoration: const BoxDecoration(
                    color: Colors.transparent, shape: BoxShape.circle),
                child: const Icon(
                  Icons.person,
                  color: Colors.transparent,
                )),
            onPressed: () {},
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            viewAllWidget(),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 35,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.btnColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Load More",
                      style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                          color: Color(0xffFfffff),
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      )),
                  const Icon(
                    Icons.refresh,
                    size: 25,
                    color: Colors.white,
                  )
                ],
              ),
            ),
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

  Widget viewAllWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 7,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BondAdvantage()));
              },
              child: CustomTile(
                date: 'Jan 24, 2022',
                title: 'Is Bonds Good Investment Compared With Mutual..',
                image: Image.asset(
                  ConstantImage.dummy_bond,
                ),
                readText: 'Trading',
              ),
            ),
          );
        },
      ),
    );
  }

}
