import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';
import 'package:trust_money/api/apiClient.dart';
import 'package:trust_money/model/add_nominee_response_data.dart';
import 'package:trust_money/model/nominee_identify_dropdown_response_data.dart';
import 'package:trust_money/model/state_response_data.dart';
import 'package:trust_money/repositories/profile_repository.dart';
import 'package:trust_money/utils/helper_widget/custom_snsckbar.dart';

import '../../model/city_responsse_data.dart';
import '../../model/relationship_dropdown_response_data.dart';
import '../../repositories/nominee_repository.dart';

class AddNomineeController extends GetxController {
  Rx<TextEditingController> addressLine1 = TextEditingController().obs;
  Rx<TextEditingController> fullNomineeName = TextEditingController().obs;
  Rx<TextEditingController> addressLine2 = TextEditingController().obs;
  Rx<TextEditingController> pincode = TextEditingController().obs;
  RxList<RelationShipModel> relationShipList =
      List<RelationShipModel>.empty(growable: true).obs;
  Rxn<String>  relationshipID=Rxn() ;
  RxBool isAddressAdd = false.obs;
  Rxn<String> mrsValue = Rxn();
  RxBool addNominee = false.obs;
  RxInt addNomineeInt = 0.obs;
  RxList<NomineeIdentyModel> nomineeIdentifiactionList=List<NomineeIdentyModel>.empty(growable: true).obs;
  Rxn<String>  selectedNomineeIndentitiy=Rxn();
  Rx<TextEditingController> nominneeIdProof = TextEditingController().obs;
  Rx<TextEditingController> nominneeMobileNumber = TextEditingController().obs;
  RxList<String> items = [
    'Mrs.',
    'Mis.',
  ].obs;
  RxString Relationshipwithapplication = "".obs;
  Rx<DateTime> currentStartDate =
      DateTime.now().subtract(const Duration(days: 6574)).obs;
  RxString dob = "DD-MM-YYYY".obs;
RxList<GetStateModel>  stateList=List<GetStateModel>.empty(growable:true).obs;
RxList<GetCityModel>  cityList=List<GetCityModel>.empty(growable:true).obs;
Rxn SelectedState=Rxn();
Rxn SelectedCity=Rxn();
RxInt selectedStateId=0.obs;
RxInt selectedNomonneeIdentificationId=0.obs;

  @override
  void onInit() {
    getList();
    getState();
    relationshipList();
    super.onInit();
  }

  relationshipList() async {
    var data1 = await NomineeRepository().relationShip();
    if (data1 != null) {
      relationShipList.value = data1;
      debugPrint("======>13234343 $data1");
    }
  }

getList()async{
    var response=await NomineeRepository().nomineeProof();
    if(response !=null){
      nomineeIdentifiactionList.value=response;
    }
}

  void pickDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: currentStartDate.value,
        firstDate: DateTime(1900),
        lastDate: DateTime.now().subtract(const Duration(days: 6574)));
    if (pickedDate != null && pickedDate != currentStartDate) {
      currentStartDate.value = pickedDate;
      dob.value = DateFormat('dd-MM-yyyy').format(pickedDate);
      print("dob " + dob.toString());
    }
  }

getState()async{
    var response=await ProfileRepository().getState();
    if(response!=null){
      stateList.value=response;
    }
}

getCity()async{
    SelectedCity=Rxn();
    debugPrint(selectedStateId.value.toString());
    debugPrint("selectedStateId.value.toString()");
    var response=await ProfileRepository().getCity(selectedStateId.value.toString());
    if(response!=null){
      cityList.value=response;
    }
}

addNomineeDetail(void Function()? onClick1)async{
    if(mrsValue.value.toString()==null){
      ShowCustomSnackBar().ErrorSnackBar("Select title first");
    }else if(fullNomineeName.value.text.isEmpty){
      ShowCustomSnackBar().ErrorSnackBar("Enter name first");
    }else if(Relationshipwithapplication.value ==null){
      ShowCustomSnackBar().ErrorSnackBar("Enter relationship first");
    }else if(relationshipID.value ==null){
      ShowCustomSnackBar().ErrorSnackBar("Select identity first");
    }else if(nominneeIdProof.value.text.isEmpty){
      ShowCustomSnackBar().ErrorSnackBar("Enter identity number first");
    }else if(nominneeMobileNumber.value ==null){
      ShowCustomSnackBar().ErrorSnackBar("Enter mobile number  first");
    }else if(dob.value =="DD-MM-YYYY"){
      ShowCustomSnackBar().ErrorSnackBar("Select dob first");
    }else {
      Get.dialog(Center(child: CircularProgressIndicator(),));
      var response=await APiProvider().updateNomineeDetail();
      if(response !=null){
        onClick1!();
        Get.back();
        AddNomineeModel modla=response;
        ShowCustomSnackBar().SuccessSnackBar(modla.message.toString());
      }
    }

}

}
