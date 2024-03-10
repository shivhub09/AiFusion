import 'package:flutter/material.dart';

class ImageCaptioningScreen extends StatefulWidget {
  const ImageCaptioningScreen({super.key});

  @override
  State<ImageCaptioningScreen> createState() => _ImageCaptioningScreenState();
}

class _ImageCaptioningScreenState extends State<ImageCaptioningScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Image Captioning Screen"),),
    );
  }
}