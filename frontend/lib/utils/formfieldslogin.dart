import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewFormFields extends StatefulWidget {
  final String text;
  final TextEditingController _controller;
  const NewFormFields(this.text, this._controller);
  @override
  State<NewFormFields> createState() => _NewFormFieldsState();
}

class _NewFormFieldsState extends State<NewFormFields> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: TextField(
        controller: widget._controller,
        style: GoogleFonts.urbanist(color: Colors.white),
        decoration: InputDecoration(
          labelText: widget.text,
          labelStyle: GoogleFonts.urbanist(color: Colors.white),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white, // Border color when not selected
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(18)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromRGBO(
                    1, 1, 24, 10), // Border color when not selected
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
}
