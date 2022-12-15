

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KRAController extends GetxController {
  RxInt isVisible = 1.obs;
  RxBool isRTR = false.obs;
  RxInt isRTRInt = 0.obs;
  RxBool isGenderSelect = false.obs;
  RxBool isMaritalSelect = false.obs;
  RxBool isEnComeSelect = false.obs;
  RxBool isExperienceSelect = false.obs;


  var maidenName = TextEditingController();

}