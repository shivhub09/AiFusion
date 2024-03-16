import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Generate extends StatefulWidget {
  const Generate({super.key});

  @override
  State<Generate> createState() => _GenerateState();
}

class _GenerateState extends State<Generate> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          "Generate!",
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