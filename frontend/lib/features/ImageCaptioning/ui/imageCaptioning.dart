import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImageCaptioningScreen extends StatefulWidget {
  const ImageCaptioningScreen({super.key});

  @override
  State<ImageCaptioningScreen> createState() => _ImageCaptioningScreenState();
}

class _ImageCaptioningScreenState extends State<ImageCaptioningScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              logout();
              // Navigator.push(context, )
            },
            child: Text("logout")),
      ),
    );
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('email'); // Clear the stored email
  }
}
