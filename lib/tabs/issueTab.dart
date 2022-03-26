import 'dart:io';
import 'package:app/tools/screen.dart';

import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:random_string/random_string.dart';
import 'dart:math' show Random;

import 'package:telephony/telephony.dart';

class IssueTab extends StatefulWidget {
  const IssueTab({Key key}) : super(key: key);

  @override
  _IssueTabState createState() => _IssueTabState();
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
  'lib/images/garbage.jpg',
  'lib/images/garbage2.jpg',
  'lib/images/garbage3.jpg',
];

String location;
String issue;
String description;
String name;
String contactNumber;
String uploadStatus = 'Not Uploaded';

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
    ..subject = 'CONCERN'
    ..text = 'This is the plain text.\nThis is line 2 of the text part.'
    ..html =
        "<h1>Hi I am $name. I would like to raise a concern here in $location because of $issue. My Contact Number: $contactNumber</h1>";

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

FirebaseStorage storage = FirebaseStorage.instance;

String _name;
String _location;
String _issue;
String _description;
String _contactNumber;

class _IssueTabState extends State<IssueTab> {
  String fileName;
  File imageFile;

  // Write Image
  Future<void> _upload(String inputSource) async {
    final picker = ImagePicker();
    XFile pickedImage;
    try {
      pickedImage = await picker.pickImage(
          source: inputSource == 'camera'
              ? ImageSource.camera
              : ImageSource.gallery,
          maxWidth: 1920);

      fileName = path.basename(pickedImage.path);
      imageFile = File(pickedImage.path);

      try {
        // Uploading the selected image with some custom meta data

        // Refresh the UI
        setState(() {
          uploadStatus = 'Uploaded Succesfully!';
        });
      } on FirebaseException catch (error) {
        if (kDebugMode) {
          print(error);
        }
      }
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }
  }

  // Read Image
  Future<List<Map<String, dynamic>>> _loadImages() async {
    List<Map<String, dynamic>> files = [];

    final ListResult result = await storage.ref().list();
    final List<Reference> allFiles = result.items;

    await Future.forEach<Reference>(allFiles, (file) async {
      final String fileUrl = await file.getDownloadURL();
      final FullMetadata fileMeta = await file.getMetadata();
      files.add({
        'url': fileUrl,
        'path': file.fullPath,
        'uploaded_by': fileMeta.customMetadata['uploaded_by'] ?? 'Empty',
        'location': fileMeta.customMetadata['location'] ?? 'Empty',
        'issue': fileMeta.customMetadata['issue'] ?? 'Empty',
        'description': fileMeta.customMetadata['description'] ?? 'Empty',
        'name': fileMeta.customMetadata['name'] ?? 'Empty',
        'contactNumber': fileMeta.customMetadata['contactNumber'] ?? 'Empty',
      });
    });
    return files;
  }

  String random = randomString(10);

  Future writeData() async {
    final docUser =
        FirebaseFirestore.instance.collection('Newsfeed').doc(issue);

    final json = {
      'location': location,
      'issue': issue,
      'description': description,
      'name': name,
      'contactNumber': contactNumber,
    };

    await docUser.set(json);
  }

  final Telephony telephony = Telephony.instance;
  String datetime = DateTime.now().toString();

