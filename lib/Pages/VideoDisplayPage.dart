import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VideoDisplayPage extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
    return Scaffold(
      body: WebView(
        
        initialUrl: "https://8th.io/6a492",
    ),
    );
  }
//Use QR code to get
}