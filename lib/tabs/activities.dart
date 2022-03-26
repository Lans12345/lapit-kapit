import 'package:app/tabs/donation.dart';
import 'package:app/tools/screen.dart';
import 'package:app/webviews/gcash.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ActivitiesTab extends StatefulWidget {
  const ActivitiesTab({Key key}) : super(key: key);

  @override
  _ActivitiesTabState createState() => _ActivitiesTabState();
}

final controller = PageController(initialPage: 0);

String what;
String when;
String where;
String donationNumber;
String goods;
String qty;
String whereToPickUp;
String nameOfDonatee;
String ContactNumberOfDonatee;
String name;
String contactNum;
int volunter;

Widget buildImage(String ayaneImage, int index) => Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      color: Colors.transparent,
      child: Image.asset(
        ayaneImage,
        fit: BoxFit.cover,
      ),
    );

sendMailVolunteer() async {
  String username = 'olanalans12345@gmail.com';
  String password = '123moviestf';

  final smtpServer = gmail(username, password);
  final message = Message()
    ..from = Address(username)
    ..recipients.add('olanalans12345@gmail.com')
//      ..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
//      ..bccRecipients.add(Address('bccAddress@example.com'))
    ..subject = 'VOLUNTEER'
    ..text = 'This is the plain text.\nThis is line 2 of the text part.'
    ..html =
        "<h1>Hi I am $name. I would like to Volunteer in your Activity. My Contact Number: $contactNum</h1>";

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

sendMailDonation() async {
  String username = 'olanalans12345@gmail.com';
  String password = '123moviestf';

  final smtpServer = gmail(username, password);
  final message = Message()
    ..from = Address(username)
    ..recipients.add('olanalans12345@gmail.com')
//      ..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
//      ..bccRecipients.add(Address('bccAddress@example.com'))
    ..subject = 'DONATION'
    ..text = 'This is the plain text.\nThis is line 2 of the text part.'
    ..html =
        "<h1>Hi I am $nameOfDonatee. I would like to donate a $qty pcs of $goods. Please pick up my donation here in $whereToPickUp. Call me: $ContactNumberOfDonatee</h1>";

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

class _ActivitiesTabState extends State<ActivitiesTab> {
  @override
  void initState() {
    getData();
  }

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('numberOfVolunteer', volunter);
    setState(() {
      volunter = prefs.getInt('numberOfVolunteer');
    });
  }

  final images = [
    'lib/images/cleanupdrive.jpg',
    'lib/images/cleanupdrive2.jpg',
    'lib/images/cleanupdrive3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    volunter ??= 0;
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/images/nature.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            backgroundColor: Colors.green,
            title: Container(
              color: Colors.green,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'ACTIVITIES',
                  style: GoogleFonts.paytoneOne(
                      textStyle: TextStyle(
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.bold,
                          letterSpacing: 5.0,
                          color: Colors.black)),
                ),
              ),
            ),
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
        ),
        body: TabBarView(
          children: [
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('Activities')
                    .doc('activity')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: new Text("Loading. . ."));
                  }
                  var userDocument = snapshot.data;
                  return SingleChildScrollView(
                    child: Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            Padding(
                              padding: EdgeInsets.only(left: 25, right: 25),
                              child: CarouselSlider.builder(
                                options: CarouselOptions(
                                  height: 220,
                                  enlargeCenterPage: true,
                                  enableInfiniteScroll: false,
                                  autoPlayInterval: const Duration(seconds: 2),
                                ),
                                itemCount: images.length,
                                itemBuilder: (context, index, realIndex) {
                                  final ayaneImage = images[index];

                                  return buildImage(ayaneImage, index);
                                },
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 25, right: 25),
                              child: Divider(
                                height: 20,
                                thickness: 2,
                                color: Colors.green,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 25, right: 25),
                              child: Text('What?',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12.0,
                                      fontFamily: 'Quicksand')),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 25, right: 25),
                              child: Text(userDocument['what'],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                    fontFamily: 'Quicksand',
                                  )),
                            ),
                            const SizedBox(height: 10),
                            const Padding(
                              padding: EdgeInsets.only(left: 25, right: 25),
                              child: Text('When?',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12.0,
                                    fontFamily: 'Quicksand',
                                  )),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 25, right: 25),
                              child: Text(userDocument['when'],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                    fontFamily: 'Quicksand',
                                  )),
                            ),
                            const SizedBox(height: 10),
                            const Padding(
                              padding: EdgeInsets.only(left: 25, right: 25),
                              child: Text('Where?',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12.0,
                                    fontFamily: 'Quicksand',
                                  )),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 25, right: 25),
                              child: Text(userDocument['where'],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                    fontFamily: 'Quicksand',
                                  )),
                            ),
                            const SizedBox(height: 10),
                            const Padding(
                              padding: EdgeInsets.only(left: 25, right: 25),
                              child: Text('Donation Number',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12.0,
                                    fontFamily: 'Quicksand',
                                  )),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 25, right: 25),
                              child: Text(userDocument['donationNumber'],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                    fontFamily: 'Quicksand',
                                  )),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: EdgeInsets.only(left: 50, right: 50),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text('Number of Volunteers: ',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12.0,
                                          fontFamily: 'Quicksand',
                                        )),
                                    Text('$volunter',
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.0,
                                          fontFamily: 'Quicksand',
                                        )),
                                    const SizedBox(width: 10),
                                    const Text('Funds Collected: ',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12.0,
                                          fontFamily: 'Quicksand',
                                        )),
                                    const Text('00.00',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.0,
                                          fontFamily: 'Quicksand',
                                        ))
                                  ]),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 50, right: 50),
                              child: RaisedButton(
                                color: Colors.green,
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                            title: const Text('VOLUNTEER',
                                                style: TextStyle(
                                                  fontFamily: 'Quicksand',
                                                )),
                                            content: Column(children: [
                                              TextFormField(
                                                onChanged: (myName) {
                                                  name = myName;
                                                },
                                                decoration:
                                                    const InputDecoration(
                                                        suffixIcon: IconButton(
                                                          icon: Icon(Icons
                                                              .man_rounded),
                                                        ),
                                                        labelText:
                                                            'Enter your Name',
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
                                              const SizedBox(height: 10),
                                              TextFormField(
                                                onChanged: (contact) {
                                                  contactNum = contact;
                                                },
                                                decoration:
                                                    const InputDecoration(
                                                        suffixIcon: IconButton(
                                                          icon: Icon(Icons
                                                              .phone_android_rounded),
                                                        ),
                                                        labelText:
                                                            'Enter your Mobile Number',
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
                                                maxLength: 11,
                                                keyboardType:
                                                    TextInputType.number,
                                              ),
                                            ]),
                                            backgroundColor: Colors.grey[200],
                                            actions: [
                                              Center(
                                                child: RaisedButton(
                                                  onPressed: () {
                                                    showDialog(
                                                        barrierColor:
                                                            Colors.white,
                                                        context: context,
                                                        barrierDismissible:
                                                            false,
                                                        builder:
                                                            (BuildContext
                                                                    context) =>
                                                                AlertDialog(
                                                                  title: const Text(
                                                                      'THANYOU!',
                                                                      style:
                                                                          TextStyle(
                                                                        fontFamily:
                                                                            'Quicksand',
                                                                      )),
                                                                  content: const Text(
                                                                      'See you at the Event!',
                                                                      style:
                                                                          TextStyle(
                                                                        fontFamily:
                                                                            'Quicksan',
                                                                      )),
                                                                  backgroundColor:
                                                                      Colors.grey[
                                                                          200],
                                                                  actions: [
                                                                    Center(
                                                                      child:
                                                                          RaisedButton(
                                                                        onPressed:
                                                                            () {
                                                                          volunter +=
                                                                              1;

                                                                          // Email for VOLUNTEER
                                                                          sendMailVolunteer();
                                                                          Navigator.of(context)
                                                                              .pushReplacement(MaterialPageRoute(builder: (_) => FirstScreen()));
                                                                        },
                                                                        child: const Text(
                                                                            'Continue',
                                                                            style:
                                                                                TextStyle(
                                                                              fontFamily: 'Quicksand',
                                                                              fontWeight: FontWeight.bold,
                                                                              color: Colors.white,
                                                                            )),
                                                                        color: Colors
                                                                            .green,
                                                                        shape: const RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.all(Radius.circular(20))),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ));
                                                  },
                                                  child: const Text('Continue',
                                                      style: TextStyle(
                                                        fontFamily: 'Quicksand',
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                      )),
                                                  color: Colors.green,
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
                                          ));
                                },
                                child: const Center(
                                    child: Text('VOLUNTEER',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Quicksand'))),
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 50, right: 50),
                              child: RaisedButton(
                                color: Colors.green,
                                onPressed: () {
                                  showDialog(
                                      barrierColor: Colors.white,
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                            backgroundColor: Colors.grey[200],
                                            actions: [
                                              Center(
                                                child: RaisedButton(
                                                  onPressed: () {
                                                    showDialog(
                                                        barrierColor:
                                                            Colors.white,
                                                        context: context,
                                                        barrierDismissible:
                                                            false,
                                                        builder:
                                                            (BuildContext
                                                                    context) =>
                                                                AlertDialog(
                                                                  backgroundColor:
                                                                      Colors.grey[
                                                                          200],
                                                                  actions: [
                                                                    Padding(
                                                                      padding:
                                                                          const EdgeInsets.fromLTRB(
                                                                              25,
                                                                              0,
                                                                              25,
                                                                              0),
                                                                      child:
                                                                          TextFormField(
                                                                        onChanged:
                                                                            (_goods) {
                                                                          goods =
                                                                              _goods;
                                                                        },
                                                                        decoration: const InputDecoration(
                                                                            suffixIcon: Icon(Icons.fastfood_rounded),
                                                                            labelText: 'Type of goods',
                                                                            labelStyle: TextStyle(
                                                                              fontFamily: 'Quicksand',
                                                                              color: Colors.grey,
                                                                              fontSize: 12.0,
                                                                            ),
                                                                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey))),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding:
                                                                          const EdgeInsets.fromLTRB(
                                                                              50,
                                                                              0,
                                                                              50,
                                                                              0),
                                                                      child:
                                                                          TextFormField(
                                                                        onChanged:
                                                                            (quan) {
                                                                          qty =
                                                                              quan;
                                                                        },
                                                                        decoration: const InputDecoration(
                                                                            suffixIcon: Icon(Icons.list_alt_rounded),
                                                                            labelText: 'Quantity',
                                                                            labelStyle: TextStyle(
                                                                              fontFamily: 'Quicksand',
                                                                              color: Colors.grey,
                                                                              fontSize: 12.0,
                                                                            ),
                                                                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey))),
                                                                        keyboardType:
                                                                            TextInputType.number,
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding:
                                                                          const EdgeInsets.fromLTRB(
                                                                              25,
                                                                              0,
                                                                              25,
                                                                              0),
                                                                      child:
                                                                          TextFormField(
                                                                        onChanged:
                                                                            (loc) {
                                                                          whereToPickUp =
                                                                              loc;
                                                                        },
                                                                        decoration: const InputDecoration(
                                                                            suffixIcon: Icon(Icons.maps_home_work_rounded),
                                                                            labelText: 'Where to pickup',
                                                                            labelStyle: TextStyle(
                                                                              fontFamily: 'Quicksand',
                                                                              color: Colors.grey,
                                                                              fontSize: 12.0,
                                                                            ),
                                                                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey))),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding:
                                                                          const EdgeInsets.fromLTRB(
                                                                              25,
                                                                              0,
                                                                              25,
                                                                              0),
                                                                      child:
                                                                          TextFormField(
                                                                        onChanged:
                                                                            (_name) {
                                                                          nameOfDonatee =
                                                                              _name;
                                                                        },
                                                                        decoration: const InputDecoration(
                                                                            suffixIcon: Icon(Icons.account_circle),
                                                                            labelText: 'Name of Donatee',
                                                                            labelStyle: TextStyle(
                                                                              fontFamily: 'Quicksand',
                                                                              color: Colors.grey,
                                                                              fontSize: 12.0,
                                                                            ),
                                                                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey))),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding:
                                                                          const EdgeInsets.fromLTRB(
                                                                              25,
                                                                              0,
                                                                              25,
                                                                              0),
                                                                      child:
                                                                          TextFormField(
                                                                        onChanged:
                                                                            (numberOfDonatee) {
                                                                          ContactNumberOfDonatee =
                                                                              numberOfDonatee;
                                                                        },
                                                                        decoration: const InputDecoration(
                                                                            suffixIcon: Icon(Icons.phone_android_rounded),
                                                                            labelText: 'Contact number of Donatee',
                                                                            labelStyle: TextStyle(
                                                                              fontFamily: 'Quicksand',
                                                                              color: Colors.grey,
                                                                              fontSize: 12.0,
                                                                            ),
                                                                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey))),
                                                                        keyboardType:
                                                                            TextInputType.number,
                                                                        maxLength:
                                                                            11,
                                                                      ),
                                                                    ),
                                                                    const SizedBox(
                                                                        height:
                                                                            10),
                                                                    const Padding(
                                                                      padding: EdgeInsets
                                                                          .fromLTRB(
                                                                              15,
                                                                              0,
                                                                              15,
                                                                              0),
                                                                    ),
                                                                    Center(
                                                                      child:
                                                                          RaisedButton(
                                                                        onPressed:
                                                                            () {
                                                                          showDialog(
                                                                              barrierColor: Colors.white,
                                                                              context: context,
                                                                              barrierDismissible: false,
                                                                              builder: (BuildContext context) => AlertDialog(
                                                                                    title: const Text('THANYOU FOR DONATING!',
                                                                                        style: TextStyle(
                                                                                          fontFamily: 'Quicksand',
                                                                                        )),
                                                                                    content: const Text('We will pick up soon your donations.',
                                                                                        style: TextStyle(
                                                                                          fontFamily: 'Quicksan',
                                                                                        )),
                                                                                    backgroundColor: Colors.grey[200],
                                                                                    actions: [
                                                                                      Center(
                                                                                        child: RaisedButton(
                                                                                          onPressed: () {
                                                                                            // EMAIL for in Kind Donation
                                                                                            sendMailDonation();
                                                                                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => FirstScreen()));
                                                                                          },
                                                                                          child: const Text('Continue',
                                                                                              style: TextStyle(
                                                                                                fontFamily: 'Quicksand',
                                                                                                fontWeight: FontWeight.bold,
                                                                                                color: Colors.white,
                                                                                              )),
                                                                                          color: Colors.green,
                                                                                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ));
                                                                        },
                                                                        child: const Text(
                                                                            'Continue',
                                                                            style:
                                                                                TextStyle(
                                                                              fontFamily: 'Quicksand',
                                                                              fontWeight: FontWeight.bold,
                                                                              color: Colors.white,
                                                                            )),
                                                                        color: Colors
                                                                            .green,
                                                                        shape: const RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.all(Radius.circular(20))),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ));
                                                  },
                                                  child: const Text('In Kind',
                                                      style: TextStyle(
                                                        fontFamily: 'Quicksand',
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                      )),
                                                  color: Colors.green,
                                                  shape:
                                                      const RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          20))),
                                                ),
                                              ),
                                              Center(
                                                child: RaisedButton(
                                                  onPressed: () {
                                                    showDialog(
                                                        barrierColor:
                                                            Colors.white,
                                                        context: context,
                                                        barrierDismissible:
                                                            false,
                                                        builder:
                                                            (BuildContext
                                                                    context) =>
                                                                AlertDialog(
                                                                  content:
                                                                      WebView(
                                                                    javascriptMode:
                                                                        JavascriptMode
                                                                            .unrestricted,
                                                                    initialUrl:
                                                                        'https://www.globe.com.ph/apps-content/gcash.html',
                                                                  ),
                                                                  backgroundColor:
                                                                      Colors.grey[
                                                                          200],
                                                                  actions: [
                                                                    Center(
                                                                      child:
                                                                          RaisedButton(
                                                                        onPressed:
                                                                            () {
                                                                          showDialog(
                                                                              barrierColor: Colors.white,
                                                                              context: context,
                                                                              barrierDismissible: false,
                                                                              builder: (BuildContext context) => AlertDialog(
                                                                                    title: const Text('THANYOU FOR DONATING!',
                                                                                        style: TextStyle(
                                                                                          fontFamily: 'Quicksand',
                                                                                        )),
                                                                                    backgroundColor: Colors.grey[200],
                                                                                    actions: [
                                                                                      Center(
                                                                                        child: RaisedButton(
                                                                                          onPressed: () {
                                                                                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => FirstScreen()));
                                                                                          },
                                                                                          child: const Text('Continue',
                                                                                              style: TextStyle(
                                                                                                fontFamily: 'Quicksand',
                                                                                                fontWeight: FontWeight.bold,
                                                                                                color: Colors.white,
                                                                                              )),
                                                                                          color: Colors.green,
                                                                                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ));
                                                                        },
                                                                        child: const Text(
                                                                            'Continue',
                                                                            style:
                                                                                TextStyle(
                                                                              fontFamily: 'Quicksand',
                                                                              fontWeight: FontWeight.bold,
                                                                              color: Colors.white,
                                                                            )),
                                                                        color: Colors
                                                                            .green,
                                                                        shape: const RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.all(Radius.circular(20))),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ));
                                                  },
                                                  child: const Text('In Fund',
                                                      style: TextStyle(
                                                        fontFamily: 'Quicksand',
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                      )),
                                                  color: Colors.green,
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
                                          ));
                                },
                                child: const Center(
                                    child: Text('DONATE',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Quicksand'))),
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                              ),
                            ),
                            const SizedBox(height: 20),
                          ]),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}



/* 

 Admin App
 
import 'package:cloud_firestore/cloud_firestore.dart';

Future writeData() async {
    final docUser = FirebaseFirestore.instance
        .collection('Activities')
        .doc(what);

    final json = {
      'what': what,
      'when': when,
      'where': where,
      'donationNumber': donationNumber,
    };

    await docUser.set(json);
  } */
