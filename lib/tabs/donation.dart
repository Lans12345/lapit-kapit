import 'package:app/tabs/activities.dart';
import 'package:app/tabs/issueTab.dart';
import 'package:app/tools/screen.dart';

import 'package:app/webviews/gcash.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:telephony/telephony.dart';

class DonationTab extends StatefulWidget {
  const DonationTab({Key key}) : super(key: key);

  @override
  _DonationTabState createState() => _DonationTabState();
}

final controller = PageController(initialPage: 0);

Widget buildImage(String ayaneImage, int index) => Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      color: Colors.transparent,
      child: Image.asset(
        ayaneImage,
        fit: BoxFit.cover,
      ),
    );

final images = [
  'lib/images/streetchildren.jpg',
  'lib/images/streetchildren2.jpg',
  'lib/images/streetchildren3.png',
];

String goods;
String qty;
String whereToPickUp;
String nameOfDonatee;
String ContactNumberOfDonatee;

sendMail() async {
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

class _DonationTabState extends State<DonationTab> {
  final Telephony telephony = Telephony.instance;
  String datetime = DateTime.now().toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(0), bottomRight: Radius.circular(0)),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.amber,
            title: Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Image(
                  height: 45,
                  image: AssetImage('lib/images/donate.png'),
                ),
                const SizedBox(width: 10),
                Text(
                  'DONATE',
                  style: GoogleFonts.quicksand(
                    textStyle: TextStyle(
                        fontFamily: 'Quicksand',
                        letterSpacing: 3.0,
                        color: Colors.white),
                  ),
                ),
              ]),
            ),
            centerTitle: true,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: Divider(
                height: 5,
                thickness: 1,
                color: Colors.white,
              ),
            ),
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20)),
              child: Container(
                height: 60,
                color: Colors.amber,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(children: [
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) =>
                                SingleChildScrollView(
                              child: AlertDialog(
                                title: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Image(
                                        height: 45,
                                        image:
                                            AssetImage('lib/images/kind.png'),
                                      ),
                                      const Padding(
                                        padding:
                                            EdgeInsets.only(left: 0, right: 0),
                                        child: Divider(
                                          height: 20,
                                          thickness: 2,
                                          color: Colors.amber,
                                        ),
                                      ),
                                      const Text('Donation in kind: ',
                                          style: TextStyle(
                                              color: Colors.amber,
                                              fontFamily: 'Quicksand')),
                                      const Text(''),
                                      const Text(
                                          '- Food, Clothes, Emergency Kit',
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.amber,
                                              fontFamily: 'Quicksand')),
                                      const Text(
                                          '- Medicines, and other basic needs.',
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.amber,
                                              fontFamily: 'Quicksand')),
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            left: 25, right: 25),
                                        child: Divider(
                                          height: 20,
                                          thickness: 2,
                                          color: Colors.amber,
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            25, 0, 25, 0),
                                        child: TextFormField(
                                          onChanged: (_goods) {
                                            goods = _goods;
                                          },
                                          decoration: const InputDecoration(
                                              suffixIcon:
                                                  Icon(Icons.fastfood_rounded),
                                              labelText: 'Type of goods',
                                              labelStyle: TextStyle(
                                                fontFamily: 'Quicksand',
                                                color: Colors.grey,
                                                fontSize: 12.0,
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.grey))),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            50, 0, 50, 0),
                                        child: TextFormField(
                                          onChanged: (_qty) {
                                            qty = _qty;
                                          },
                                          decoration: const InputDecoration(
                                              suffixIcon:
                                                  Icon(Icons.list_alt_rounded),
                                              labelText: 'Quantity',
                                              labelStyle: TextStyle(
                                                fontFamily: 'Quicksand',
                                                color: Colors.grey,
                                                fontSize: 12.0,
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.grey))),
                                          keyboardType: TextInputType.number,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            25, 0, 25, 0),
                                        child: TextFormField(
                                          onChanged: (pickup) {
                                            whereToPickUp = pickup;
                                          },
                                          decoration: const InputDecoration(
                                              suffixIcon: Icon(
                                                  Icons.maps_home_work_rounded),
                                              labelText: 'Where to pickup',
                                              labelStyle: TextStyle(
                                                fontFamily: 'Quicksand',
                                                color: Colors.grey,
                                                fontSize: 12.0,
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.grey))),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            25, 0, 25, 0),
                                        child: TextFormField(
                                          onChanged: (_name) {
                                            nameOfDonatee = _name;
                                          },
                                          decoration: const InputDecoration(
                                              suffixIcon:
                                                  Icon(Icons.account_circle),
                                              labelText: 'Name of Donatee',
                                              labelStyle: TextStyle(
                                                fontFamily: 'Quicksand',
                                                color: Colors.grey,
                                                fontSize: 12.0,
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.grey))),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            25, 0, 25, 0),
                                        child: TextFormField(
                                          onChanged: (_contactNum) {
                                            ContactNumberOfDonatee =
                                                _contactNum;
                                          },
                                          decoration: const InputDecoration(
                                              suffixIcon: Icon(
                                                  Icons.phone_android_rounded),
                                              labelText:
                                                  'Contact number of Donatee',
                                              labelStyle: TextStyle(
                                                fontFamily: 'Quicksand',
                                                color: Colors.grey,
                                                fontSize: 12.0,
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.grey))),
                                          keyboardType: TextInputType.number,
                                          maxLength: 11,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            15, 0, 15, 0),
                                        child: RaisedButton(
                                          color: Colors.amber,
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              barrierDismissible: false,
                                              builder: (BuildContext context) =>
                                                  AlertDialog(
                                                title: const Text(
                                                  'THANKYOU FOR DONATING!',
                                                  style: TextStyle(
                                                    fontFamily: 'Quicksand',
                                                  ),
                                                ),
                                                content: const Text(
                                                  'Donation request sent to Local Authorities in your Community.\nPrepare your donation for pickup.',
                                                  style: TextStyle(
                                                      fontFamily: 'Quicksand',
                                                      fontSize: 12.0),
                                                ),
                                                actions: [
                                                  Center(
                                                    child: RaisedButton(
                                                      onPressed: () {
                                                        // EMAIL
                                                        telephony.sendSms(
                                                            to: '09090104355',
                                                            message:
                                                                'Donation: $goods,\n Quantity: $qty,\n Pick Up Location: $whereToPickUp,\n Donatee by: $nameOfDonatee,\n Contact Number: $ContactNumberOfDonatee');
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
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
                                                                FontWeight.bold,
                                                            color: Colors.white,
                                                            letterSpacing: 2.0),
                                                      ),
                                                      color: Colors.amber,
                                                      shape: const RoundedRectangleBorder(
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
                                          child: const Text(
                                            'Donate',
                                            style: TextStyle(
                                                letterSpacing: 2.0,
                                                color: Colors.white,
                                                fontFamily: 'Quicksand'),
                                          ),
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30.0)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        child: Image(
                          height: 30,
                          image: AssetImage('lib/images/kind.png'),
                        ),
                      ),
                      Text(
                        'Donate in Kind',
                        style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 8.0,
                            color: Colors.white),
                      )
                    ]),
                    Container(color: Colors.white, height: 70, width: 5),
                    Column(children: [
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => GCash()));
                        },
                        child: Image(
                          height: 30,
                          image: AssetImage('lib/images/fund.png'),
                        ),
                      ),
                      Text(
                        'Donate in Fund',
                        style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 8.0,
                            color: Colors.white),
                      )
                    ]),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text("This Month's purpose for donations: ",
                style: TextStyle(color: Colors.amber, fontFamily: 'Quicksand')),
            const Text(''),
            Text('Street Children of CDO',
                style: TextStyle(fontFamily: 'Quicksand')),
            const Text('Donation Number: ',
                style: TextStyle(fontFamily: 'Quicksand')),
            Text('09090104355', style: TextStyle(fontFamily: 'Quicksand')),
            const Padding(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: Divider(
                height: 20,
                thickness: 2,
                color: Colors.amber,
              ),
            ),
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

                  return ClipRRect(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      child: buildImage(ayaneImage, index));
                },
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: Text(
                  'WHO Street Children Project aims at improving the health, welfare and quality of life of street children. The focus of the project is on developing the capacity of local organizations to prevent, assess and manage psychoactive substance use problems among street children. Through extensive research and training activities and as a contribution to local capacity building, WHO developed a training package for street educators. The contents of the package constitute an inventory of basic factors that are key in implementing interventions targeting street children in relation to substance use, sexual reproductive health and HIV/AIDS, and STDs.',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.0,
                      fontFamily: 'Quicksand')),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: Divider(
                height: 20,
                thickness: 2,
                color: Colors.amber,
              ),
            ),
            const Text("To Post Donations, Email us @lapitkapit@gmail.com: ",
                style: TextStyle(color: Colors.amber, fontFamily: 'Quicksand')),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

Future browse({
  @required String url,
  bool inApp = false,
}) async {
  if (await canLaunch(url)) {
    await launch(url, forceSafariVC: true, forceWebView: inApp);
  }
}



/* 
import 'package:cloud_firestore/cloud_firestore.dart';

Future writeData() async {
    final docUser = FirebaseFirestore.instance
        .collection('Donation')
        .doc(nameOfDonatee);

    final json = {
      'goods': goods,
      'qty': qty,
      'whereToPickUp': whereToPickUp,
      'nameOfDonatee': nameOfDonatee,
      'ContactNumberOfDonatee': ContactNumberOfDonatee,
    };

    await docUser.set(json);
  } */
