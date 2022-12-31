import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trust_money/model/bond/bond_detail_modal_of_ipo_by_bond_id.dart';

import '../../api/apiClient.dart';
import '../../model/bond/gold_bond.dart';

class ReadMoreBondDetails extends GetxController{
  //var specificBondDataDetails =Rxn<BondDetails>();


  var allBondListOfIpoByBondId =Rxn<AllBondListOfIpoByBondId>();
  var goldBondDetails =Rxn<GoldBondDetails>();
  // RxList<BrokerageDetail> bondCashflowdetails=List<BrokerageDetail>.empty(growable: true).obs;



  RxList<BondBrokerageDetail> bondBrokerageDetail=List<BondBrokerageDetail>.empty(growable: true).obs;

  RxList<GoldBondBenefit> goldBondBenefit=List<GoldBondBenefit>.empty(growable: true).obs;


  void getReadMoreBondDetails(String isisnNo)async{
    var response=await APiProvider().getBondDetails(isisnNo);
    if(response !=null){
      AllBondListOfIpoByBondId modal=response;
      allBondListOfIpoByBondId.value =response;
      // specificBondDataDetails.value = modal;
      bondBrokerageDetail.value=modal.bondBrokerageDetails;
    }
  }
  void getGoldBondDetails(String isisnNo)async{
    debugPrint("lalalalala");
    var response=await APiProvider().getGoldBondDetail(isisnNo);

    debugPrint("response====>"+response.toString());
    if(response !=null){
      GoldBondDetails modal=response;
      goldBondDetails.value =modal;
      goldBondBenefit.value= modal.bondBenefits;
      debugPrint("response====>"+goldBondBenefit.value[0].bondBenefitsDescription.toString());

      // specificBondDataDetails.value = modal;

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