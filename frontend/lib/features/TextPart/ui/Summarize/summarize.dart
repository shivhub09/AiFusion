import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Summarize extends StatefulWidget {
  const Summarize({super.key});

  @override
  State<Summarize> createState() => _SummarizeState();
}

class _SummarizeState extends State<Summarize> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          "Summarize!",
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
