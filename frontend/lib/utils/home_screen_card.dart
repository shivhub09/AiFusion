import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreenimagesCard extends StatefulWidget {
  final String topic;
  final Icon icon;
  const HomeScreenimagesCard({required this.topic, required this.icon});

  @override
  State<HomeScreenimagesCard> createState() => _HomeScreenimagesCardState();
}

class _HomeScreenimagesCardState extends State<HomeScreenimagesCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 225,
      width: 175,
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
            offset: const Offset(0, 3), // changes the shadow position
          ),
        ],
      ),
      child: Stack(
        children: [
          Center(child: widget.icon),
          Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Center(
                  child: Text(
                widget.topic,
                style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 18,
                    letterSpacing: 1.4,
                    fontWeight: FontWeight.w300),
              )))
        ],
      ),
    );
  }
}
