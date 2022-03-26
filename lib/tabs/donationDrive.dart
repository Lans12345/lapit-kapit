import 'package:app/tools/screen.dart';
import 'package:app/webviews/gcash.dart';
import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:telephony/telephony.dart';

class DonationDrive extends StatefulWidget {
  const DonationDrive({Key key}) : super(key: key);

  @override
  State<DonationDrive> createState() => _DonationDriveState();
}

class _DonationDriveState extends State<DonationDrive> {
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

  final Telephony telephony = Telephony.instance;
  String datetime = DateTime.now().toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.amber,
        title: Text(
          'DONATION DRIVE',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) => SingleChildScrollView(
                        child: AlertDialog(
                          title: SingleChildScrollView(
                            child: Column(
                              children: [
                                Image(
                                  height: 45,
                                  image: AssetImage('lib/images/kind.png'),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 0, right: 0),
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
                                const Text('- Food, Clothes, Emergency Kit',
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
                                  padding: EdgeInsets.only(left: 25, right: 25),
                                  child: Divider(
                                    height: 20,
                                    thickness: 2,
                                    color: Colors.amber,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(25, 0, 25, 0),
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
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey))),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(50, 0, 50, 0),
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
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey))),
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(25, 0, 25, 0),
                                  child: TextFormField(
                                    onChanged: (pickup) {
                                      whereToPickUp = pickup;
                                    },
                                    decoration: const InputDecoration(
                                        suffixIcon:
                                            Icon(Icons.maps_home_work_rounded),
                                        labelText: 'Where to pickup',
                                        labelStyle: TextStyle(
                                          fontFamily: 'Quicksand',
                                          color: Colors.grey,
                                          fontSize: 12.0,
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey))),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(25, 0, 25, 0),
                                  child: TextFormField(
                                    onChanged: (_name) {
                                      nameOfDonatee = _name;
                                    },
                                    decoration: const InputDecoration(
                                        suffixIcon: Icon(Icons.account_circle),
                                        labelText: 'Name of Donatee',
                                        labelStyle: TextStyle(
                                          fontFamily: 'Quicksand',
                                          color: Colors.grey,
                                          fontSize: 12.0,
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey))),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(25, 0, 25, 0),
                                  child: TextFormField(
                                    onChanged: (_contactNum) {
                                      ContactNumberOfDonatee = _contactNum;
                                    },
                                    decoration: const InputDecoration(
                                        suffixIcon:
                                            Icon(Icons.phone_android_rounded),
                                        labelText: 'Contact number of Donatee',
                                        labelStyle: TextStyle(
                                          fontFamily: 'Quicksand',
                                          color: Colors.grey,
                                          fontSize: 12.0,
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey))),
                                    keyboardType: TextInputType.number,
                                    maxLength: 11,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 0, 15, 0),
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
                                                color: Colors.amber,
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
                  child: Container(
                    height: 120,
                    width: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          height: 60,
                          image: AssetImage('lib/images/kind.png'),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'DONATE',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              color: Colors.black,
                              fontSize: 10.0),
                        ),
                        const Text(
                          'IN KIND',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              color: Colors.black,
                              fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => GCash()));
                  },
                  child: Container(
                    height: 120,
                    width: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          height: 60,
                          image: AssetImage('lib/images/fund.png'),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'DONATE',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              color: Colors.black,
                              fontSize: 10.0),
                        ),
                        const Text(
                          'IN FUND',
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
            Container(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(''),
                    const Padding(
                      padding: EdgeInsets.only(left: 25, right: 25),
                      child: Divider(
                        height: 20,
                        thickness: 2,
                        color: Colors.amber,
                      ),
                    ),
                    Text('Street Children of CDO',
                        style: TextStyle(fontFamily: 'Quicksand')),
                    const Text('Donation Number: ',
                        style: TextStyle(fontFamily: 'Quicksand')),
                    Text('09090104355',
                        style: TextStyle(fontFamily: 'Quicksand')),
                    const SizedBox(height: 10),
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
                              color: Colors.black,
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
                    const Text(
                        "To Post Donations, Email us @lapitkapit@gmail.com: ",
                        style: TextStyle(
                            color: Colors.black, fontFamily: 'Quicksand')),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
