import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../../api/apiClient.dart';
import '../../../../../utils/colorsConstant.dart';
import '../../../../../utils/helper_widget/custom_snsckbar.dart';
import '../../../../../utils/styles.dart';

class FormView extends StatelessWidget {
  FormView({Key? key, required this.onClick1}) : super(key: key);
  final void Function()? onClick1;


  Future download2(Dio dio, String url, String savePath) async {
    try {
      var response = await dio.get(
        url,
        onReceiveProgress: showDownloadProgress,
        //Received data with List<int>
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }),
      );
      print("Yha h natak"+response.data.toString());
      print("Yha h natak"+savePath);
      File file = File(savePath);
      var raf = file.openSync(mode: FileMode.write);
      // response.data is List<int> type
      raf.writeFromSync(response.data);
      await raf.close();
    } catch (e) {
      print(e);
    }
  }var dio = Dio();

  void showDownloadProgress(received, total) {
    if (total != -1) {
      print((received / total * 100).toStringAsFixed(0) + "%");
    }
  }

  void _download(String url,int randomPortName,String savePath) async {
    final status = await Permission.storage.request();

    if(status.isGranted) {
      final externalDir = await getExternalStorageDirectory();
   try{
     final id = await FlutterDownloader.enqueue(fileName: "$randomPortName",
       url: url,
       savedDir: externalDir!=null?externalDir.path:"",
       showNotification: true,
       openFileFromNotification: true,
     );
   }catch(e){
     ShowCustomSnackBar().ErrorSnackBar(e.toString());
   }
    } else {
      print('Permission Denied');
    }
  }


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
                if (response != null) {
                  // final externalDir = await getExternalStorageDirectory();

                 /* var tempDir = await getTemporaryDirectory();
                  String fullPath = tempDir.path + "/boo2.pdf'";
                  print('full path ${fullPath}');*/

                  // download2(dio, response,  externalDir!.path);
                 /* Random random = new Random();
                  int random_number = random.nextInt(1000000);
                  _download(response,random_number);*/



                  Map<Permission, PermissionStatus> statuses = await [
                    Permission.storage,
                    //add more permission to request here.
                  ].request();

                  if(statuses[Permission.storage]!.isGranted){
                    var dir = await DownloadsPathProvider.downloadsDirectory;
                    if(dir != null){ Random random = new Random();
                    int random_number = random.nextInt(1000000);
                      String savename = "file.pdf";
                      String savePath = dir.path + "/e-sign_$random_number.pdf";
                      print(savePath);
                      //output:  /storage/emulated/0/Download/banner.png

                      try {
var downloadProgress;
                 // _download(response,random_number,savePath);
                        await Dio().download(
                            response,
                            savePath,
                            onReceiveProgress: (received, total) {
                              if (total != -1) {
                                downloadProgress=(received / total * 100).toStringAsFixed(0) + "%";
                                print("asdasd"+
                                    downloadProgress
                                );

                                //you can build progressbar feature too
                                if((received / total * 100).toStringAsFixed(0) + "%"=="100"){

                                }

                              }
                            });
                        ShowCustomSnackBar().SuccessSnackBar("File is saved to download folder.");
                        print("File is saved to download folder.");
                      } on DioError catch (e) {
                        ShowCustomSnackBar().ErrorSnackBar(e.toString());
                      }
                    }
                  }else{
                    print("No permission to read and write.");
                  }


                  Fluttertoast.showToast(msg: "Downloading Started");
                 // downloadPdf(response);
                  // await HelperFunctions.saveuserkyccompleted(true);
                  // Get.back();
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
              onTap: () {
               onClick1!();
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
