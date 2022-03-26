import 'package:app/tabs/risk.dart';
import 'package:app/tools/screen.dart';
import 'package:app/webviews/hotline.dart';
import 'package:flutter/material.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:telephony/telephony.dart';

class DisasterTab extends StatefulWidget {
  const DisasterTab({Key key}) : super(key: key);

  @override
  _DisasterTabState createState() => _DisasterTabState();
}

final controller = PageController(initialPage: 0);

String location;

sendMailFire() async {
  String username = 'olanalans12345@gmail.com';
  String password = '123moviestf';

  final smtpServer = gmail(username, password);
  final message = Message()
    ..from = Address(username)
    ..recipients.add('olanalans12345@gmail.com')
    ..ccRecipients.addAll([
      'salazar.ladytrisha@gmail.com',
      'tresreyesalex@gmail.com',
      'lim.paulaerma@gmail.com'
    ])
//      ..bccRecipients.add(Address('bccAddress@example.com'))
    ..subject = 'EMERGENCY'
    ..text = 'This is the plain text.\nThis is line 2 of the text part.'
    ..html = "<h1>Asking for Fire Emergency in $location</h1>";

  try {
    final sendReport = await send(message, smtpServer);
    print('Message sent: ' + sendReport.toString());
  } on MailerException catch (e) {
    print(e);
    for (var p in e.problems) {
      print('Problem: ${p.code}: ${p.msg}');
    }
  }
}

sendMailPolice() async {
  String username = 'olanalans12345@gmail.com';
  String password = '123moviestf';

  final smtpServer = gmail(username, password);
  final message = Message()
    ..from = Address(username)
    ..recipients.add('olanalans12345@gmail.com')
//      ..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
//      ..bccRecipients.add(Address('bccAddress@example.com'))
    ..subject = 'EMERGENCY'
    ..text = 'This is the plain text.\nThis is line 2 of the text part.'
    ..html = "<h1>Asking for Police Emergency in $location</h1>";

  try {
    final sendReport = await send(message, smtpServer);
    print('Message sent: ' + sendReport.toString());
  } on MailerException catch (e) {
    print(e);
    for (var p in e.problems) {
      print('Problem: ${p.code}: ${p.msg}');
    }
  }
}

sendMailAmbulance() async {
  String username = 'olanalans12345@gmail.com';
  String password = '123moviestf';

  final smtpServer = gmail(username, password);
  final message = Message()
    ..from = Address(username)
    ..recipients.add('olanalans12345@gmail.com')
//      ..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
//      ..bccRecipients.add(Address('bccAddress@example.com'))
    ..subject = 'EMERGENCY'
    ..text = 'This is the plain text.\nThis is line 2 of the text part.'
    ..html = "<h1>Asking for Ambulance Rescue in $location</h1>";

  try {
    final sendReport = await send(message, smtpServer);
    print('Message sent: ' + sendReport.toString());
  } on MailerException catch (e) {
    print(e);
    for (var p in e.problems) {
      print('Problem: ${p.code}: ${p.msg}');
    }
  }
}

