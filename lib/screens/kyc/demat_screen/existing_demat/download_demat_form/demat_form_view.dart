import 'dart:math';

import 'package:dio/dio.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:trust_money/screens/kyc/demat_screen/html_viewer_screen.dart';
import '../../../../../api/apiClient.dart';
import '../../../../../utils/colorsConstant.dart';
import '../../../../../utils/helper_widget/custom_snsckbar.dart';
import '../../../../../utils/sharedPreference.dart';
import '../../../../../utils/styles.dart';
import '../../e_sign.dart';

class FormView extends StatelessWidget {
  FormView({Key? key, required this.onClick,required this.onClick1}) : super(key: key);
  final void Function()? onClick;
  final void Function()? onClick1;

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        height: MediaQuery.of(context).size.height / 1.35,
        padding: const EdgeInsets.all(12),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: const Color(0xffF7F7FA).withOpacity(0.35),
            border: Border.all(width: 1.2, color: const Color(0xffbcbcbc))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 3),
              child: Text(
                "Open Demat Account",
                style: ConstStyle.quickMedium,
              ),
            ),
            const Divider(
              thickness: 0.7,
              indent: 5,
              endIndent: 5,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "You can download your application form and cross-check it at your convenience.",
              style: GoogleFonts.quicksand(
                textStyle: const TextStyle(
                    color: Color(0xff22263D),
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
            ),
            _space,
            _space,
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
                        await HelperFunctions.saveuserkyccompleted(true);
                        onClick!();
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
                height: 45,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x29000000),
                      blurRadius: 4.0,
                    ),
                  ],
                  border: Border.all(width: 1.4, color: AppColors.textColor),
                  color: Colors.white,
                ),
                child: Center(
                    child: Text(
                  "Download Your Application Form",
                  style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
                )),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.85,
            ),
            InkWell(
              onTap: () async {

                var response = await APiProvider().eSignPdf();
                if(response !=null){
                 // Get.to(()=>ESign(response:response));
                  Navigator.push(context, MaterialPageRoute(builder: (builder)=>HTMLViewer(response.toString())));
                }
               // onClick1!();
              },
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x29000000),
                      blurRadius: 4.0,
                    ),
                  ],
                  border: Border.all(width: 1.4, color: AppColors.textColor),
                  color: Colors.white,
                ),
                child: Center(
                    child: Text(
                  "Continue to E-Sign Process",
                  style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
                )),
              ),
            ),
            _space,
            Center(
              child: Text(
                "Save & Complete Later",
                style: GoogleFonts.sourceSansPro(
                  textStyle: const TextStyle(
                      color: Color(0xff22263D),
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget get _space => const SizedBox(height: 16);

  Widget get _space1 => const SizedBox(height: 5);
}
