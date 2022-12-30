import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trust_money/model/bond/bond_detail_modal_of_ipo_by_bond_id.dart';

import '../../api/apiClient.dart';
import '../../model/bond/bond_details_modal.dart';
class ReadMoreBond extends GetxController{
 var specificBondDataDetails =Rxn<BondDetails>();


 var allBondListOfIpoByBondId =Rxn<BondDetails>();
  RxList<BrokerageDetail> bondCashflowdetails=List<BrokerageDetail>.empty(growable: true).obs;


  void getReadMoreBondDetails(String isisnNo)async{
    var response=await APiProvider().getBondDetails(isisnNo);
    if(response !=null){
      BondDetails modal=response;
      specificBondDataDetails.value = modal;
      bondCashflowdetails.value=modal.bondBrokerageDetails;
    }
  }


  void getReadMoreBondDetailsByBondID(String bondId)async{
var response=await APiProvider().getBondDetailsByBondID(bondId);
if(response!=null){
  allBondListOfIpoByBondId.value =response;
  debugPrint("0000000000000000000000000000000000000000000000000000");
  debugPrint(allBondListOfIpoByBondId.value!.bondAllotmentDate.toString());
}


  }



}