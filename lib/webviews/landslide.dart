import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Land extends StatefulWidget {
  const Land({Key key}) : super(key: key);

  @override
  _LandState createState() => _LandState();
}

class _LandState extends State<Land> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl:
            'https://www.phivolcs.dost.gov.ph/index.php/landslide/introduction-to-landslide',
      ),
    );
  }
}
