import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Flood extends StatefulWidget {
  const Flood({Key key}) : super(key: key);

  @override
  _FloodState createState() => _FloodState();
}

class _FloodState extends State<Flood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: 'https://bagong.pagasa.dost.gov.ph/learning-tools/floods',
      ),
    );
  }
}