  @override
  Widget build(BuildContext context) {
    uploadStatus ??= 'Not Uploaded';

    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(70),
            child: ClipRRect(
              child: AppBar(
                title: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        Image(
                          height: 45,
                          image: AssetImage('lib/images/newsfeed.png'),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'NEWSFEED',
                          style: GoogleFonts.quicksand(
                              textStyle: TextStyle(
                                  fontFamily: 'Quicksand',
                                  letterSpacing: 3.0,
                                  color: Colors.white)),
                        ),
                      ]),
                ),
                centerTitle: true,
                automaticallyImplyLeading: false,
              ),
            ),
          ),
          body: Center(
            child: PageView(
              controller: controller,
              scrollDirection: Axis.vertical,
              children: [
                Column(children: [
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
                      color: Colors.blue,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(children: [
                              const SizedBox(height: 10),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => IssueTab()));
                                },
                                child: Image(
                                  height: 30,
                                  image: AssetImage('lib/images/issue.png'),
                                ),
                              ),
                              Text(
                                'Posted Concerns',
                                style: TextStyle(
                                    fontFamily: 'Quicksand',
                                    fontSize: 8.0,
                                    color: Colors.white),
                              ),
                              const SizedBox(height: 10),
                            ]),
                            Container(
                                color: Colors.white, height: 70, width: 5),
                            Column(children: [
                              InkWell(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    barrierDismissible: true,
                                    builder: (BuildContext context) =>
                                        SingleChildScrollView(
                                      child: AlertDialog(
                                        title: Column(children: [
                                          SingleChildScrollView(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                const Text('Upload Image',
                                                    style: TextStyle(
                                                        fontFamily: 'Quicksand',
                                                        color: Colors.black,
                                                        fontSize: 12.0)),
                                                ElevatedButton.icon(
                                                    onPressed: () =>
                                                        _upload('camera'),
                                                    icon: const Icon(
                                                        Icons.camera),
                                                    label: const Text(
                                                        'Take Picture',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Quicksand',
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            letterSpacing:
                                                                2.0))),
                                                ElevatedButton.icon(
                                                    onPressed: () =>
                                                        _upload('gallery'),
                                                    icon: const Icon(
                                                        Icons.library_add),
                                                    label: const Text(
                                                        'Select from Gallery',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Quicksand',
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            letterSpacing:
                                                                2.0))),
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 25, right: 25),
                                                  child: Divider(
                                                    height: 20,
                                                    thickness: 2,
                                                    color: Colors.blue,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          25, 0, 25, 0),
                                                  child: TextFormField(
                                                    onChanged: (_location) {
                                                      location = _location;
                                                    },
                                                    decoration:
                                                        const InputDecoration(
                                                            suffixIcon: Icon(Icons
                                                                .maps_home_work_rounded),
                                                            labelText:
                                                                'Location',
                                                            labelStyle:
                                                                TextStyle(
                                                              fontFamily:
                                                                  'Quicksand',
                                                              color:
                                                                  Colors.grey,
                                                              fontSize: 12.0,
                                                            ),
                                                            focusedBorder: UnderlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .grey))),
                                                    maxLines: 2,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          25, 0, 25, 0),
                                                  child: TextFormField(
                                                    onChanged: (_issue) {
                                                      issue = _issue;
                                                    },
                                                    decoration:
                                                        const InputDecoration(
                                                            suffixIcon: Icon(Icons
                                                                .sync_problem_rounded),
                                                            labelText:
                                                                'Issue to Address',
                                                            labelStyle:
                                                                TextStyle(
                                                              fontFamily:
                                                                  'Quicksand',
                                                              color:
                                                                  Colors.grey,
                                                              fontSize: 12.0,
                                                            ),
                                                            focusedBorder: UnderlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .grey))),
                                                    maxLines: 2,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          25, 0, 25, 0),
                                                  child: TextFormField(
                                                    onChanged: (_description) {
                                                      description =
                                                          _description;
                                                    },
                                                    decoration:
                                                        const InputDecoration(
                                                            suffixIcon: Icon(Icons
                                                                .description_rounded),
                                                            labelText:
                                                                'Description',
                                                            labelStyle:
                                                                TextStyle(
                                                              fontFamily:
                                                                  'Quicksand',
                                                              color:
                                                                  Colors.grey,
                                                              fontSize: 12.0,
                                                            ),
                                                            focusedBorder: UnderlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .grey))),
                                                    maxLines: 3,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          25, 0, 25, 0),
                                                  child: TextFormField(
                                                    onChanged: (_name) {
                                                      name = _name;
                                                    },
                                                    decoration:
                                                        const InputDecoration(
                                                            suffixIcon: Icon(Icons
                                                                .account_circle),
                                                            labelText:
                                                                'Your name',
                                                            labelStyle:
                                                                TextStyle(
                                                              fontFamily:
                                                                  'Quicksand',
                                                              color:
                                                                  Colors.grey,
                                                              fontSize: 12.0,
                                                            ),
                                                            focusedBorder: UnderlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .grey))),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          25, 0, 25, 0),
                                                  child: TextFormField(
                                                    onChanged: (_number) {
                                                      contactNumber = _number;
                                                    },
                                                    decoration:
                                                        const InputDecoration(
                                                            suffixIcon: Icon(Icons
                                                                .phone_android_rounded),
                                                            labelText:
                                                                'Your Contact Number',
                                                            labelStyle:
                                                                TextStyle(
                                                              fontFamily:
                                                                  'Quicksand',
                                                              color:
                                                                  Colors.grey,
                                                              fontSize: 12.0,
                                                            ),
                                                            focusedBorder: UnderlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .grey))),
                                                    keyboardType:
                                                        TextInputType.number,
                                                    maxLength: 11,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          15, 0, 15, 0),
                                                  child: RaisedButton(
                                                    color: Colors.blue,
                                                    onPressed: () {
                                                      showDialog(
                                                          context: context,
                                                          barrierDismissible:
                                                              true,
                                                          builder: (BuildContext
                                                                  context) =>
                                                              AlertDialog(
                                                                title:
                                                                    const Text(
                                                                  'REPORT POSTED!',
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        'Quicksand',
                                                                  ),
                                                                ),
                                                                content:
                                                                    const Text(
                                                                  'Your concern is sent directly to your Barangay Hall.',
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          'Quicksand',
                                                                      fontSize:
                                                                          12.0),
                                                                ),
                                                                actions: [
                                                                  Center(
                                                                    child:
                                                                        RaisedButton(
                                                                      onPressed:
                                                                          () async {
                                                                        await storage.ref(fileName).putFile(
                                                                            imageFile,
                                                                            SettableMetadata(customMetadata: {
                                                                              'location': location,
                                                                              'issue': issue,
                                                                              'description': description,
                                                                              'name': name,
                                                                              'contactNumber': contactNumber
                                                                            }));
                                                                        // Email
                                                                        setState(
                                                                            () {
                                                                          uploadStatus =
                                                                              'Not Uploaded';
                                                                        });

                                                                        telephony.sendSms(
                                                                            to:
                                                                                '09090104355',
                                                                            message:
                                                                                'Concern: $issue,\n Location: $location,\n Name of Citizen: $name,\n Contact Number of Citizen: $contactNumber');
                                                                        //writeData();
                                                                        Navigator.of(context).push(MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                FirstScreen()));
                                                                      },
                                                                      child:
                                                                          const Text(
                                                                        'Continue',
                                                                        style: TextStyle(
                                                                            fontFamily:
                                                                                'Quicksand',
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            color: Colors.white,
                                                                            letterSpacing: 2.0),
                                                                      ),
                                                                      color: Colors
                                                                          .blue,
                                                                      shape: const RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.all(Radius.circular(20))),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ));
                                                    },
                                                    child: const Text('REPORT',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontFamily:
                                                                'Quicksand')),
                                                    shape: const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    20))),
                                                  ),
                                                ),
                                                const SizedBox(height: 20),
                                              ],
                                            ),
                                          ),
                                        ]),
                                      ),
                                    ),
                                  );
                                },
                                child: Image(
                                  height: 30,
                                  image: AssetImage('lib/images/report.png'),
                                ),
                              ),
                              Text(
                                'Report Concerns',
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
                  ),
                  Expanded(
                    child: FutureBuilder(
                      future: _loadImages(),
                      builder: (context,
                          AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return ListView.builder(
                            itemCount: snapshot.data?.length ?? 0,
                            itemBuilder: (context, index) {
                              final Map<String, dynamic> image =
                                  snapshot.data[index];

                              return Column(children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                              image['url'],
                                            ),
                                            fit: BoxFit.fitWidth,
                                            alignment: Alignment(-0.3, 0)),
                                      ),
                                      child: Container(
                                        height: 200.0,
                                        decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                              colors: [
                                                Colors.transparent,
                                                Colors.black
                                              ],
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              stops: [0.2, 1]),
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(height: 30),
                                              Row(children: [
                                                Image(
                                                  height: 20,
                                                  image: AssetImage(
                                                      'lib/images/profile.png'),
                                                ),
                                                const SizedBox(width: 5),
                                                Text(image['name'],
                                                    style:
                                                        GoogleFonts.quicksand(
                                                      textStyle: const TextStyle(
                                                          fontFamily:
                                                              'Permanent Marker',
                                                          fontSize: 12.0,
                                                          color: Colors.white),
                                                    )),
                                              ]),
                                              Row(children: [
                                                Image(
                                                  height: 20,
                                                  image: AssetImage(
                                                      'lib/images/risk.png'),
                                                ),
                                                const SizedBox(width: 5),
                                                Text(image['issue'],
                                                    style:
                                                        GoogleFonts.quicksand(
                                                      textStyle: const TextStyle(
                                                          fontFamily:
                                                              'Permanent Marker',
                                                          fontSize: 28.0,
                                                          color: Colors.white),
                                                    )),
                                              ]),
                                              Row(children: [
                                                Image(
                                                  height: 20,
                                                  image: AssetImage(
                                                      'lib/images/location.png'),
                                                ),
                                                const SizedBox(width: 5),
                                                Text(image['location'],
                                                    style:
                                                        GoogleFonts.quicksand(
                                                      textStyle: const TextStyle(
                                                          fontFamily:
                                                              'Permanent Marker',
                                                          fontSize: 12.0,
                                                          color: Colors.white),
                                                    )),
                                              ]),
                                              const SizedBox(height: 5),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ]);
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(left: 25, right: 25),
                                      child: Divider(
                                        height: 20,
                                        thickness: 2,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            right: 20, left: 20),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          child: Image(
                                              image:
                                                  NetworkImage(image['url'])),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(50, 0, 50, 0),
                                      child: Center(
                                        child: Text(image['issue'],
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Quicksand')),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(50, 0, 50, 0),
                                      child: Center(
                                        child: Text('- ' + image['description'],
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 16.0,
                                                fontFamily: 'Quicksand')),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(50, 0, 50, 0),
                                      child: Center(
                                        child: Text('Location',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12.0,
                                                fontFamily: 'Quicksand')),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(50, 0, 50, 0),
                                      child: Center(
                                        child: Text(image['location'],
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 16.0,
                                                fontFamily: 'Quicksand')),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(50, 0, 50, 0),
                                      child: Center(
                                        child: Text('Posted by:',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12.0,
                                                fontFamily: 'Quicksand')),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(50, 0, 50, 0),
                                      child: Center(
                                        child: Text(image['name'],
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 16.0,
                                                fontFamily: 'Quicksand')),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(50, 0, 50, 0),
                                      child: Center(
                                        child: Text(image['contactNumber'],
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 16.0,
                                                fontFamily: 'Quicksand')),
                                      ),
                                    ),
                                    const SizedBox(height: 30),
                                  ]);
                            },
                          );
                        }

                        return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.blue,
                          ),
                        );
                      },
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ));
  }
}


/* 
import 'package:cloud_firestore/cloud_firestore.dart';

Future writeData() async {
    final docUser = FirebaseFirestore.instance
        .collection('Newsfeed')
        .doc(issue);

    final json = {
      'location': location,
      'issue': issue,
      'description': description,
      'name': name,
      'contactNumber': contactNumber,
    };

    await docUser.set(json);
  } */


