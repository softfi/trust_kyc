import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../api/apiClient.dart';
import '../../model/bond/bond_details_modal.dart';
class ReadMoreBond extends GetxController{
  Rx<BondDetails>? specificBondDataDetails ;

  RxList<BondCashflowDetail> bondCashflowdetails=List<BondCashflowDetail>.empty(growable: true).obs;

//RxList<BondDetails> bondDetails=List<BondDetails>.empty(growable: true).obs;

  void getReadMoreBondDetails(String isisnNo)async{
    var response=await APiProvider().getBondDetails(isisnNo);
    if(response !=null){
      BondDetails modal=response;
      specificBondDataDetails = modal.obs;
      bondCashflowdetails.value=modal.message.bondCashflowDetails;
      update();
    }
  }

@override
  void onInit() {
    update();
    // TODO: implement onInit
    super.onInit();
  }

}