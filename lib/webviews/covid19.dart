import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Covid19 extends StatefulWidget {
  const Covid19({Key key}) : super(key: key);

  @override
  _Covid19State createState() => _Covid19State();
}

class _Covid19State extends State<Covid19> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: 'https://www.covid19.gov.ph/',
      ),
    );
  }
}
