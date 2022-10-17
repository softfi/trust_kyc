import 'package:flutter/cupertino.dart';

class DeviceUtil {
  static void dismissKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static Widget emptySpace({double? height}) {
    return SizedBox(height: height ?? 10);
  }
}
