import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../api/apiClient.dart';
import '../../model/bond/bond_list_modal.dart';

class BondListData extends GetxController{
  RxList<Output> bondList=List<Output>.empty(growable: true).obs;



  @override
  void onInit() {
    getAllBOndList();
    // TODO: implement onInit
    super.onInit();
  }

  void getAllBOndList()async{
    var response=await  APiProvider().bondList();
    if(response !=null){
      AllBondList modal=response;
      bondList.value=modal.message.output;
    }
    debugPrint(bondList.value.toString());
    debugPrint("bondList.value.toString()");
  }
}