import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colorsConstant.dart';
import '../../utils/images.dart';
import '../bond/bond_advantages.dart';

class CustomListTile extends StatelessWidget {
  CustomListTile({
    Key? key,
    required this.image,
    required this.title,
    required this.date,
    required this.readText,
  }) : super(key: key);

  Widget image;
  String title, date, readText;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: false,
      leading: image,
      title: Text(
        title,
        style: GoogleFonts.quicksand(
            textStyle: const TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.bold,
                fontSize: 16)),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 6.0),
        child: Row(
          children: [
            Text(
              date,
              style: GoogleFonts.sourceSansPro(
                  textStyle: const TextStyle(
                      color: AppColors.btnColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 12)),
            ),
            const SizedBox(
              width: 10,
            ),
            ClipPath(
              clipper: Triangle(),
              child: Container(
                color: Color(0xffE1E0E7),
                height: 16,
                width: 75,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      readText,
                      style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 9)),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ViewAllWidget extends StatelessWidget {
  ViewAllWidget({Key? key, required this.title, required this.width})
      : super(key: key);
  String title;
  double width;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(width:width,
        decoration: const BoxDecoration(
          color: Color(0xffFF405A),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50), bottomLeft: Radius.circular(50)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16)),
              ),
              const SizedBox(
                width: 10,
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
    );
  }
}

class khabarenList extends StatelessWidget {
  const khabarenList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 2,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
          child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.25),
                spreadRadius: 2,
                blurRadius: 11,
                offset: const Offset(0, 3),
              ),
            ], color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: CustomListTile(
                readText: '5 min read',
                title: 'Rainmatter invests Rs 3.5 Cr in Trust Money',
                image: Image.asset(
                  ConstantImage.dummy_pic,
                ),
                date: 'Jan 24, 2022',
              ),
            ),
          ),
        );
      },
    );
  }
}

