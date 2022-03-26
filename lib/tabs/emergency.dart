import 'package:app/tools/screen.dart';
import 'package:flutter/material.dart';

class EmergencyTab extends StatefulWidget {
  const EmergencyTab({Key key}) : super(key: key);

  @override
  _EmergencyTabState createState() => _EmergencyTabState();
}

class _EmergencyTabState extends State<EmergencyTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          'EMERGENCY',
          style: TextStyle(fontFamily: 'Quicksand'),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                const Text('ASK FOR EMERGENCY HELP',
                    style:
                        TextStyle(color: Colors.red, fontFamily: 'Quicksand')),
                const Padding(
                  padding: EdgeInsets.only(left: 25, right: 25),
                  child: Divider(
                    height: 20,
                    thickness: 2,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.help),
                        labelText: 'What?',
                        labelStyle: TextStyle(
                          fontFamily: 'Quicksand',
                          color: Colors.grey,
                          fontSize: 12.0,
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey))),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.maps_home_work_rounded),
                        labelText: 'Where?',
                        labelStyle: TextStyle(
                          fontFamily: 'Quicksand',
                          color: Colors.grey,
                          fontSize: 12.0,
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey))),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.timelapse_rounded),
                        labelText: 'When?',
                        labelStyle: TextStyle(
                          fontFamily: 'Quicksand',
                          color: Colors.grey,
                          fontSize: 12.0,
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey))),
                  ),
                ),
                const SizedBox(height: 80),
                const Text('EMERGENCY BUTTON',
                    style:
                        TextStyle(color: Colors.red, fontFamily: 'Quicksand')),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: RaisedButton(
                    color: Colors.red,
                    onPressed: () {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text(
                            'Request Sent!',
                            style: TextStyle(
                              fontFamily: 'Quicksand',
                            ),
                          ),
                          content: const Text(
                            'Wait for authorized authority to\narrive quickly as possible!',
                            style: TextStyle(
                                fontFamily: 'Quicksand', fontSize: 12.0),
                          ),
                          actions: [
                            Center(
                              child: RaisedButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => FirstScreen()));
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
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    child: const Icon(Icons.power_settings_new_rounded,
                        color: Colors.white),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
