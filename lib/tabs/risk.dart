import 'package:app/tools/screen.dart';
import 'package:app/webviews/covid19.dart';
import 'package:app/webviews/fire.dart';
import 'package:app/webviews/flood.dart';
import 'package:app/webviews/hotline.dart';
import 'package:app/webviews/landslide.dart';
import 'package:app/webviews/weather.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:telephony/telephony.dart';

class Risk extends StatefulWidget {
  const Risk({Key key}) : super(key: key);

  @override
  State<Risk> createState() => _RiskState();
}

class _RiskState extends State<Risk> {
  WebViewController controller;
  final Telephony telephony = Telephony.instance;
  String datetime = DateTime.now().toString();

  String location;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
          child: Container(
            color: Colors.red,
            height: 80,
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Image(
                  height: 35,
                  image: AssetImage('lib/images/risk.png'),
                ),
                const SizedBox(width: 5),
                const Text(
                  'RISK MANAGEMENT',
                  style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      letterSpacing: 3.0,
                      color: Colors.white),
                ),
              ]),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(1000),
                child: InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context) => AlertDialog(
                              title: const Text(
                                '       TYPE OF EMERGENCY',
                                style: TextStyle(
                                    fontFamily: 'Quicksand', color: Colors.red),
                              ),
                              actions: [
                                Center(
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                    child: RaisedButton(
                                      onPressed: () async {
                                        showDialog(
                                          context: context,
                                          barrierDismissible: true,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                            title: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      25, 0, 25, 0),
                                              child: TextFormField(
                                                onChanged: (_location) {
                                                  location = _location;
                                                },
                                                decoration:
                                                    const InputDecoration(
                                                        labelText: 'Location',
                                                        labelStyle: TextStyle(
                                                          fontFamily:
                                                              'Quicksand',
                                                          color: Colors.grey,
                                                          fontSize: 12.0,
                                                        ),
                                                        focusedBorder:
                                                            UnderlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .grey))),
                                              ),
                                            ),
                                            actions: [
                                              Center(
                                                child: RaisedButton(
                                                  onPressed: () {
                                                    // SMS
                                                    telephony.sendSms(
                                                        to: '09090104355',
                                                        message:
                                                            'Date: $datetime,\n Location: $location,\n Emergency Type: Ambulance Rescue');

                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                FirstScreen()));
                                                  },
                                                  child: const Text(
                                                    'Continue',
                                                    style: TextStyle(
                                                        fontFamily: 'Quicksand',
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                        letterSpacing: 2.0),
                                                  ),
                                                  color: Colors.red,
                                                  shape:
                                                      const RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          20))),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image(
                                              height: 20,
                                              image: AssetImage(
                                                  'lib/images/ambulance.png'),
                                            ),
                                            const SizedBox(width: 10),
                                            const Text(
                                              'AMBULANCE',
                                              style: TextStyle(
                                                  fontFamily: 'Quicksand',
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  letterSpacing: 2.0),
                                            ),
                                          ]),
                                      color: Colors.red,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                    child: RaisedButton(
                                      onPressed: () async {
                                        showDialog(
                                          context: context,
                                          barrierDismissible: true,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                            title: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      25, 0, 25, 0),
                                              child: TextFormField(
                                                onChanged: (_location) {
                                                  location = _location;
                                                },
                                                decoration:
                                                    const InputDecoration(
                                                        labelText: 'Location',
                                                        labelStyle: TextStyle(
                                                          fontFamily:
                                                              'Quicksand',
                                                          color: Colors.grey,
                                                          fontSize: 12.0,
                                                        ),
                                                        focusedBorder:
                                                            UnderlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .grey))),
                                              ),
                                            ),
                                            actions: [
                                              Center(
                                                child: RaisedButton(
                                                  onPressed: () {
                                                    // SMS
                                                    telephony.sendSms(
                                                        to: '09090104355',
                                                        message:
                                                            'Date: $datetime,\n Location: $location,\n Emergency Type: Fire Rescue');

                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                FirstScreen()));
                                                  },
                                                  child: const Text(
                                                    'Continue',
                                                    style: TextStyle(
                                                        fontFamily: 'Quicksand',
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                        letterSpacing: 2.0),
                                                  ),
                                                  color: Colors.red,
                                                  shape:
                                                      const RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          20))),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image(
                                              height: 20,
                                              image: AssetImage(
                                                  'lib/images/fire.png'),
                                            ),
                                            const SizedBox(width: 10),
                                            const Text(
                                              'FIRE',
                                              style: TextStyle(
                                                  fontFamily: 'Quicksand',
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  letterSpacing: 2.0),
                                            ),
                                          ]),
                                      color: Colors.red,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                    child: RaisedButton(
                                      onPressed: () async {
                                        showDialog(
                                          context: context,
                                          barrierDismissible: true,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                            title: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      25, 0, 25, 0),
                                              child: TextFormField(
                                                onChanged: (_location) {
                                                  location = _location;
                                                },
                                                decoration:
                                                    const InputDecoration(
                                                        labelText: 'Location',
                                                        labelStyle: TextStyle(
                                                          fontFamily:
                                                              'Quicksand',
                                                          color: Colors.grey,
                                                          fontSize: 12.0,
                                                        ),
                                                        focusedBorder:
                                                            UnderlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .grey))),
                                              ),
                                            ),
                                            actions: [
                                              Center(
                                                child: RaisedButton(
                                                  onPressed: () {
                                                    // SMS
                                                    telephony.sendSms(
                                                        to: '09090104355',
                                                        message:
                                                            'Date: $datetime,\n Location: $location,\n Emergency Type: Police Rescue');

                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                FirstScreen()));
                                                  },
                                                  child: const Text(
                                                    'Continue',
                                                    style: TextStyle(
                                                        fontFamily: 'Quicksand',
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                        letterSpacing: 2.0),
                                                  ),
                                                  color: Colors.red,
                                                  shape:
                                                      const RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          20))),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image(
                                              height: 20,
                                              image: AssetImage(
                                                  'lib/images/police.png'),
                                            ),
                                            const SizedBox(width: 10),
                                            const Text(
                                              'POLICE',
                                              style: TextStyle(
                                                  fontFamily: 'Quicksand',
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  letterSpacing: 2.0),
                                            ),
                                          ]),
                                      color: Colors.red,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                    ),
                                  ),
                                ),
                              ],
                            ));
                  },
                  child: Container(
                    color: Colors.red,
                    height: 80,
                    width: 80,
                    child: Center(
                      child: const Text(
                        'BUTTON',
                        style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                            letterSpacing: 3.0,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(1000),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Covid()));
                  },
                  child: Container(
                    color: Colors.red,
                    height: 80,
                    width: 80,
                    child: Center(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              height: 50,
                              image: AssetImage('lib/images/hotline.png'),
                            ),
                          ]),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Container(
              height: 280,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: WebView(
                  javascriptMode: JavascriptMode.unrestricted,
                  initialUrl:
                      'https://www.msn.com/en-ph/weather/today/weather-today/we-city?el=XLgr7mE1SMnhr92cqD8kRO7BYnDanZNs7i5btTsunMStoNgLR6s6shFfYYHb1gvL&ocid=ansmsnweather',
                ),
              ),
            ),
          ),
        ),
        Container(
          width: 325,
          height: 160,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Weather()));
                  },
                  child: Container(
                    color: Colors.teal,
                    height: 150,
                    width: 250,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          height: 80,
                          image: AssetImage('lib/images/weatherUpdate.png'),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'WEATHER',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              letterSpacing: 3.0,
                              color: Colors.white),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'UPDATE',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                              fontSize: 44.0,
                              letterSpacing: 3.0,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Covid19()));
                  },
                  child: Container(
                    color: Colors.amber,
                    height: 150,
                    width: 250,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          height: 80,
                          image: AssetImage('lib/images/covid.png'),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'COVID-19',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              letterSpacing: 3.0,
                              color: Colors.white),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'UPDATE',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                              fontSize: 44.0,
                              letterSpacing: 3.0,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Land()));
                  },
                  child: Container(
                    color: Colors.brown,
                    height: 150,
                    width: 250,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          height: 80,
                          image: AssetImage('lib/images/landslide.png'),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'LANDSLIDE',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              letterSpacing: 3.0,
                              color: Colors.white),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'MONITORING',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                              fontSize: 34.0,
                              letterSpacing: 3.0,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Flood()));
                  },
                  child: Container(
                    color: Colors.black,
                    height: 150,
                    width: 250,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          height: 80,
                          image: AssetImage('lib/images/flood.png'),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'FLOOD',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              letterSpacing: 3.0,
                              color: Colors.white),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'MONITORING',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                              fontSize: 34.0,
                              letterSpacing: 3.0,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Fire()));
                  },
                  child: Container(
                    color: Colors.blue,
                    height: 150,
                    width: 250,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          height: 80,
                          image: AssetImage('lib/images/fire.png'),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'FIRE',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              letterSpacing: 3.0,
                              color: Colors.white),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Prevention',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                              fontSize: 34.0,
                              letterSpacing: 3.0,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
      ],
    ));
  }
}
