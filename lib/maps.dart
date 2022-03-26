import 'package:app/tools/firstScreen.dart';
import 'package:app/tools/screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:app/firebase_options.dart';
import 'package:google_fonts/google_fonts.dart';

class Maps extends StatefulWidget {
  const Maps({Key key}) : super(key: key);

  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lapit Kapit',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(top: 50, bottom: 80),
                child: Center(
                  child: Image(
                    width: 100,
                    image: AssetImage('lib/images/cdologo.png'),
                  ),
                ),
              ),
              const Text('Choose your Location',
                  style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 200,
                  width: 300,
                  child: ListView(scrollDirection: Axis.horizontal, children: [
                    SizedBox(
                      width: 300,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => FirstScreen()));
                        },
                        child: Text(
                          'CARMEN',
                          style: GoogleFonts.quicksand(
                              textStyle: TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 40,
                            letterSpacing: 6.0,
                          )),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    SizedBox(
                      width: 300,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => FirstScreen()));
                        },
                        child: Text(
                          'IPONAN',
                          style: GoogleFonts.quicksand(
                              textStyle: TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 40,
                            letterSpacing: 6.0,
                          )),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    SizedBox(
                      width: 300,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => FirstScreen()));
                        },
                        child: Text(
                          'MACASANDIG',
                          style: GoogleFonts.quicksand(
                              textStyle: TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 40,
                            letterSpacing: 6.0,
                          )),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    SizedBox(
                      width: 300,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => FirstScreen()));
                        },
                        child: Text(
                          'BUGO',
                          style: GoogleFonts.quicksand(
                              textStyle: TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 40,
                            letterSpacing: 6.0,
                          )),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    SizedBox(
                      width: 300,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => FirstScreen()));
                        },
                        child: Text(
                          'PUNTOD',
                          style: GoogleFonts.quicksand(
                              textStyle: TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 40,
                            letterSpacing: 6.0,
                          )),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    SizedBox(
                      width: 300,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => FirstScreen()));
                        },
                        child: Text(
                          'LUMBIA',
                          style: GoogleFonts.quicksand(
                              textStyle: TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 40,
                            letterSpacing: 6.0,
                          )),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                  ]),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                ' <-----Swipe Left',
                style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 80),
              Center(
                child: Image(
                  width: 100,
                  image: AssetImage('lib/images/new1.png'),
                ),
              ),
            ]),
      ),
    );
  }
}
