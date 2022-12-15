  import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController{
  RxInt phoneNumber = 0.obs;

  void singIn(){
    if(phoneNumber.value == null || phoneNumber.value.bitLength<10){
      Get.showSnackbar( GetSnackBar(messageText: Text("Enter valid mobile number")));
    }else{

    }
  }



}