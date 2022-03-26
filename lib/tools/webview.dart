import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewGcash extends StatefulWidget {
  const WebviewGcash({Key key}) : super(key: key);

  @override
  _WebviewGcashState createState() => _WebviewGcashState();
}

class _WebviewGcashState extends State<WebviewGcash> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WebView(
        initialUrl: 'https://www.globe.com.ph/apps-content/gcash.html',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
