import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';


class OpinionsWebView extends StatefulWidget {
  @override
  _OpinionsWebViewState createState() => _OpinionsWebViewState();
}

class _OpinionsWebViewState extends State<OpinionsWebView> {

  final Completer<WebViewController> _controller = Completer<WebViewController>();
  WebViewController _myController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: WebView(
          initialUrl: 'https://ureport.in/opinions/',
          javascriptMode: JavascriptMode.unrestricted,

        navigationDelegate: (NavigationRequest request) {


          if (request.url.contains('facebook.com/')) {
            print('blocking navigation to request');
            return NavigationDecision.prevent;
          }
          if (request.url.contains('messenger')) {
            print('blocking navigation to request');
            return NavigationDecision.prevent;
          }

          print('allowing navigation to $request');
          return NavigationDecision.navigate;
        },


          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
            _myController = webViewController;
          },

        onPageFinished: (String url) {
          print('Page finished loading: $url');
          _myController.evaluateJavascript("document.getElementById(\"facebook\").style.display='none';");
        },
        )
    );
  }
}
