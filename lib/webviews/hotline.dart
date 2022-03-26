import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Covid extends StatefulWidget {
  const Covid({Key key}) : super(key: key);

  @override
  _CovidState createState() => _CovidState();
}

class _CovidState extends State<Covid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: 'http://www.pnpcocpo.com/emergency/',
      ),
    );
  }
}
