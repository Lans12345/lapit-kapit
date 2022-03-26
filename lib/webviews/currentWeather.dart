import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CurrentWeather extends StatefulWidget {
  const CurrentWeather({Key key}) : super(key: key);

  @override
  _CurrentWeatherState createState() => _CurrentWeatherState();
}

class _CurrentWeatherState extends State<CurrentWeather> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl:
            'https://www.msn.com/en-ph/weather/today/weather-today/we-city?el=XLgr7mE1SMnhr92cqD8kRO7BYnDanZNs7i5btTsunMStoNgLR6s6shFfYYHb1gvL&ocid=ansmsnweather',
      ),
    );
  }
}
