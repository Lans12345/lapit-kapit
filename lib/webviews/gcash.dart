import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GCash extends StatefulWidget {
  const GCash({Key key}) : super(key: key);

  @override
  _GCashState createState() => _GCashState();
}

class _GCashState extends State<GCash> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: 'https://www.globe.com.ph/apps-content/gcash.html',
      ),
    );
  }
}
