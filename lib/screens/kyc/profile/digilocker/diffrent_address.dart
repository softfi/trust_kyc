import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trust_money/getx_controller/kra/kra_controller.dart';
import 'package:trust_money/getx_controller/profile/add_nominee_controller.dart';
import 'package:trust_money/screens/kyc/profile/digilocker/upload_scans_bottomsheet.dart';
import 'package:trust_money/screens/kyc/profile/personal_detals/app_textfield.dart';
import 'package:trust_money/utils/helper_widget/custom_snsckbar.dart';

import '../../../../utils/colorsConstant.dart';

class DifferentAddress extends StatelessWidget {
  DifferentAddress({Key? key}) : super(key: key);
  AddNomineeController _addNomineeController = Get.put(AddNomineeController());
  final KRAController _kraController = Get.put(KRAController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          title: 'Address Proof',
        ),
        _space1,
        Obx(() => Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(width: 1.1, color: AppColors.borderColor),
              color: Colors.white,
            ),
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    hint: const Text("Select Identifaction",
                        style: TextStyle(
                            color: Color(0xffC8C7CE), letterSpacing: 2)),
                    items: _addNomineeController.nomineeIdentifiactionList.value
                        .map((item) {
                      return DropdownMenuItem(
                        value: item.addressProof,
                        child: Text(
                          item.addressProof,
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      var a = _addNomineeController
                          .nomineeIdentifiactionList.value
                          .where((element) {
                        if (element.addressProof == newValue.toString()) {
                          _addNomineeController.selectedNomonneeIdentificationId
                              .value = element.nomineeIdentificationId;
                        }
                        return true;
                      });
                      debugPrint(a.toString());
                      debugPrint(_addNomineeController
                          .selectedNomonneeIdentificationId.value.toString());
                      debugPrint("a.toString()");
                      _addNomineeController.selectedNomineeIndentitiy.value = newValue.toString();
                    },
                    value: _addNomineeController.selectedNomineeIndentitiy.value,
                  ),
                )))),
        _space1,
        Text(
          "Enter your address details exactly as per your document otherwise your application will get rejected",
          style: GoogleFonts.sourceSansPro(
            textStyle: const TextStyle(
                color: AppColors.btnColor,
                fontWeight: FontWeight.w500,
                fontSize: 14),
          ),
        ),
        _space,
        Obx(() => Visibility(visible: _kraController.isUploadScansShow.value,
          child: InkWell(
            onTap: () {
              if( _addNomineeController.selectedNomineeIndentitiy.value == null){
                ShowCustomSnackBar().ErrorSnackBar("Select Address Proof First");
              }else{
                UploadScansBottomSheet.uploadScanBottomSheet(context);
              }
            },
            child: Container(
              height: 55,
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
                "Upload ${_addNomineeController.selectedNomineeIndentitiy.value} Scans",
                style: GoogleFonts.quicksand(
                  textStyle: TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
              )),
            ),
          ),
        )),
        Obx(() => Visibility(visible: _kraController.scansView.value,
         child: Column(crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Obx(() => AppText(
               title:
               '${_addNomineeController.selectedNomineeIndentitiy.value} Front side Image',
             )),
             _space1,
             TextContainer(
               color: Color(0xffF7F7FA),
               titleText: _kraController.fileName1.value,
               perfixIcon: Container(),
               postfixIcon: Image.asset(
                 "assets/images/edit.png",
                 color: AppColors.textColor,
                 scale: 4,
               ),
             ),
             _space,
             Obx(() => AppText(
               title:
               '${_addNomineeController.selectedNomineeIndentitiy.value} Backside Image',
             )),
             _space1,
             TextContainer(
               color: Color(0xffF7F7FA),
               titleText: _kraController.fileName2.value,
               perfixIcon: Container(),
               postfixIcon: Image.asset(
                 "assets/images/edit.png",
                 color: AppColors.textColor,
                 scale: 4,
               ),
             ),
           ],
         ),
       )),
        _space,
        AppText(
          title: 'Add New Address',
        ),
        _space1,
        AppTextField(
          textCapitalization: TextCapitalization.sentences,
          hint: "Address Line 1",
          controller: _kraController.addressline1.value,
          textInputType: TextInputType.text,
          lengthFormater: LengthLimitingTextInputFormatter(36),
        ),
        _space,
        AppTextField(
          textCapitalization: TextCapitalization.sentences,
          hint: "Address Line 2",
          controller: _kraController.addressline2.value,
          textInputType: TextInputType.text,
          lengthFormater: LengthLimitingTextInputFormatter(36),
        ),
        _space,
        AppText(
          title: 'Pincode',
        ),
        _space1,
        AppTextField(
          textCapitalization: TextCapitalization.none,
          hint: "PinCode",
          controller: _kraController.pinCode.value,
          textInputType: TextInputType.number,
          lengthFormater: LengthLimitingTextInputFormatter(6),
        ),
        _space,
        AppText(
          title: 'Select State',
        ),
        _space1,
        Obx(() => Container(
            height: 50,
            // width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(width: 1.1, color: AppColors.borderColor),
              color: Colors.white,
            ),
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    dropdownFullScreen: true,
                    dropdownOverButton: true,
                    buttonWidth: double.infinity,
                    hint: const Text("Select State",
                        style: TextStyle(
                            color: Color(0xffC8C7CE), letterSpacing: 2)),
                    items: _addNomineeController.stateList.value.map((item) {
                      return DropdownMenuItem(
                        value: item.stateName,
                        child: Text(
                          item.stateName,
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      debugPrint("00000000000000000000000");
                      debugPrint(newValue.toString());
                      var a = _addNomineeController.stateList.value
                          .where((element) {
                        debugPrint(element.stateId.toString());
                        debugPrint("element.stateId.toString()");
                        if (element.stateName == newValue.toString()) {
                          _addNomineeController.selectedStateId.value =
                              element.stateId;
                        }
                        return true;
                      });
                      debugPrint(a.toString());
                      _addNomineeController.SelectedState.value =
                          newValue.toString();
                      _addNomineeController.getCity();
                    },
                    value: _addNomineeController.SelectedState.value,
                  ),
                )))),
        _space,
        Obx(() => _addNomineeController.SelectedState.value != null
            ? AppText(
                title: 'Select City',
              )
            : Container()),
        Obx(() => _addNomineeController.SelectedState.value != null
            ? _space1
            : Container()),
        Obx(() => _addNomineeController.SelectedState.value != null
            ? Container(
                height: 50,
                // width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 1.1, color: AppColors.borderColor),
                  color: Colors.white,
                ),
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        buttonWidth: double.infinity,
                        hint: const Text("Select City",
                            style: TextStyle(
                                color: Color(0xffC8C7CE), letterSpacing: 2)),
                        items: _addNomineeController.cityList.value.map((item) {
                          return DropdownMenuItem(
                            value: item.cityName,
                            child: SizedBox(
                              width: 300,
                              child: Text(
                                item.cityName,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          _addNomineeController.SelectedCity.value =
                              newValue.toString();
                        },
                        value: _addNomineeController.SelectedCity.value,
                      ),
                    )))
            : Container()),
        _space1,
        _space1,
      ],
    );
  }

  Widget get _space => const SizedBox(height: 16);

  Widget get _space1 => const SizedBox(height: 5);
}
