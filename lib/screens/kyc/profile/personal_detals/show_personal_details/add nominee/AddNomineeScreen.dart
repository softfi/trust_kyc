import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trust_money/screens/kyc/profile/personal_detals/app_textfield.dart';
import '../../../../../../getx_controller/kra/kra_controller.dart';
import '../../../../../../getx_controller/personal details controller/add_nominee_controller.dart';

import '../../../../../../getx_controller/profile/personal_details_controller.dart';
import '../../../../../../model/profession_response_data.dart';
import '../../../../../../model/relationship_dropdown_response_data.dart';
import '../../../../../../utils/app_bar.dart';
import '../../../../../../utils/colorsConstant.dart';
import '../../../../../../utils/styles.dart';
import '../../../digilocker/custom_dropdown.dart';
import '../custom_container.dart';
import '../show_personal_details.dart';

class AddNominee extends StatelessWidget {
  AddNominee({Key? key}) : super(key: key);
  AddNomineeController _addNomineeController = Get.put(AddNomineeController());
  KRAController _kRAController = Get.put(KRAController());
  PersonalDetailsController _personalDetailsController =
      Get.put(PersonalDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppToolbar.appBar(
          "Profile",
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          IconButton(
            icon: Container(
                padding: const EdgeInsets.all(1),
                decoration: const BoxDecoration(
                    color: Colors.transparent, shape: BoxShape.circle),
                child: const Icon(Icons.person,
                    size: 20, color: Colors.transparent)),
            onPressed: () {},
          )),
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 15),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color(0xffF7F7FA).withOpacity(0.35),
              border: Border.all(width: 1.2, color: const Color(0xffbcbcbc))),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => AddNominee());
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
                                Icons.highlight_remove,
                                color: Colors.white,
                                size: 14,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "Close",
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
                  ],
                ),
                Text(
                  "Nominee Details",
                  style: ConstStyle.quickMedium,
                ),
                _space1,
                Divider(
                  color: Colors.grey,
                ),
                NomineeForm(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget get _space => const SizedBox(height: 16);

  Widget get _space1 => const SizedBox(height: 5);

  Widget NomineeForm(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _space,
        AppText(
          title: 'Title',
        ),
        _space1,
        /*  Container(
            height: 45,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(width: 1.1, color: AppColors.borderColor),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Obx(() => DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      value: _addNomineeController.mrsValue.value,
                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),
                      // Array list of items
                      items:
                          _addNomineeController.items.value.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        _addNomineeController.mrsValue.value =
                            newValue.toString();
                      },
                    ),
                  )),
            )),*/
     /*   Obx(() => Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(width: 1.1, color: AppColors.borderColor),
            ),
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: DropDownContainer(
                  dropdownHeading: "Select Title",
                  dropDownInitialValue:
                  "Mr".obs,
                  dropDownList: ["Mr","Mrs"],
                  on_drop_down_change: (val) {
                    _addNomineeController.Relationshipwithapplication.value=val.toString();
                  },
                )))),*/


        Obx(()=>Container(
            height: 45,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border:
              Border.all(width: 1.1, color: AppColors.borderColor),
              color: Colors.white,
            ),
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    hint: const Text("Select Title",
                        style: TextStyle(
                            color: Color(0xffC8C7CE), letterSpacing: 2)),
                    items: ["Mrs","Ms"].map((item) {
                      return DropdownMenuItem(
                        value: item,
                        child:  Text(
                          item,
                        ),
                      );
                    }).toList(),
                    onChanged:  (newValue) {
                      _addNomineeController.mrsValue.value =
                          newValue.toString();
                    },
                    value: _addNomineeController.mrsValue.value,
                  ),
                )))),


        _space,
        AppText(
          title: 'Full Name',
        ),
        _space1,
        Obx(() => AppTextField(
              textCapitalization: TextCapitalization.words,
              hint: 'Enter Full Name',
              controller: _addNomineeController.fullNomineeName.value,
              textInputType: TextInputType.text,
            )),
        _space,
        AppText(
          title: 'Relationship with application',
        ),
        _space1,

        Obx(()=>Container(
            height: 45,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border:
              Border.all(width: 1.1, color: AppColors.borderColor),
              color: Colors.white,
            ),
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    hint: const Text("Relationship with application",
                        style: TextStyle(
                            color: Color(0xffC8C7CE), letterSpacing: 2)),
                    items: _addNomineeController.relationShipList.value.map((item) {
                      return DropdownMenuItem(
                        value: item.relationshipWithApplicationName,
                        child:  Text(
                          item.relationshipWithApplicationName,
                        ),
                      );
                    }).toList(),
                    onChanged:  (newValue) {
                      _addNomineeController.relationshipID.value= newValue.toString();
                      debugPrint(_addNomineeController.relationshipID.value.toString());
                    },
                    value: _addNomineeController.relationshipID.value,
                  ),
                )))),


        _space1,
        _space1,
        _space1,
        AppText(
          title: 'Nominee Identifaction',
        ),
        _space1,
        Obx(()=>Container(
            height: 45,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border:
              Border.all(width: 1.1, color: AppColors.borderColor),
              color: Colors.white,
            ),
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    hint: const Text("Select Identifaction",
                        style: TextStyle(
                            color: Color(0xffC8C7CE), letterSpacing: 2)),
                    items: _addNomineeController.nomineeIdentifiactionList.value.map((item) {
                      return DropdownMenuItem(
                        value: item.addressProof,
                        child:  Text(
                          item.addressProof,
                        ),
                      );
                    }).toList(),
                    onChanged:  (newValue) {
                      var a=_addNomineeController.nomineeIdentifiactionList.value.where((element){
                        if(element.addressProof==newValue.toString()){
                          _addNomineeController.selectedNomonneeIdentificationId.value=element.nomineeIdentificationId;
                        }
                        return true;
                      });
                      debugPrint(a.toString());
                      debugPrint(_addNomineeController.selectedNomonneeIdentificationId.value.toString());
                      debugPrint("a.toString()");
                      _addNomineeController.selectedNomineeIndentitiy.value= newValue.toString();
                    },
                    value: _addNomineeController.selectedNomineeIndentitiy.value,
                  ),
                )))),
        // _space1,






        /*Obx( () => Container(
          width: double.infinity,
          padding: EdgeInsets.only(left: 14.0, bottom: 7.0, top: 6.0),
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(width: 1, color: AppColors.borderColor),
            color: Colors.white,
          ),
          child: DropdownButton(
            hint: const Text('Select Relationship',),
            onChanged: (newValue) {
              _addNomineeController.relationshipID.value = newValue.toString();
            },
            value:_addNomineeController.relationshipID.value,
            items:_addNomineeController.relationShipList.value.map((item) {
              return DropdownMenuItem(
                value: item.relationshipWithApplicationName,
                child:  Text(
                  item.relationshipWithApplicationName,
                ),
              );
            }).toList(),
          ),
        )
        ),*/
      /*  Obx(()=>Container(
            height: 45,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                  width: 1.1, color: AppColors.borderColor),
            ),
            child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 14.0),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    hint: const Text(
                        "Select Relationship",
                        style: TextStyle(
                          color: Color(0xffC8C7CE),
                        )),
                    items: _addNomineeController.relationShipList.value.map((item) {
                      return DropdownMenuItem(
                          value: item.relationshipWithApplicationName
                              .toString(),
                          child: Text(
                            item.relationshipWithApplicationName.toString(),
                            //Names that the api dropdown contains
                            style: const TextStyle(
                              fontSize: 17.0,
                            ),
                          ));
                    }).toList(),
                    onChanged: (newVal) {
                      _addNomineeController.relationshipID.value = newVal.toString();
                    },
                    value: _addNomineeController.relationshipID.value,
                  ),
                )))),*/

        // _space1,
        /*  Container(
            height: 45,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(width: 1.1, color: AppColors.borderColor),
            ),
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Obx(() => DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        hint: const Text("Select Relationship",
                            style: TextStyle(
                              color: Color(0xffC8C7CE),
                            )),
                        items: _addNomineeController.professionList.value
                            .map((item) {
                          return DropdownMenuItem(
                              value: item.relationshipWithApplicationName
                                  .toString(),
                              child: Text(
                                item.relationshipWithApplicationName,
                                style: const TextStyle(
                                  fontSize: 17.0,
                                ),
                              ));
                        }).toList(),
                        onChanged: (newVal) {
                          _addNomineeController.relationshipID.value =
                              newVal.toString();
                          print(_addNomineeController.relationshipID.value);
                        },
                        value: _addNomineeController.relationshipID.value,
                      ),
                    )))),*/
        // _space,
        // AppText(
        //   title: 'Last Name* ',
        // ),
        // _space1,
        // TextContainer(
        //   titleText: ' JaiRaj',
        //   perfixIcon: Container(),
        //   postfixIcon: Container(),
        //   color: Color(0xffF7F7FA),
        // ),
        Obx(()=>_addNomineeController.selectedNomineeIndentitiy.value!=null?_space:Container()),
        Obx(()=>_addNomineeController.selectedNomineeIndentitiy.value!=null?AppText(
          title: "${_addNomineeController.selectedNomineeIndentitiy.value}",
        ):Container()),
    Obx(()=>_addNomineeController.selectedNomineeIndentitiy.value!=null?_space1:Container()),
    Obx(()=>_addNomineeController.selectedNomineeIndentitiy.value!=null?AppTextField(
          textCapitalization: TextCapitalization.words,
          hint: "${_addNomineeController.selectedNomineeIndentitiy.value}",
          controller: _addNomineeController.nominneeIdProof.value,
          textInputType: TextInputType.text,
        ):Container()),
        // TextContainer(
        //   color: Colors.white,
        //   titleText: "BIOPC5172A",
        //   perfixIcon: Container(),
        //   postfixIcon: Container(),
        // ),
        _space,
        AppText(
          title: 'Mobile Number',
        ),
        _space1,
        AppTextField(
          textCapitalization: TextCapitalization.words,
          hint: "Enter mobile number",
          controller: _addNomineeController.nominneeMobileNumber.value,
          textInputType: TextInputType.text,
        ),
        _space,
        AppText(
          title: 'Date of Birth',
        ),
        _space1,
        InkWell(
          onTap: () {
            _addNomineeController.pickDate();
          },
          child: Obx(() => TextContainer(
              color: Colors.white,
              titleText: _addNomineeController.dob.value,
              perfixIcon: Container(),
              postfixIcon: Icon(Icons.calendar_month,color: Color(0xff22263D),))),
        ),
        _space,
        AppText(
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
            child: Text(
              "A 1XX4, XXXXX XXXXX XXX, XXXXX XXXXX XXXXX, XXXXX - XXXXX, XXXXX - XXXX64, XXXXXXXXXX, XXXXX.",
              style: GoogleFonts.sourceSansPro(
                textStyle: const TextStyle(
                    color: Color(0xff22263D),
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    letterSpacing: 1),
              ),
            ),
          ),
        ),
        _space,
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {

                  if (  _addNomineeController.isAddressAdd.value == false) {
                    _addNomineeController.isAddressAdd.value = true;
                  } else {
                    _addNomineeController.isAddressAdd.value = false;
                  }
              },
              child: Obx(() => Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color:  _addNomineeController.isAddressAdd.value
                      ? Color(0xff22263D)
                      : Color(0xffC8C7CE),
                ),
              ),)
            ),
            SizedBox(width: 5,),
            DesableTitleText(
              title:"Got a different Address" ,

            ),
          ],
        ),
        _space,
   Obx(() =>      Visibility(
       visible:   _addNomineeController.isAddressAdd.value ,
       child: addNomineeAddressWidget()),),
        _space,
         InkWell(
          onTap: () {
            _addNomineeController.addNomineeDetail();
            // if (_kRAController.maidenName.text != "") {
            //   //isButtonClick.value = true;
            //
            //   _kRAController.update_personal_details();
            // }



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
              border: Border.all(
                  width: 2,
                /*  color: isButtonClick.value == false
                      ? (_kRAController.maidenName.text != "")
                      ? AppColors.textColor
                      : Color(0xffE1E0E6)
                      : Color(0xffFF405A)),*/
            /*  color:
              isButtonClick == false ? Colors.white : Color(0xffFF405A),*/
            )),
            child: Center(
                child: Text(
                  "Continue",
                  style: GoogleFonts.quicksand(
                    textStyle: TextStyle(
                     /*   color: isButtonClick.value == false
                            ? (_kRAController.maidenName.text != "")
                            ? AppColors.textColor
                            : Color(0xffE1E0E6)
                            : Colors.white,*/
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
                )),
          ),
        )
        ],
    );
  }

