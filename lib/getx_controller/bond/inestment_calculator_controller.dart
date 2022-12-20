import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trust_money/api/apiClient.dart';
import 'package:trust_money/utils/helper_widget/custom_snsckbar.dart';

import '../../model/bond/investment_caclulator_modal.dart';

class InvestmentCalculatorController extends GetxController{
  RxBool isLoading=true.obs;
RxInt bondNoValue=1.obs;
var investmentCalculatorModal=Rxn<InvestmentCalculatorModal>();



  void getInvestmentCalculatorData(String isinNo,int bondNo ,bool shouldPop)async{
    var response=await APiProvider().getInvestmentCalculatonResult(isinNo,bondNo);
    if(response !=null){
      investmentCalculatorModal.value=response;
      isLoading.value=false;
    }
    if(shouldPop ==true){
      Get.back();
    }
  }

void updateBondNumber(String isAddOrSub,String isinNo,){
    Get.dialog(Center(child: CircularProgressIndicator(),));
  isLoading.value=true;
    if(isAddOrSub=="Add"){
      bondNoValue.value++;
    }else if(isAddOrSub=="Sub"){
      if(bondNoValue.value==1){
        ShowCustomSnackBar().ErrorSnackBar("Number cannot less than 1");
      }else{
        bondNoValue.value--;
      }
    }
    getInvestmentCalculatorData(isinNo, bondNoValue.value,true);
}

}