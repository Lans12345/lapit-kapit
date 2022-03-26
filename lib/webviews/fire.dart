import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Fire extends StatefulWidget {
  const Fire({Key key}) : super(key: key);

  @override
  _FireState createState() => _FireState();
}

class _FireState extends State<Fire> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl:
            'https://www.redcross.org/get-help/how-to-prepare-for-emergencies/types-of-emergencies/fire.html',
      ),
    );
  }
}
