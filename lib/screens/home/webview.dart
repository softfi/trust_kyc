import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trust_money/getx_controller/profile/personal_details_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../getx_controller/kra/kra_controller.dart';

/*class MyWebView extends StatefulWidget {
  const MyWebView({
    Key? key,
  }) : super(key: key);

  @override
  State<MyWebView> createState() => _MyWebViewState();
}

class _MyWebViewState extends State<MyWebView> {
  late final WebViewController webViewController;
  KRAController _kRAController = Get.put(KRAController());

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Builder(builder: (BuildContext context) {
            return Obx(() => WebView(
                  initialUrl: _kRAController.urlLink.value,
                  javascriptMode: JavascriptMode.unrestricted,
                  gestureNavigationEnabled: true,
                  backgroundColor: Colors.white,
                  onPageStarted: (url) {
                    debugPrint("onPageStarted=============>$url");
                  },
                  onPageFinished: (url) {
                    debugPrint("onPageStarted=============>$url");
                    final uri = Uri.parse(url);
                    final path = uri.path;
                    debugPrint("onPageStarted=============>$path");
                    if (path == "/callback") {
                      // Navigator.pop(context);
                      // Navigator.pop(context);
                      // Navigator.pop(context);
                      // _personalDetailsController.isVisible.value = 3;
                    }
                    */ /*final Map<String,String> params = uri.queryParameters;
                if(params.containsKey("code")){
                  print("code============>"+params["code"].toString());
                  if(params["code"].toString()=="6356a8aebdce4f484a8ab8fb3802197e2a4fdb7e"){
                    Navigator.pop(context);
                  }
                }*/ /*
                  },
                  onWebViewCreated: (controller) {
                    webViewController = controller;
                  },
                ));
          })),
    );
  }
}*/

class MyWebView extends StatelessWidget {
  MyWebView({Key? key}) : super(key: key);
  KRAController _kRAController = Get.put(KRAController());
  PersonalDetailsController _personalDetailsController =
      Get.put(PersonalDetailsController());

  @override
  Widget build(BuildContext context) {
    debugPrint("onPageStarted9999999=============>${_kRAController.urlLink.value.toString()}");
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white, elevation: 0, leading: Container()),
      body: WebView(
        initialUrl: _kRAController.urlLink.value.toString(),
        javascriptMode: JavascriptMode.unrestricted,
        gestureNavigationEnabled: true,
        backgroundColor: Colors.white,
        onPageStarted: (url) {
          debugPrint("onPageStarted=============>$url");
        },
        onPageFinished: (url) {
          debugPrint("onPageStarted12=============>$url");
          final uri = Uri.parse(url);
          final path = uri.path;
          if (path == "/callback") {
            _kRAController.getDigilockerData();
            _personalDetailsController.getPersonalDetails();
            Navigator.pop(context);
            Navigator.pop(context);
            _personalDetailsController.isVisible.value= 6;
           // _personalDetailsController.isVisible.value = 3;
          }
        },
      ),
    );
  }
}
