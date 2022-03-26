import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Weather extends StatefulWidget {
  const Weather({Key key}) : super(key: key);

  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl:
            'https://bagong.pagasa.dost.gov.ph/climate/climate-monitoring#daily-rainfall-and-temperature',
      ),
    );
  }
}
