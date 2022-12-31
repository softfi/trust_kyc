import 'dart:math';

import 'package:dio/dio.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:trust_money/utils/colorsConstant.dart';

import '../../../api/apiClient.dart';
import '../../../utils/helper_widget/custom_snsckbar.dart';
import '../../../utils/images.dart';
import '../../../utils/sharedPreference.dart';
import '../profile/my_profile.dart';

class AllDocsView extends StatelessWidget {
  const AllDocsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              top: 20,
              right: -30,
              child: Image.asset(
                ConstantImage.leaf,
                color: const Color(0xff00C6D8).withOpacity(0.60),
                height: 605,
                width: 341,
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: Text(
                      "Complete Your KYC Online And Start Investing In Just Few Minutes",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                              color: Color(0xff22263D),
                              fontSize: 18,
                              fontWeight: FontWeight.w500))),
                ),
                Center(
                  child: Image.asset(
                    ConstantImage.chooseImage,
                    height: 242,
                    width: 200,
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28.0),
                    child: Text("List of Documents Collected",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.sourceSansPro(
                            textStyle: const TextStyle(
                                color: Color(0xff22263D),
                                fontSize: 16,
                                fontWeight: FontWeight.w500))),
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.09),
                            spreadRadius: 2,
                            blurRadius: 11,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Image.asset(
                              ConstantImage.pan,
                              height: 41,
                              width: 48,
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Text("PAN Number",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                        color: Color(0xff22263D),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500))),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Align(
                                alignment: Alignment.bottomRight,
                                child: Image.asset(
                                  "assets/images/done1.png",
                                  color: Colors.green,
                                  scale: 8,
                                )),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.09),
                            spreadRadius: 2,
                            blurRadius: 11,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Image.asset(
                              ConstantImage.adhar,
                              height: 41,
                              width: 48,
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Text("Aadhaar Number",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                        color: Color(0xff22263D),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500))),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Align(
                                alignment: Alignment.bottomRight,
                                child: Image.asset(
                                  "assets/images/done1.png",
                                  color: Colors.green,
                                  scale: 8,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.09),
                            spreadRadius: 2,
                            blurRadius: 11,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Image.asset(
                              ConstantImage.bank,
                              height: 41,
                              width: 48,
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Text("Bank Details",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                        color: Color(0xff22263D),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500))),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Align(
                                alignment: Alignment.bottomRight,
                                child: Image.asset(
                                  "assets/images/done1.png",
                                  color: Colors.green,
                                  scale: 8,
                                )),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.09),
                            spreadRadius: 2,
                            blurRadius: 11,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Image.asset(
                              ConstantImage.demat,
                              height: 41,
                              width: 48,
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Text("Demat Details",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                        color: Color(0xff22263D),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500))),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Image.asset(
                                "assets/images/done1.png",
                                color: Colors.green,
                                scale: 8,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => MyProfile()),
                        (e) => false);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 48,
                    width: MediaQuery.of(context).size.width / 1.6,
                    color: AppColors.btnColor,
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22.0),
                      child: Text(
                        "Continue to Profile Section",
                        style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500)),
                      ),
                    )),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () async {
                    var response = await APiProvider().downloadPDF();
                    await HelperFunctions.saveuserkyccompleted(true);
                    if (response != null) {
                      Map<Permission, PermissionStatus> statuses = await [
                        Permission.storage,
                      ].request();
                      if (statuses[Permission.storage]!.isGranted) {
                        ShowCustomSnackBar().SuccessSnackBar("Downloading Started");
                        var dir = await DownloadsPathProvider.downloadsDirectory;
                        if (dir != null) {
                          Random random = new Random();
                          int random_number = random.nextInt(1000000);
                          String savePath = dir.path + "/e-sign_$random_number.pdf";
                          print(savePath);
                          try {
                            var downloadProgress;
                            await Dio().download(response, savePath,
                                onReceiveProgress: (received, total) {
                                  if (total != -1) {
                                    downloadProgress =
                                        (received / total * 100).toStringAsFixed(0) + "%";
                                    if ((received / total * 100).toStringAsFixed(0) +
                                        "%" ==
                                        "100") {}
                                  }
                                });
                            ShowCustomSnackBar().SuccessSnackBar(
                                "File is saved to download folder e-sign_$random_number.pdf");
                            Get.back();
                            Get.back();
                            await HelperFunctions.saveuserkyccompleted(true);
                           // onClick!();
                          } on DioError catch (e) {
                            ShowCustomSnackBar().ErrorSnackBar(e.toString());
                          }
                        }
                      } else {
                        ShowCustomSnackBar()
                            .ErrorSnackBar("No permission to read and write.");
                      }
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 48,
                    width: MediaQuery.of(context).size.width / 1.2,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.7,
                        color: AppColors.textColor,
                      ),
                      color: Colors.white,
                    ),
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Text(
                        "Download Your Application Form",
                        style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                                color: AppColors.textColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500)),
                      ),
                    )),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
