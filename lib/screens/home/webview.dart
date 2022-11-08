import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWebView extends StatefulWidget {
  const MyWebView({Key? key, required this.url}) : super(key: key);
  final String url;

  @override
  State<MyWebView> createState() => _MyWebViewState();
}

class _MyWebViewState extends State<MyWebView> {

  late final WebViewController webViewController;

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
            return WebView(
              initialUrl: widget.url,
              javascriptMode: JavascriptMode.unrestricted,
              gestureNavigationEnabled: true,
              backgroundColor: const Color(0x00ffffff),
              onPageStarted: (url){
                print("onPageStarted=============>"+url);
                /*https://trust-api.trustmony.com/callback?code=6356a8aebdce4f484a8ab8fb3802197e2a4fdb7e&state=5,mobile*/
              },
              onPageFinished: (url){
                print("onPageFinished=============>"+url);
                final uri = Uri.parse(url);
                final path= uri.path;
                print("path===============$path");
                if(path=="/callback"){
                  Navigator.pop(context);
                  Navigator.pop(context);
                }
                /*final Map<String,String> params = uri.queryParameters;
                if(params.containsKey("code")){
                  print("code============>"+params["code"].toString());
                  if(params["code"].toString()=="6356a8aebdce4f484a8ab8fb3802197e2a4fdb7e"){
                    Navigator.pop(context);
                  }
                }*/
              },
              onWebViewCreated: (controller){
                webViewController = controller;
              },
            );
          })),
    );
  }
}
