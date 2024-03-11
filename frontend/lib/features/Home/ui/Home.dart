import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String greetUser() {
    final currentTime = DateTime.now();
    final hour = currentTime.hour;
    if (hour < 12) {
      return 'Morning';
    } else if (hour < 18) {
      return 'Afternoon';
    } else {
      return 'Evening';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Positioned(
              top: 45,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "AiFusion",
                    style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w700,
                        fontSize: 25,
                        color: Colors.white,
                        letterSpacing: 1.5),
                  ),
                  Icon(
                    Icons.notifications_none_outlined,
                    color: Colors.grey.shade50,
                    size: 30,
                  )
                ],
              ),
            ),
            Positioned(
                top: 120,
                left: 20,
                child: Column(
                  children: [
                    Text(
                      "Good " + greetUser() + "!",
                      style: GoogleFonts.urbanist(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Generate , Classify , Ask!",
                      style: GoogleFonts.urbanist(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                )),
            Positioned(
              top: 300,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Text("ji")),
            ),
            Positioned(
              top: 240,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    gradient: LinearGradient(
                      colors: [Colors.grey.shade900, Colors.black],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black38.withOpacity(0.4),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset:
                            const Offset(0, 3), // changes the shadow position
                      ),
                    ],
                  ),
                  height: 125,
                  width: 330,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "9 Images",
                            style: GoogleFonts.urbanist(
                                color: Colors.white, fontSize: 24),
                          ),
                          Text(
                            "Classified",
                            style: GoogleFonts.urbanist(
                                color: Colors.white, fontSize: 12),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 2,
                        height: 100,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "8 Text",
                            style: GoogleFonts.urbanist(
                                color: Colors.white, fontSize: 24),
                          ),
                          Text(
                            "Generated",
                            style: GoogleFonts.urbanist(
                                color: Colors.white, fontSize: 12),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