Widget addNomineeAddressWidget(){
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          title: 'Add New Address',
        ),
        _space1,
        Obx(() => AppTextField(
          textCapitalization: TextCapitalization.words,
          hint: 'ADDRESS LINE 1',
          controller: _addNomineeController.addressLine1.value,
          textInputType: TextInputType.text,
        )),
        _space,
        Obx(() => AppTextField(
          textCapitalization: TextCapitalization.words,
          hint: 'ADDRESS LINE 2',
          controller: _addNomineeController.addressLine2.value,
          textInputType: TextInputType.text,
        )),
        _space,
        AppText(
          title: 'Pincode',
        ),
        _space1,
        Obx(() => AppTextField(
          textCapitalization: TextCapitalization.words,
          hint: 'Enter PIN code',
          controller: _addNomineeController.pincode.value,
          textInputType: TextInputType.text,
        )),
        _space,
        AppText(
          title: 'Select State',
        ),
        _space1,
        Obx(()=>Container(
            height: 45,
            // width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border:
              Border.all(width: 1.1, color: AppColors.borderColor),
              color: Colors.white,
            ),
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    dropdownFullScreen: true,dropdownOverButton: true,

                    buttonWidth: double.infinity,
                    hint: const Text("Select State",
                        style: TextStyle(
                            color: Color(0xffC8C7CE), letterSpacing: 2)),
                    items: _addNomineeController.stateList.value.map((item) {
                      return DropdownMenuItem(

                        value: item.stateName,
                        child:  Text(
                          item.stateName,
                        ),
                      );
                    }).toList(),
                    onChanged:  (newValue) {
                      debugPrint("00000000000000000000000");
                      debugPrint(newValue.toString());
                    var a=  _addNomineeController.stateList.value.where((element) {
                        debugPrint(element.stateId.toString());
                        debugPrint("element.stateId.toString()");
                        if(element.stateName==newValue.toString()){
                          _addNomineeController.selectedStateId.value=element.stateId;
                        }
                        return true;
                      });
debugPrint(a.toString());
                      _addNomineeController.SelectedState.value= newValue.toString();
                      _addNomineeController.getCity();
                    },
                    value: _addNomineeController.SelectedState.value,
                  ),
                )))),

        _space,
       Obx(() => _addNomineeController.SelectedState.value!=null?AppText(
          title: 'Select City',
       ):Container()),
        Obx(() => _addNomineeController.SelectedState.value!=null?_space1:Container()),
        Obx(() => _addNomineeController.SelectedState.value!=null?
        Container(
            height: 45,
            // width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border:
              Border.all(width: 1.1, color: AppColors.borderColor),
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
                        child:  Text(
                          item.cityName,
                        ),
                      );
                    }).toList(),
                    onChanged:  (newValue) {
                      _addNomineeController.SelectedCity.value= newValue.toString();
                    },
                    value: _addNomineeController.SelectedCity.value,
                  ),
                )))
            :Container()
        ),
        _space,



      ],
    );
}

}
