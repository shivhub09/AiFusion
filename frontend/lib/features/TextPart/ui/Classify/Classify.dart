import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Classify extends StatefulWidget {
  const Classify({super.key});

  @override
  State<Classify> createState() => _ClassifyState();
}

class _ClassifyState extends State<Classify> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          "Classify!",
          style: GoogleFonts.urbanist(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
