import 'package:flutter/material.dart';
import 'package:frontend/utils/home_screen_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Login/ui/login.dart';

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
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
        backgroundColor: Colors.black,
        key: _scaffoldKey,
        drawer: Drawer(
          child: Container(
            color: Colors.white,
            child: Stack(
              children: [
                Positioned(
                    top: 50,
                    left: 10,
                    right: 10,
                    child: Center(
                      child: Text(
                        "Shivam",
                        style: GoogleFonts.urbanist(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
                Positioned(
                    bottom: 40,
                    left: 5,
                    right: 5,
                    child: Center(
                        child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.black),
                            ),
                            onPressed: () {
                              logout();
                            },
                            child: Container(
                              padding:
                                  const EdgeInsets.fromLTRB(40, 20, 40, 20),
                              child: Text(
                                "Logout!",
                                style: GoogleFonts.urbanist(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ))))
              ],
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.grey.shade900,
                Colors.black
              ], // Adjust these colors
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 50,
                left: 20,
                right: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RichText(
                      textScaleFactor: 1.1,
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Ai",
                            style: GoogleFonts.urbanist(
                              fontWeight: FontWeight.w700,
                              fontSize: 27,
                              letterSpacing: 1.5,
                            ),
                          ),
                          TextSpan(
                            text: "F",
                            style: GoogleFonts.urbanist(
                                fontWeight: FontWeight.w700,
                                fontSize: 27,
                                letterSpacing: 1.5,
                                color: Color.fromRGBO(199, 178, 253,
                                    1)), // Change color as needed
                          ),
                          TextSpan(
                            text: "usion",
                            style: GoogleFonts.urbanist(
                              fontWeight: FontWeight.w700,
                              fontSize: 27,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _scaffoldKey.currentState!.openDrawer();
                      },
                      child: Icon(
                        Icons.clear_all_rounded,
                        color: Colors.grey.shade50,
                        size: 30,
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                  top: 120,
                  left: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Good " + greetUser() + "!",
                        style: GoogleFonts.urbanist(
                            color: Colors.white,
                            fontSize: 30,
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
                          height: 90,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color.fromRGBO(199, 178, 253, 1)),
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

              Positioned(
                top: 380,
                left: 20,
                child: Text(
                  "My Skills : ",
                  style: GoogleFonts.urbanist(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),

              Positioned(
                  top: 420,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    height: 225,
                    child: ListView.builder(
                      padding: EdgeInsets.all(0),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return HomeScreenimagesCard(
                          topic: 'React',
                          icon: Icon(
                            Icons.auto_awesome_mosaic,
                            size: 90,
                            color: Colors.grey,
                          ),
                        );
                      },
                    ),
                  )) // Positioned(
              //     top: 450,
              //     left: 0, // Add this line to specify the left position
              //     right: 0, // Add this line to specify the right position
              //     child: Row(
              //       children: [
              //         HomeScreenimagesCard(
              //           topic: 'React',
              //           icon: Icon(
              //             Icons.auto_awesome_mosaic,
              //             size: 90,
              //             color: Colors.grey,
              //           ),
              //         ),
              //         // SizedBox(
              //         //   width: 10,
              //         // ),
              //         HomeScreenimagesCard(
              //           topic: 'React',
              //           icon: Icon(
              //             Icons.auto_awesome_mosaic,
              //             size: 90,
              //             color: Colors.grey,
              //           ),
              //         ),
              //       ],
              //     ))
            ],
          ),
        ));
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('email'); // Clear the stored email
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginPageStudent()),
        (route) => false);
  }
}
