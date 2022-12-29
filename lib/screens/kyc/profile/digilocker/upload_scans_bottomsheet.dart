import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trust_money/getx_controller/kra/kra_controller.dart';
import 'package:trust_money/getx_controller/profile/add_nominee_controller.dart';

import '../../../../repositories/profile_repository.dart';
import '../../../../utils/colorsConstant.dart';
import '../../../../utils/helper_widget/custom_snsckbar.dart';
import '../../../../utils/images.dart';
import '../../../../utils/styles.dart';

class UploadScansBottomSheet {
  static uploadScanBottomSheet(BuildContext context) {
    AddNomineeController _addNomineeController =
        Get.put(AddNomineeController());
    final KRAController _kraController = Get.put(KRAController());

    final _picker = ImagePicker();
    Get.bottomSheet(
       SizedBox(
         height: 700,
         child: Padding(
           padding: const EdgeInsets.symmetric(horizontal: 14.0),
           child: SingleChildScrollView(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 const SizedBox(
                   height: 30,
                 ),
                 Text(
                   "Upload ${_addNomineeController.selectedNomineeIndentitiy.value} Scans",
                   textAlign: TextAlign.center,
                   style: GoogleFonts.quicksand(
                     textStyle: const TextStyle(
                         color: Colors.white,
                         fontWeight: FontWeight.w400,
                         fontSize: 18),
                   ),
                 ),
                 const SizedBox(
                   height: 20,
                 ),
                 Center(
                   child: Container(
                     height: 290,
                     width: double.infinity,
                     decoration: BoxDecoration(
                         color: Colors.white,
                         borderRadius: BorderRadius.circular(15),
                         border: Border.all(
                             width: 0.5, color: Color(0xff707070))),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Container(
                           height: 45,
                           width: MediaQuery.of(context).size.width,
                           decoration: BoxDecoration(
                             borderRadius: const BorderRadius.only(
                               topLeft: Radius.circular(15),
                               topRight: Radius.circular(15),
                             ),
                             color: Color(0xffE1E0E7),
                             border: Border.all(
                                 width: 0.5, color: Color(0xff707070)),
                           ),
                           child: Center(
                             child: Text(
                               "${_addNomineeController.selectedNomineeIndentitiy.value} Frontside Preview",
                               style: GoogleFonts.sourceSansPro(
                                 textStyle: const TextStyle(
                                     color: Color(0xff22263D),
                                     fontWeight: FontWeight.w500,
                                     fontSize: 15),
                               ),
                             ),
                           ),
                         ),
                         const SizedBox(
                           height: 20,
                         ),
                         Stack(
                           children: [
                             Center(
                               child: Container(
                                 height: 160,
                                 width: 300,
                                 child: Obx(()=>_kraController.frontImageFile.value.path != ""
                                     ? Image.file(
                                   _kraController.frontImageFile.value,
                                   fit: BoxFit.cover,
                                 )
                                     : InkWell(
                                   onTap: () async {
                                     final pickedFile =
                                     await _picker.getImage(
                                         source:
                                         ImageSource.camera,
                                         imageQuality: 50);
                                     if (pickedFile != null) {
                                       _kraController.frontImageFile.value=
                                           File(pickedFile.path);
                                       _kraController.isFrontImageClick
                                           .value = true;
                                     }
                                   },
                                   child: Column(
                                     mainAxisAlignment:
                                     MainAxisAlignment.center,
                                     children: [
                                       Center(
                                         child: SvgPicture.asset(
                                           ConstantImage.upload,
                                           height: 50,
                                         ),
                                       ),
                                       Center(
                                         child: Text(
                                           "Upload Your ${_addNomineeController.selectedNomineeIndentitiy.value} Frontside ",
                                           style: GoogleFonts
                                               .sourceSansPro(
                                             textStyle:
                                             const TextStyle(
                                                 color: Color(
                                                     0xff22263D),
                                                 fontWeight:
                                                 FontWeight
                                                     .w500,
                                                 fontSize: 15),
                                           ),
                                         ),
                                       ),
                                     ],
                                   ),
                                 ),
                               )),
                             ),
                             Positioned(
                               bottom: 0,
                               right: -5,
                               child: InkWell(
                                 onTap: () async {
                                   final pickedFile = await _picker.getImage(
                                       source: ImageSource.camera);
                                   if (pickedFile != null) {
                                     _kraController.frontImageFile.value = File(pickedFile.path);
                                   }
                                 },
                                 child: Obx(() => Visibility(
                                   visible: _kraController
                                       .isFrontImageClick.value,
                                   child: Container(
                                     height: 20,
                                     width: 80,
                                     color: AppColors.primaryColor,
                                     child: Center(
                                         child: Text(
                                           "Replace",
                                           style: ConstStyle.quickStandSmall,
                                         )),
                                   ),
                                 )),
                               ),
                             ),
                           ],
                         ),
                         const SizedBox(
                           height: 20,
                         ),
                         Padding(
                           padding:
                           const EdgeInsets.symmetric(horizontal: 12.0),
                           child: RichText(
                             text: const TextSpan(children: [
                               TextSpan(
                                   text: "upload your ",
                                   style: TextStyle(
                                       fontStyle: FontStyle.italic,
                                       fontSize: 15,
                                       fontWeight: FontWeight.w400,
                                       color: Color(0xff22263D))),
                               TextSpan(
                                   text: "JPG, JPEG ",
                                   style: TextStyle(
                                       fontStyle: FontStyle.italic,
                                       fontSize: 15,
                                       fontWeight: FontWeight.w400,
                                       color: Color(0xffFF405A))),
                               TextSpan(
                                   text: "or ",
                                   style: TextStyle(
                                       fontSize: 15,
                                       fontStyle: FontStyle.italic,
                                       fontWeight: FontWeight.w400,
                                       color: Color(0xff22263D))),
                               TextSpan(
                                   text: "PNG ",
                                   style: TextStyle(
                                       fontSize: 15,
                                       fontStyle: FontStyle.italic,
                                       fontWeight: FontWeight.w400,
                                       color: Color(0xffFF405A))),
                               TextSpan(
                                   text: "in less than ",
                                   style: TextStyle(
                                       fontSize: 15,
                                       fontStyle: FontStyle.italic,
                                       fontWeight: FontWeight.w400,
                                       color: Color(0xff22263D))),
                               TextSpan(
                                   text: "10 MB ",
                                   style: TextStyle(
                                       fontSize: 15,
                                       fontStyle: FontStyle.italic,
                                       fontWeight: FontWeight.w400,
                                       color: Color(0xffFF405A))),
                             ]),
                           ),
                         ),
                       ],
                     ),
                   ),
                 ),
                 const SizedBox(
                   height: 15,
                 ),
                 Center(
                   child: Container(
                     height: 290,
                     width: double.infinity,
                     decoration: BoxDecoration(
                         color: Colors.white,
                         borderRadius: BorderRadius.circular(15),
                         border: Border.all(
                             width: 0.5, color: Color(0xff707070))),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Container(
                           height: 45,
                           width: MediaQuery.of(context).size.width,
                           decoration: BoxDecoration(
                             borderRadius: const BorderRadius.only(
                               topLeft: Radius.circular(15),
                               topRight: Radius.circular(15),
                             ),
                             color: Color(0xffE1E0E7),
                             border: Border.all(
                                 width: 0.5, color: Color(0xff707070)),
                           ),
                           child: Center(
                             child: Text(
                               "${_addNomineeController.selectedNomineeIndentitiy.value} Backside Preview",
                               style: GoogleFonts.sourceSansPro(
                                 textStyle: const TextStyle(
                                     color: Color(0xff22263D),
                                     fontWeight: FontWeight.w500,
                                     fontSize: 15),
                               ),
                             ),
                           ),
                         ),
                         const SizedBox(
                           height: 20,
                         ),
                         Stack(
                           children: [
                             Center(
                               child: Container(
                                 height: 160,
                                 width: 300,
                                 child: Obx(()=>_kraController.backImageFile.value.path != ""
                                     ? Image.file(
                                   _kraController.backImageFile.value,
                                   fit: BoxFit.cover,
                                 )
                                     : InkWell(
                                   onTap: () async {
                                     final pickedFile =
                                     await _picker.getImage(
                                         source:
                                         ImageSource.camera,
                                         imageQuality: 50);
                                     if (pickedFile != null) {
                                       _kraController.backImageFile.value = File(
                                         pickedFile.path,
                                       );
                                       _kraController.isBackImageClick
                                           .value = true;
                                     }
                                   },
                                   child: Column(
                                     mainAxisAlignment:
                                     MainAxisAlignment.center,
                                     children: [
                                       Center(
                                         child: SvgPicture.asset(
                                           ConstantImage.upload,
                                           height: 50,
                                         ),
                                       ),
                                       Center(
                                         child: Text(
                                           "Upload Your ${_addNomineeController.selectedNomineeIndentitiy.value} Backside ",
                                           style: GoogleFonts
                                               .sourceSansPro(
                                             textStyle:
                                             const TextStyle(
                                                 color: Color(
                                                     0xff22263D),
                                                 fontWeight:
                                                 FontWeight
                                                     .w500,
                                                 fontSize: 15),
                                           ),
                                         ),
                                       ),
                                     ],
                                   ),
                                 ),
                               )),
                             ),
                             Positioned(
                               bottom: 0,
                               right: -5,
                               child: InkWell(
                                 onTap: () async {
                                   final pickedFile = await _picker.getImage(
                                       source: ImageSource.camera);
                                   if (pickedFile != null) {
                                     _kraController.backImageFile.value = File(pickedFile.path);
                                   }
                                 },
                                 child: Obx(() => Visibility(
                                   visible: _kraController
                                       .isBackImageClick.value,
                                   child: Container(
                                     height: 20,
                                     width: 80,
                                     color: AppColors.primaryColor,
                                     child: Center(
                                         child: Text(
                                           "Replace",
                                           style: ConstStyle.quickStandSmall,
                                         )),
                                   ),
                                 )),
                               ),
                             ),
                           ],
                         ),
                         const SizedBox(
                           height: 20,
                         ),
                         Padding(
                           padding:
                           const EdgeInsets.symmetric(horizontal: 12.0),
                           child: RichText(
                             text: const TextSpan(children: [
                               TextSpan(
                                   text: "upload your ",
                                   style: TextStyle(
                                       fontStyle: FontStyle.italic,
                                       fontSize: 15,
                                       fontWeight: FontWeight.w400,
                                       color: Color(0xff22263D))),
                               TextSpan(
                                   text: "JPG, JPEG ",
                                   style: TextStyle(
                                       fontStyle: FontStyle.italic,
                                       fontSize: 15,
                                       fontWeight: FontWeight.w400,
                                       color: Color(0xffFF405A))),
                               TextSpan(
                                   text: "or ",
                                   style: TextStyle(
                                       fontSize: 15,
                                       fontStyle: FontStyle.italic,
                                       fontWeight: FontWeight.w400,
                                       color: Color(0xff22263D))),
                               TextSpan(
                                   text: "PNG ",
                                   style: TextStyle(
                                       fontSize: 15,
                                       fontStyle: FontStyle.italic,
                                       fontWeight: FontWeight.w400,
                                       color: Color(0xffFF405A))),
                               TextSpan(
                                   text: "in less than ",
                                   style: TextStyle(
                                       fontSize: 15,
                                       fontStyle: FontStyle.italic,
                                       fontWeight: FontWeight.w400,
                                       color: Color(0xff22263D))),
                               TextSpan(
                                   text: "10 MB ",
                                   style: TextStyle(
                                       fontSize: 15,
                                       fontStyle: FontStyle.italic,
                                       fontWeight: FontWeight.w400,
                                       color: Color(0xffFF405A))),
                             ]),
                           ),
                         ),
                       ],
                     ),
                   ),
                 ),
                 const SizedBox(
                   height: 20,
                 ),
                 Container(
                   height: 55,
                   color: Color(0xffE1E0E7),
                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Text(
                       "TIP: Scan or take a photo of your passport on the white-coloured background to avoid rejection",
                       style: ConstStyle.sourceSansPro,
                     ),
                   ),
                 ),
                 const SizedBox(height: 30,),
                 InkWell(
                   onTap: () async {
                     if (_kraController.frontImageFile != null && _kraController.backImageFile != null) {
                       _kraController.fileName1.value =
                           _kraController.frontImageFile.value.path.split('-').last;
                       _kraController.fileName2.value =
                           _kraController.backImageFile.value.path.split('-').last;
                       Get.dialog(const Center(
                         child: CircularProgressIndicator(),
                       ));
                       var res = await ProfileRepository().uploadScans(
                           proofType: _kraController.selectedNomonneeIdentificationId.value.toString(),
                           file1: _kraController.frontImageFile.value,
                           file2: _kraController.backImageFile.value);
                       if (res != null) {
                         Get.back();
                         Get.back();
                         _kraController.scansView.value = true;
                         _kraController.isUploadScansShow.value = false;
                       }
                     } else {
                       ShowCustomSnackBar().ErrorSnackBar("Capture Image First");
                     }
                   },
                   child: Container(
                     height: 45,
                     decoration: BoxDecoration(
                         border:
                         Border.all(width: 1.5, color: Colors.white)),
                     child: Center(
                         child: Text(
                           "Submit",
                           style: GoogleFonts.quicksand(
                               textStyle: const TextStyle(
                                   color: Colors.white,
                                   fontSize: 15,
                                   fontWeight: FontWeight.w500)),
                         )),
                   ),
                 ),
                 const SizedBox(height: 30,)
               ],
             ),
           ),
         )
       ),
        enableDrag: false,
        backgroundColor: AppColors.textColor,
        isDismissible: false,

        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30))));
  }
}
