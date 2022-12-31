import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trust_money/getx_controller/profile/personal_details_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

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
  KRAController _kRAController = Get.find<KRAController>();

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

class MyWebView extends StatefulWidget {
  MyWebView({Key? key}) : super(key: key);

  @override
  State<MyWebView> createState() => _MyWebViewState();
}

class _MyWebViewState extends State<MyWebView> {
  late final WebViewController _controller;
  KRAController _kRAController = Get.find<KRAController>();

  @override
  void initState() {
    super.initState();

    // #docregion platform_features
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller =
    WebViewController.fromPlatformCreationParams(params);
    // #enddocregion platform_features

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            debugPrint('WebView is loading (progress : $progress%)');
          },
          onPageStarted: (String url) {
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            debugPrint('Page finished loading: $url');
            final uri = Uri.parse(url);
            final path = uri.path;
            if (path == "/callback") {
              debugPrint("calling function in callback");
              _kRAController.getDigilockerData();
              _personalDetailsController.getPersonalDetails();
              Navigator.pop(context);
              Navigator.pop(context);
              _personalDetailsController.isVisible.value= 6;
              // _personalDetailsController.isVisible.value = 3;
            }
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('''
Page resource error:
  code: ${error.errorCode}
  description: ${error.description}
  errorType: ${error.errorType}
  isForMainFrame: ${error.isForMainFrame}
          ''');
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              debugPrint('blocking navigation to ${request.url}');
              return NavigationDecision.prevent;
            }
            debugPrint('allowing navigation to ${request.url}');
            return NavigationDecision.navigate;
          },
        ),
      )
      ..addJavaScriptChannel(
        'Toaster',
        onMessageReceived: (JavaScriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        },
      )
      ..loadRequest(
        Uri.parse(
            _kRAController.urlLink.value.toString()
        ),
      );

    // #docregion platform_features
    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }
    // #enddocregion platform_features

    _controller = controller;
  }


  PersonalDetailsController _personalDetailsController =
      Get.find<PersonalDetailsController>();

  @override
  Widget build(BuildContext context) {
    debugPrint("onPageStarted9999999=============>${_kRAController.urlLink.value.toString()}");
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white, elevation: 0, leading: Container()),
      body:  WebViewWidget(controller: _controller)/*WebView(
        initialUrl: _kRAController.urlLink.value.toString(),
        //javascriptMode: JavascriptMode.unrestricted,
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
            debugPrint("calling function in callback");
            _kRAController.getDigilockerData();
            _personalDetailsController.getPersonalDetails();
            Navigator.pop(context);
            Navigator.pop(context);
            _personalDetailsController.isVisible.value= 6;
           // _personalDetailsController.isVisible.value = 3;
          }
        },
      ),*/
    );
  }
}