class _DisasterTabState extends State<DisasterTab> {
  final Telephony telephony = Telephony.instance;
  String datetime = DateTime.now().toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                color: Colors.red,
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 30),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Image(
                        height: 35,
                        image: AssetImage('lib/images/risk.png'),
                      ),
                      const SizedBox(width: 5),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => Risk()));
                        },
                        child: const Text(
                          'RISK MANAGEMENT',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              letterSpacing: 3.0,
                              color: Colors.white),
                        ),
                      )
                    ]),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Covid()));
                              },
                              child: Image(
                                height: 30,
                                image: AssetImage('lib/images/emergency.png'),
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              'EMERGENCY HOTLINE',
                              style: TextStyle(
                                  fontFamily: 'Quicksand',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 8.0,
                                  letterSpacing: 3.0,
                                  color: Colors.white),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    barrierDismissible: true,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                          title: const Text(
                                            '       TYPE OF EMERGENCY',
                                            style: TextStyle(
                                                fontFamily: 'Quicksand',
                                                color: Colors.red),
                                          ),
                                          actions: [
                                            Center(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        20, 0, 20, 0),
                                                child: RaisedButton(
                                                  onPressed: () async {
                                                    showDialog(
                                                      context: context,
                                                      barrierDismissible: true,
                                                      builder: (BuildContext
                                                              context) =>
                                                          AlertDialog(
                                                        title: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .fromLTRB(
                                                                  25, 0, 25, 0),
                                                          child: TextFormField(
                                                            onChanged:
                                                                (_location) {
                                                              location =
                                                                  _location;
                                                            },
                                                            decoration:
                                                                const InputDecoration(
                                                                    labelText:
                                                                        'Location',
                                                                    labelStyle:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'Quicksand',
                                                                      color: Colors
                                                                          .grey,
                                                                      fontSize:
                                                                          12.0,
                                                                    ),
                                                                    focusedBorder:
                                                                        UnderlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(color: Colors.grey))),
                                                          ),
                                                        ),
                                                        actions: [
                                                          Center(
                                                            child: RaisedButton(
                                                              onPressed: () {
                                                                // SMS
                                                                telephony.sendSms(
                                                                    to:
                                                                        '09090104355',
                                                                    message:
                                                                        'Date: $datetime,\n Location: $location,\n Emergency Type: Ambulance Rescue');

                                                                Navigator.of(
                                                                        context)
                                                                    .push(MaterialPageRoute(
                                                                        builder:
                                                                            (context) =>
                                                                                FirstScreen()));
                                                              },
                                                              child: const Text(
                                                                'Continue',
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'Quicksand',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .white,
                                                                    letterSpacing:
                                                                        2.0),
                                                              ),
                                                              color: Colors.red,
                                                              shape: const RoundedRectangleBorder(
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
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Image(
                                                          height: 20,
                                                          image: AssetImage(
                                                              'lib/images/ambulance.png'),
                                                        ),
                                                        const SizedBox(
                                                            width: 10),
                                                        const Text(
                                                          'AMBULANCE',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Quicksand',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.white,
                                                              letterSpacing:
                                                                  2.0),
                                                        ),
                                                      ]),
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
                                            ),
                                            Center(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        20, 0, 20, 0),
                                                child: RaisedButton(
                                                  onPressed: () async {
                                                    showDialog(
                                                      context: context,
                                                      barrierDismissible: true,
                                                      builder: (BuildContext
                                                              context) =>
                                                          AlertDialog(
                                                        title: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .fromLTRB(
                                                                  25, 0, 25, 0),
                                                          child: TextFormField(
                                                            onChanged:
                                                                (_location) {
                                                              location =
                                                                  _location;
                                                            },
                                                            decoration:
                                                                const InputDecoration(
                                                                    labelText:
                                                                        'Location',
                                                                    labelStyle:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'Quicksand',
                                                                      color: Colors
                                                                          .grey,
                                                                      fontSize:
                                                                          12.0,
                                                                    ),
                                                                    focusedBorder:
                                                                        UnderlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(color: Colors.grey))),
                                                          ),
                                                        ),
                                                        actions: [
                                                          Center(
                                                            child: RaisedButton(
                                                              onPressed: () {
                                                                // SMS
                                                                telephony.sendSms(
                                                                    to:
                                                                        '09090104355',
                                                                    message:
                                                                        'Date: $datetime,\n Location: $location,\n Emergency Type: Fire Rescue');

                                                                Navigator.of(
                                                                        context)
                                                                    .push(MaterialPageRoute(
                                                                        builder:
                                                                            (context) =>
                                                                                FirstScreen()));
                                                              },
                                                              child: const Text(
                                                                'Continue',
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'Quicksand',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .white,
                                                                    letterSpacing:
                                                                        2.0),
                                                              ),
                                                              color: Colors.red,
                                                              shape: const RoundedRectangleBorder(
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
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Image(
                                                          height: 20,
                                                          image: AssetImage(
                                                              'lib/images/fire.png'),
                                                        ),
                                                        const SizedBox(
                                                            width: 10),
                                                        const Text(
                                                          'FIRE',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Quicksand',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.white,
                                                              letterSpacing:
                                                                  2.0),
                                                        ),
                                                      ]),
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
                                            ),
                                            Center(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        20, 0, 20, 0),
                                                child: RaisedButton(
                                                  onPressed: () async {
                                                    showDialog(
                                                      context: context,
                                                      barrierDismissible: true,
                                                      builder: (BuildContext
                                                              context) =>
                                                          AlertDialog(
                                                        title: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .fromLTRB(
                                                                  25, 0, 25, 0),
                                                          child: TextFormField(
                                                            onChanged:
                                                                (_location) {
                                                              location =
                                                                  _location;
                                                            },
                                                            decoration:
                                                                const InputDecoration(
                                                                    labelText:
                                                                        'Location',
                                                                    labelStyle:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'Quicksand',
                                                                      color: Colors
                                                                          .grey,
                                                                      fontSize:
                                                                          12.0,
                                                                    ),
                                                                    focusedBorder:
                                                                        UnderlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(color: Colors.grey))),
                                                          ),
                                                        ),
                                                        actions: [
                                                          Center(
                                                            child: RaisedButton(
                                                              onPressed: () {
                                                                // SMS
                                                                telephony.sendSms(
                                                                    to:
                                                                        '09090104355',
                                                                    message:
                                                                        'Date: $datetime,\n Location: $location,\n Emergency Type: Police Rescue');

                                                                Navigator.of(
                                                                        context)
                                                                    .push(MaterialPageRoute(
                                                                        builder:
                                                                            (context) =>
                                                                                FirstScreen()));
                                                              },
                                                              child: const Text(
                                                                'Continue',
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'Quicksand',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .white,
                                                                    letterSpacing:
                                                                        2.0),
                                                              ),
                                                              color: Colors.red,
                                                              shape: const RoundedRectangleBorder(
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
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Image(
                                                          height: 20,
                                                          image: AssetImage(
                                                              'lib/images/police.png'),
                                                        ),
                                                        const SizedBox(
                                                            width: 10),
                                                        const Text(
                                                          'POLICE',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Quicksand',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.white,
                                                              letterSpacing:
                                                                  2.0),
                                                        ),
                                                      ]),
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
                                            ),
                                          ],
                                        ));
                              },
                              child: Image(
                                height: 30,
                                image: AssetImage(
                                    'lib/images/emergencyButton.png'),
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              'EMERGENCY BUTTON',
                              style: TextStyle(
                                  fontFamily: 'Quicksand',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 8.0,
                                  letterSpacing: 3.0,
                                  color: Colors.white),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(children: [
                        Image(
                          height: 20,
                          image: AssetImage('lib/images/currentWeather.png'),
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          'Current Weather',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0,
                              letterSpacing: 3.0,
                              color: Colors.red),
                        ),
                      ]),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      height: 250,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: WebView(
                          javascriptMode: JavascriptMode.unrestricted,
                          initialUrl:
                              'https://www.msn.com/en-ph/weather/today/weather-today/we-city?el=XLgr7mE1SMnhr92cqD8kRO7BYnDanZNs7i5btTsunMStoNgLR6s6shFfYYHb1gvL&ocid=ansmsnweather',
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.only(left: 25, right: 25),
                      child: Divider(
                        height: 20,
                        thickness: 2,
                        color: Colors.red,
                      ),
                    ),
                    Center(
                      child: Column(children: [
                        Image(
                          height: 30,
                          image: AssetImage('lib/images/update.png'),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'STAY UPDATED',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0,
                              letterSpacing: 3.0,
                              color: Colors.red),
                        ),
                      ]),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 25, right: 25),
                      child: Divider(
                        height: 20,
                        thickness: 2,
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(children: [
                        Image(
                          height: 20,
                          image: AssetImage('lib/images/weatherUpdate.png'),
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          'Weather Update',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0,
                              letterSpacing: 3.0,
                              color: Colors.red),
                        ),
                      ]),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      height: 250,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: WebView(
                          javascriptMode: JavascriptMode.unrestricted,
                          initialUrl:
                              'https://bagong.pagasa.dost.gov.ph/climate/climate-monitoring#daily-rainfall-and-temperature',
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 25, right: 25),
                      child: Divider(
                        height: 20,
                        thickness: 2,
                        color: Colors.red,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(children: [
                        Image(
                          height: 20,
                          image: AssetImage('lib/images/covid.png'),
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          'Covid-19 Update',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0,
                              letterSpacing: 3.0,
                              color: Colors.red),
                        ),
                      ]),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      height: 250,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: WebView(
                          javascriptMode: JavascriptMode.unrestricted,
                          initialUrl: 'https://www.covid19.gov.ph/',
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.only(left: 25, right: 25),
                      child: Divider(
                        height: 20,
                        thickness: 2,
                        color: Colors.red,
                      ),
                    ),
                    Center(
                      child: Column(children: [
                        Image(
                          height: 30,
                          image: AssetImage('lib/images/alert.png'),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'STAY ALERT',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0,
                              letterSpacing: 3.0,
                              color: Colors.red),
                        ),
                      ]),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 25, right: 25),
                      child: Divider(
                        height: 20,
                        thickness: 2,
                        color: Colors.red,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(children: [
                        Image(
                          height: 20,
                          image: AssetImage('lib/images/landslide.png'),
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          'Landslide Monitoring/Indicator',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0,
                              letterSpacing: 3.0,
                              color: Colors.red),
                        ),
                      ]),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      height: 250,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: WebView(
                          javascriptMode: JavascriptMode.unrestricted,
                          initialUrl:
                              'https://www.phivolcs.dost.gov.ph/index.php/landslide/introduction-to-landslide',
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.only(left: 25, right: 25),
                      child: Divider(
                        height: 20,
                        thickness: 2,
                        color: Colors.red,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(children: [
                        Image(
                          height: 20,
                          image: AssetImage('lib/images/flood.png'),
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          'Flood Monitoring/Indicator',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0,
                              letterSpacing: 3.0,
                              color: Colors.red),
                        ),
                      ]),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      height: 250,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: WebView(
                          javascriptMode: JavascriptMode.unrestricted,
                          initialUrl:
                              'https://bagong.pagasa.dost.gov.ph/learning-tools/floods',
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.only(left: 25, right: 25),
                      child: Divider(
                        height: 20,
                        thickness: 2,
                        color: Colors.red,
                      ),
                    ),
                    Center(
                      child: Column(children: [
                        Image(
                          height: 30,
                          image: AssetImage('lib/images/prevention.png'),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'PREVENTION',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0,
                              letterSpacing: 3.0,
                              color: Colors.red),
                        ),
                      ]),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 25, right: 25),
                      child: Divider(
                        height: 20,
                        thickness: 2,
                        color: Colors.red,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(children: [
                        Image(
                          height: 20,
                          image: AssetImage('lib/images/fire.png'),
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          'Fire Prevention',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0,
                              letterSpacing: 3.0,
                              color: Colors.red),
                        ),
                      ]),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      height: 250,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: WebView(
                          javascriptMode: JavascriptMode.unrestricted,
                          initialUrl:
                              'https://www.redcross.org/get-help/how-to-prepare-for-emergencies/types-of-emergencies/fire.html',
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.only(left: 25, right: 25),
                      child: Divider(
                        height: 20,
                        thickness: 2,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
            ]),
      ),
    );
  }
}

/* 
import 'package:cloud_firestore/cloud_firestore.dart';

Future writeData() async {
    final docUser = FirebaseFirestore.instance
        .collection('Risk')
        .doc(location);

    final json = {
      'location': location,
      
    };

    await docUser.set(json);
  } */
