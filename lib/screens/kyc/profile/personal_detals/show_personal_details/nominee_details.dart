import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trust_money/screens/kyc/profile/personal_detals/app_textfield.dart';
import 'package:trust_money/screens/kyc/profile/personal_detals/show_personal_details/AddNomineeScreen.dart';
import 'package:trust_money/screens/kyc/profile/personal_detals/show_personal_details/custom_container.dart';
import '../../../../../../utils/colorsConstant.dart';
import '../../../../../../utils/images.dart';
import '../../../../../../utils/styles.dart';
import '../../../../../getx_controller/profile/personal_details_controller.dart';

class NomineeDetails extends StatelessWidget {
   NomineeDetails({Key? key}) : super(key: key);
  PersonalDetailsController _personalDetailsController = Get.find<PersonalDetailsController>();

  String title="";
  String fullName="";
  String relationshipWithApplication="";
  String panNumber="";
  String MobileNumber="";
  @override
  Widget build(BuildContext context) {
    // title=_personalDetailsController.nomineeDetails.value!.nomineeDetailsTitle;
    // fullName=_personalDetailsController.nomineeDetails.value!.nomineeDetailsFname+_personalDetailsController.nomineeDetails.value!.nomineeDetailsMname+_personalDetailsController.nomineeDetails.value!.nomineeDetailsLname;
    // relationshipWithApplication=_personalDetailsController.nomineeDetails.value!.nomineeDetailsRelationship;


    return  Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 15),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: const Color(0xffF7F7FA).withOpacity(0.35),
            border: Border.all(width: 1.2, color: const Color(0xffbcbcbc))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.end,children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(onTap: (){

                      Get.to(()=>AddNominee());
                    },
                      child: Container(
                        height: 25,
                        width: 70,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(5),
                                bottomRight: Radius.circular(5)),
                            color: AppColors.textColor),
                        child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:  const [
                                 Image(
                                  image: AssetImage(
                                    ConstantImage.edit,
                                  ),
                                  color:Colors.white,
                                  height: 14,
                                  width: 14,
                                ),

                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "Edit",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ],
                            )),
                      ),
                    ),
                  ),
                ),

                  Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: (){
                      Get.to(()=>AddNominee());
                    },
                    child: Container(
                      height: 25,
                      width: 70,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5)),
                          color: AppColors.textColor),
                      child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.person_add_alt_outlined,
                                color: Colors.white,
                                size: 14,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "Add",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ],
                          )),
                    ),
                  ),
                ),
              ],),

                Text(
                  "Nominee Details",
                  style: ConstStyle.quickMedium,
                ),
              ],
            ),
            _space1,
            Container(
              height: 3,
              width: 150,
              color: AppColors.textColor,
            ),
            const SizedBox(
              height: 10,
            ),
           ShowNomineeDetailsWidget()
          ],
        ),
      ),
    );
  }
  Widget get _space => const SizedBox(height: 16);
  Widget get _space1 => const SizedBox(height: 5);


  Widget ShowNomineeDetailsWidget(){
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DesableAppText(
          title: 'Title',
        ),
        _space1,
       Obx(()=> DesableTitleText(
          title:_personalDetailsController.nomineeDetails.value!=null?_personalDetailsController.nomineeDetails.value!.nomineeDetailsTitle:"")),
        _space,
        DesableAppText(
          title: 'Full Name',
        ),
        _space1,
        Obx(()=>DesableTitleText(
    title: _personalDetailsController.nomineeDetails.value!=null?_personalDetailsController.nomineeDetails.value!.nomineeDetailsFname+_personalDetailsController.nomineeDetails.value!.nomineeDetailsMname+_personalDetailsController.nomineeDetails.value!.nomineeDetailsLname:""),),
         // title:"${_personalDetailsController.nomineeDetails.value!.nomineeDetailsFname} ${_personalDetailsController.nomineeDetails.value!.nomineeDetailsLname}"),
        _space,
        DesableAppText(
          title: 'Relationship with Application',
        ),
        _space1,
        Obx(()=>DesableTitleText(title: _personalDetailsController.nomineeDetails.value!=null?_personalDetailsController.nomineeDetails.value!.nomineeDetailsRelationship:"",
          // title:"${_personalDetailsController.nomineeDetails.value!.nomineeDetailsRelationship}"
        )),
        _space,
        DesableAppText(
          title: 'Nominee Address ',
        ),
        _space1,
        Obx(()=>DesableTitleText(
          title:_personalDetailsController.nomineeDetails.value!=null?_personalDetailsController.nomineeDetails.value!.nomineeDetailsAddressLine1:"")),
        _space,
        DesableAppText(
          title: 'Mobile Number',
        ),
        _space1,
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              "assets/images/india.png",
              width: 20,
              height: 20,
              scale: 4,
            ),
            const SizedBox(
              width: 5,
            ),
            Obx(()=>DesableTitleText(
              title:
              _personalDetailsController.nomineeDetails.value!=null?"${_personalDetailsController.nomineeDetails.value!.nomineeDetailsMobileNumber}":"",
    ) ),

          ],
        ),
        _space,
        DesableAppText(
          title: 'Date of Birth - Should be as per Aadhar',
        ),
        _space1,
       Obx(()=>DesableTitleText(
          title:_personalDetailsController.nomineeDetails.value!=null?"${_personalDetailsController.nomineeDetails.value!.nomineeDetailsDob}":"")),
        _space,
        DesableAppText(
          title: 'Address (Same as the Applicant)',
        ),
        _space1,
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(width: 1, color: Color(0xffC8C7CD)),
            color: Color(0xffF7F7FA),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
            child: Obx(()=>Text(
              _personalDetailsController.nomineeDetails.value!=null?"${_personalDetailsController.nomineeDetails.value!.nomineeDetailsAddressLine1} ${_personalDetailsController.nomineeDetails.value!.nomineeDetailsAddressLine2} ${_personalDetailsController.nomineeDetails.value!.nomineeDetailsAddressLine3} ${_personalDetailsController.nomineeDetails.value!.nomineeDetailsAddressState} ${_personalDetailsController.nomineeDetails.value!.nomineeDetailsAddressStateCode} ${_personalDetailsController.nomineeDetails.value!.nomineeDetailsAddressZip} ":"" ,
              style: GoogleFonts.sourceSansPro(
                textStyle: const TextStyle(
                    color: Color(0xff22263D),
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    letterSpacing: 1),
              )),
            ),
          ),
        ),
        _space,
      ],
    );
  }
}
