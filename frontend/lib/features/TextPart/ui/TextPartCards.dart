import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextPartWidget extends StatelessWidget {
  final String title;
  final TextStyle textStyle;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final IconData? iconData;
  final double? iconSize;

  TextPartWidget({
    Key? key,
    required this.title,
    this.textStyle = const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 22,
    ),
    this.padding = const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    this.margin = const EdgeInsets.all(8),
    this.iconData,
    this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Color> gradientColors = [Colors.grey.shade800, Colors.black];

    return Container(
      margin: margin,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: padding,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (iconData != null) ...[
              Icon(
                iconData,
                size: iconSize ?? 24,
                color: textStyle.color,
              ),
              SizedBox(width: 10),
            ],
            Text(
              title,
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}
