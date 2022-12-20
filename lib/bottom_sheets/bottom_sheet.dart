import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/colorsConstant.dart';
import '../utils/images.dart';


class ShowBottomSheet{
  void CommomBottomSheet(BuildContext context,String middleText,String? imagePath,Widget? action) {
    showModalBottomSheet(
        context: context,
        isDismissible: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(35),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        builder: (context) {
          return BottomSheet(
            builder: (BuildContext context) {
              return StatefulBuilder(
                  builder: (BuildContext context, StateSetter State) {
                    return Wrap(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: const BoxDecoration(
                            color: AppColors.textColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(35),
                              topRight: Radius.circular(35),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 35,
                              ),
                              (imagePath!=null)?Image.asset(
                                ConstantImage.error,
                                width: 75,
                                height: 75,
                              ):Container(),
                              (imagePath!=null)?SizedBox(
                                height: 20,
                              ):Container(),
                              Center(
                                child: Text(
                                  middleText,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 23),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              action!=null?action:Container(),
                              action!=null?SizedBox(
                                height: 25,
                              ):Container(),
                            ],
                          ),
                        ),
                      ],
                    );
                  });
            },
            onClosing: () {},
          );
        });
  }
}