  import 'package:get/get.dart';

class SignInController extends GetxController{
  RxInt phoneNumber = 0.obs;

  void singIn(){
    if(phoneNumber.value == null || phoneNumber.value.bitLength<10){
      Get.showSnackbar(const GetSnackBar(title: "Enter valid mobile number"));
    }else{

    }
  }



}