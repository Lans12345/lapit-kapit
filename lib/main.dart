import 'package:app/tabs/donationDrive.dart';

import 'package:app/tabs/newsfeed.dart';

import 'package:app/tabs/riskManagement.dart';
import 'package:app/tools/firstScreen.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Screen()));
}

class Main extends StatefulWidget {
  const Main({Key key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  int _currentIndex = 0;
  final tabs = [Newsfeed(), DonationDrive(), RiskManagement()];
  final items = <Widget>[
    Icon(Icons.attach_file_rounded, size: 30.0, color: Colors.blue[700]),
    Icon(Icons.volunteer_activism_rounded, size: 30.0, color: Colors.amber),
    Icon(Icons.warning_rounded, size: 30.0, color: Colors.red[700]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: tabs[_currentIndex],
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BottomNavigationBar(
                unselectedItemColor: Colors.grey,
                type: BottomNavigationBarType.shifting,
                iconSize: 25,
                currentIndex: _currentIndex,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.attach_file_rounded,
                      color: Colors.white,
                    ),
                    label: 'Newsfeed',
                    backgroundColor: Colors.blue,
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.volunteer_activism_rounded,
                        color: Colors.white,
                      ),
                      backgroundColor: Colors.amber,
                      label: 'Donation'),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.warning,
                        color: Colors.white,
                      ),
                      backgroundColor: Colors.red,
                      label: 'Risk'),
                ],
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
          ),
        ));
  }
}

/*
  import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Youtube Test App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {

  sendMail() async {
    String username = 'youremailid@gmail.com';
    String password = 'enteryourpassword';

    final smtpServer = gmail(username, password);
    final message = Message()
      ..from = Address(username)
      ..recipients.add('recipient@gmail.com')
//      ..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
//      ..bccRecipients.add(Address('bccAddress@example.com'))
      ..subject = 'Mail using mailer package :: 😀 :: ${DateTime.now()}'
      ..text = 'This is the plain text.\nThis is line 2 of the text part.'
      ..html = "<h1>Write the content here</h1>\n<p>Hey! its easy use html tags for alignments</p>";

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
      Toast.show("You have clicked the Button! and email sent", context, duration: 3, gravity:  Toast.CENTER);
    } on MailerException catch (e) {
      print('Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: MaterialButton(
          onPressed: sendMail,
          splashColor: Colors.blueGrey,
          color: Colors.blue,
          child: Text('click',style: TextStyle(color: Colors.black,
              fontSize: 20.0),
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
*/
