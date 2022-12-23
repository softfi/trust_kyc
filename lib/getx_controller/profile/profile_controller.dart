import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/sharedPreference.dart';

class ProfileController extends GetxController {
  RxInt selectedIndex = 0.obs;
  RxBool barLine = false.obs;
  RxBool tabVisible = true.obs;
  var tabController = Rxn<TabController>();
}
