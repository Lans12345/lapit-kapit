import 'package:app/tools/screen.dart';
import 'package:app/webviews/covid19.dart';
import 'package:app/webviews/currentWeather.dart';
import 'package:app/webviews/fire.dart';
import 'package:app/webviews/flood.dart';
import 'package:app/webviews/hotline.dart';
import 'package:app/webviews/landslide.dart';
import 'package:app/webviews/weather.dart';
import 'package:flutter/material.dart';
import 'package:telephony/telephony.dart';

class RiskManagement extends StatefulWidget {
  const RiskManagement({Key key}) : super(key: key);

  @override
  State<RiskManagement> createState() => _RiskManagementState();
}

class _RiskManagementState extends State<RiskManagement> {
  final Telephony telephony = Telephony.instance;
  String datetime = DateTime.now().toString();

  String location;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.red,
        title: Text(
          'RISK MANAGEMENT',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(children: [
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Covid()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  height: 50,
                  width: 300,
                  child: Center(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_ic_call,
                            color: Colors.red,
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            'EMERGENCY HOTLINE',
                            style: TextStyle(
                                fontFamily: 'Quicksand',
                                color: Colors.red,
                                fontSize: 16.0),
                          ),
                        ]),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CurrentWeather()));
              },
              child: Container(
                height: 120,
                width: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      height: 60,
                      image: AssetImage('lib/images/reportConcerns.png'),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'WEATHER',
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          color: Colors.black,
                          fontSize: 10.0),
                    ),
                    const Text(
                      'FORECAST',
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          color: Colors.black,
                          fontSize: 16.0),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 5),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Weather()));
              },
              child: Container(
                height: 120,
                width: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      height: 60,
                      image: AssetImage('lib/images/weather.png'),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'WEATHER',
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          color: Colors.black,
                          fontSize: 10.0),
                    ),
                    const Text(
                      'UPDATE',
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          color: Colors.black,
                          fontSize: 16.0),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Covid19()));
              },
              child: Container(
                height: 120,
                width: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      height: 60,
                      image: AssetImage('lib/images/covid.png'),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'COVID-19',
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          color: Colors.black,
                          fontSize: 10.0),
                    ),
                    const Text(
                      'UPDATE',
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          color: Colors.black,
                          fontSize: 16.0),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 5),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Fire()));
              },
              child: Container(
                height: 120,
                width: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      height: 60,
                      image: AssetImage('lib/images/fire.png'),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'FIRE',
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          color: Colors.black,
                          fontSize: 10.0),
                    ),
                    const Text(
                      'PREVENTION',
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          color: Colors.black,
                          fontSize: 16.0),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Land()));
              },
              child: Container(
                height: 120,
                width: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      height: 60,
                      image: AssetImage('lib/images/landslide.png'),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'LANDSLIDE',
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          color: Colors.black,
                          fontSize: 10.0),
                    ),
                    const Text(
                      'MONITORING',
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          color: Colors.black,
                          fontSize: 16.0),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 5),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Flood()));
              },
              child: Container(
                height: 120,
                width: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      height: 60,
                      image: AssetImage('lib/images/flood.png'),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'FLOOD',
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          color: Colors.black,
                          fontSize: 10.0),
                    ),
                    const Text(
                      'MONITORING',
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          color: Colors.black,
                          fontSize: 16.0),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
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
                                          padding: const EdgeInsets.fromLTRB(
                                              25, 0, 25, 0),
                                          child: TextFormField(
                                            onChanged: (_location) {
                                              location = _location;
                                            },
                                            decoration: const InputDecoration(
                                                labelText: 'Location',
                                                labelStyle: TextStyle(
                                                  fontFamily: 'Quicksand',
                                                  color: Colors.grey,
                                                  fontSize: 12.0,
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.grey))),
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
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                    letterSpacing: 2.0),
                                              ),
                                              color: Colors.red,
                                              shape:
                                                  const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
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
                                          padding: const EdgeInsets.fromLTRB(
                                              25, 0, 25, 0),
                                          child: TextFormField(
                                            onChanged: (_location) {
                                              location = _location;
                                            },
                                            decoration: const InputDecoration(
                                                labelText: 'Location',
                                                labelStyle: TextStyle(
                                                  fontFamily: 'Quicksand',
                                                  color: Colors.grey,
                                                  fontSize: 12.0,
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.grey))),
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
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                    letterSpacing: 2.0),
                                              ),
                                              color: Colors.red,
                                              shape:
                                                  const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
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
                                          image:
                                              AssetImage('lib/images/fire.png'),
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
                                          padding: const EdgeInsets.fromLTRB(
                                              25, 0, 25, 0),
                                          child: TextFormField(
                                            onChanged: (_location) {
                                              location = _location;
                                            },
                                            decoration: const InputDecoration(
                                                labelText: 'Location',
                                                labelStyle: TextStyle(
                                                  fontFamily: 'Quicksand',
                                                  color: Colors.grey,
                                                  fontSize: 12.0,
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.grey))),
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
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                    letterSpacing: 2.0),
                                              ),
                                              color: Colors.red,
                                              shape:
                                                  const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
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
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1000),
                    border: Border.all(color: Colors.red, width: 2),
                    color: Colors.white),
                height: 65,
                width: 65,
                child: Center(
                    child: Icon(
                  Icons.power_settings_new,
                  size: 45,
                  color: Colors.red,
                )),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
